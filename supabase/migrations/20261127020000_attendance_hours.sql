-- Attendance hours: check in only from 9:00 to 9:30 AM and check out only
-- from 6:00 to 8:00 PM, Bangkok time. Each workplace has its own hours,
-- which you can change in the Table Editor.
-- A shift that isn't checked out by the deadline becomes a missed check-out
-- the next time the employee checks in, so it never blocks the next day.
-- Run once in the SQL Editor after 20261127010000_attendance.sql.

alter table public.workplaces
  add column check_in_from time not null default '09:00',
  add column check_in_until time not null default '09:30',
  add column check_out_from time not null default '18:00',
  add column check_out_until time not null default '20:00',
  add constraint workplaces_hours_check check (
    check_in_from < check_in_until
    and check_in_until <= check_out_from
    and check_out_from < check_out_until
  );

alter table public.shifts
  add column missed_check_out boolean not null default false;

-- A missed check-out no longer counts as an open check-in.
drop index public.shifts_one_open_idx;
create unique index shifts_one_open_idx
  on public.shifts (employee_id)
  where end_at is null and not missed_check_out;

-- Times like 9:00 AM for messages.
create function public.clock_label(t time)
returns text language sql stable set search_path = '' as $$
  select to_char(date '2000-01-01' + t, 'FMHH12:MI AM');
$$;

create or replace function public.check_in(
  lat double precision,
  lng double precision,
  accuracy double precision default null)
returns public.shifts
language plpgsql security definer set search_path = '' as $$
declare
  me text := public.current_employee_id();
  local_now timestamp := now() at time zone 'Asia/Bangkok';
  place record;
  saved public.shifts;
begin
  if me is null then
    raise exception 'Only active employees can check in.';
  end if;
  if lat is null or lng is null
     or lat not between -90 and 90
     or lng not between -180 and 180 then
    raise exception 'Turn on location to check in.';
  end if;
  if accuracy is not null and accuracy > 150 then
    raise exception 'Your location isn''t accurate enough yet. Wait a moment outdoors and try again.';
  end if;

  -- The nearest active workplace.
  select w.id, w.name, w.radius_m, w.check_in_from, w.check_in_until,
         public.distance_m(lat, lng, w.latitude, w.longitude) as distance
    into place
    from public.workplaces w
   where w.active
   order by 6
   limit 1;
  if not found then
    raise exception 'No workplace is set up for check-in.';
  end if;

  if local_now::time < place.check_in_from
     or local_now::time > place.check_in_until then
    raise exception 'Check-in is open from % to %.',
      public.clock_label(place.check_in_from),
      public.clock_label(place.check_in_until);
  end if;
  if place.distance > place.radius_m then
    raise exception 'Check in at %. You''re about % km away.',
      place.name, round((place.distance / 1000)::numeric, 1);
  end if;

  -- Shifts from earlier days that were never checked out.
  update public.shifts s
     set missed_check_out = true
   where s.employee_id = me
     and s.end_at is null
     and not s.missed_check_out
     and s.work_date < local_now::date;

  if exists (select 1 from public.shifts s
             where s.employee_id = me
               and s.end_at is null and not s.missed_check_out) then
    raise exception 'You''re already checked in.';
  end if;
  if exists (select 1 from public.shifts s
             where s.employee_id = me and s.work_date = local_now::date) then
    raise exception 'You''ve already checked in today.';
  end if;

  insert into public.shifts (
    employee_id, start_at, workplace_id,
    check_in_latitude, check_in_longitude, check_in_accuracy_m,
    check_in_distance_m)
  values (
    me, now(), place.id, lat, lng, accuracy,
    round(place.distance::numeric, 1))
  returning * into saved;
  return saved;
end;
$$;

create or replace function public.check_out()
returns public.shifts
language plpgsql security definer set search_path = '' as $$
declare
  me text := public.current_employee_id();
  local_now timestamp := now() at time zone 'Asia/Bangkok';
  open_shift public.shifts;
  allowed record;
  saved public.shifts;
begin
  if me is null then
    raise exception 'Only active employees can check out.';
  end if;
  select * into open_shift
    from public.shifts s
   where s.employee_id = me and s.end_at is null and not s.missed_check_out;
  if not found then
    raise exception 'You''re not checked in.';
  end if;
  if open_shift.work_date < local_now::date then
    raise exception 'You didn''t check out on %. Ask HR to record your check-out.',
      to_char(open_shift.work_date, 'FMDD FMMonth YYYY');
  end if;

  select w.check_out_from, w.check_out_until into allowed
    from public.workplaces w
   where w.id = open_shift.workplace_id;
  if found and local_now::time < allowed.check_out_from then
    raise exception 'Check-out opens at %.', public.clock_label(allowed.check_out_from);
  end if;
  if found and local_now::time > allowed.check_out_until then
    raise exception 'Check-out closed at %. Ask HR to record your check-out.',
      public.clock_label(allowed.check_out_until);
  end if;

  update public.shifts s
     set end_at = now()
   where s.id = open_shift.id
  returning * into saved;
  return saved;
end;
$$;

revoke execute on function public.clock_label(time) from public, anon, authenticated;

-- Attendance: check in only at Rangsit University, check out anywhere.
-- Times come from the database clock, the attendance day uses Asia/Bangkok,
-- and hours are calculated from the saved times.
-- Run once in the SQL Editor after the earlier migrations.

-- ---------------------------------------------------------------------------
-- Workplaces where employees may check in
-- ---------------------------------------------------------------------------

create table public.workplaces (
  id bigint generated always as identity primary key,
  name text not null check (length(trim(name)) > 0),
  latitude double precision not null check (latitude between -90 and 90),
  longitude double precision not null check (longitude between -180 and 180),
  radius_m integer not null default 500 check (radius_m between 50 and 5000),
  active boolean not null default true,
  created_at timestamptz not null default now()
);

-- Rangsit University main campus, Lak Hok, Pathum Thani. The 500 m radius
-- covers the campus. Adjust latitude, longitude or radius_m in the
-- Table Editor if check-in fails at the edge of campus.
insert into public.workplaces (name, latitude, longitude, radius_m)
values ('Rangsit University', 13.9648750, 100.5864611, 500);

alter table public.workplaces enable row level security;
create policy "Signed-in users see workplaces" on public.workplaces
  for select to authenticated using (true);
grant select on public.workplaces to authenticated;
grant all on public.workplaces to service_role;

-- ---------------------------------------------------------------------------
-- Shift columns: Bangkok attendance day, hours, check-in location
-- ---------------------------------------------------------------------------

alter table public.shifts
  add column work_date date
    generated always as ((start_at at time zone 'Asia/Bangkok')::date) stored,
  add column hours numeric(6, 2)
    generated always as (
      round((extract(epoch from (end_at - start_at)) / 3600)::numeric, 2)
    ) stored,
  add column workplace_id bigint references public.workplaces (id),
  add column check_in_latitude double precision,
  add column check_in_longitude double precision,
  add column check_in_accuracy_m double precision,
  add column check_in_distance_m double precision;

-- Only one open check-in per employee, even across midnight.
create unique index shifts_one_open_idx
  on public.shifts (employee_id) where end_at is null;
create index shifts_work_date_idx on public.shifts (work_date, employee_id);

-- ---------------------------------------------------------------------------
-- Check-in and check-out go through these functions only
-- ---------------------------------------------------------------------------

-- Distance in metres between two points (haversine).
create function public.distance_m(
  lat1 double precision, lon1 double precision,
  lat2 double precision, lon2 double precision)
returns double precision language sql immutable set search_path = '' as $$
  select 2 * 6371000 * asin(sqrt(
    power(sin(radians(lat2 - lat1) / 2), 2)
    + cos(radians(lat1)) * cos(radians(lat2))
      * power(sin(radians(lon2 - lon1) / 2), 2)
  ));
$$;

create function public.check_in(
  lat double precision,
  lng double precision,
  accuracy double precision default null)
returns public.shifts
language plpgsql security definer set search_path = '' as $$
declare
  me text := public.current_employee_id();
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
  select w.id, w.name, w.radius_m,
         public.distance_m(lat, lng, w.latitude, w.longitude) as distance
    into place
    from public.workplaces w
   where w.active
   order by 4
   limit 1;
  if not found then
    raise exception 'No workplace is set up for check-in.';
  end if;
  if place.distance > place.radius_m then
    raise exception 'Check in at %. You''re about % km away.',
      place.name, round((place.distance / 1000)::numeric, 1);
  end if;

  if exists (select 1 from public.shifts s
             where s.employee_id = me and s.end_at is null) then
    raise exception 'You''re already checked in.';
  end if;
  if exists (select 1 from public.shifts s
             where s.employee_id = me
               and s.work_date = (now() at time zone 'Asia/Bangkok')::date) then
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

-- Check-out works from anywhere and stores no location.
create function public.check_out()
returns public.shifts
language plpgsql security definer set search_path = '' as $$
declare
  me text := public.current_employee_id();
  saved public.shifts;
begin
  if me is null then
    raise exception 'Only active employees can check out.';
  end if;
  update public.shifts s
     set end_at = now()
   where s.employee_id = me and s.end_at is null
  returning * into saved;
  if not found then
    raise exception 'You''re not checked in.';
  end if;
  return saved;
end;
$$;

-- The app can no longer write shifts directly; it must use the functions.
drop policy "Employees check in" on public.shifts;
drop policy "Employees check out" on public.shifts;
revoke insert, update, delete on public.shifts from authenticated;

revoke execute on function public.distance_m(
  double precision, double precision, double precision, double precision)
  from public, anon, authenticated;
revoke execute on function public.check_in(
  double precision, double precision, double precision) from public, anon;
revoke execute on function public.check_out() from public, anon;
grant execute on function public.check_in(
  double precision, double precision, double precision) to authenticated;
grant execute on function public.check_out() to authenticated;

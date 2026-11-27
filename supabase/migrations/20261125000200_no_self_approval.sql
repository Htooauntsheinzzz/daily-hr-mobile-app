-- HR administrators who are also employees can't approve or reject their
-- own leave or overtime. Another HR administrator must decide it.
create or replace function public.guard_work_request()
returns trigger language plpgsql set search_path = '' as $$
begin
  if public.is_trusted_role() then
    return new;
  end if;
  if tg_op = 'INSERT' then
    if new.status <> 'Pending' or new.decided_by is not null or new.decided_at is not null then
      raise exception 'New requests must be Pending.';
    end if;
    return new;
  end if;
  if (to_jsonb(new) - array['status', 'decided_by', 'decided_at'])
     is distinct from (to_jsonb(old) - array['status', 'decided_by', 'decided_at']) then
    raise exception 'Only the request status can change.';
  end if;
  if old.status <> 'Pending' then
    raise exception 'This request has already been resolved.';
  end if;
  if new.status = 'Cancelled' then
    if old.employee_id is distinct from public.current_employee_id() then
      raise exception 'Only the owner can cancel.';
    end if;
  elsif new.status in ('Approved', 'Rejected') then
    if not public.is_hr() then
      raise exception 'HR access required.';
    end if;
    if old.employee_id = public.current_employee_id() then
      raise exception 'Another HR administrator must decide this request.';
    end if;
  else
    raise exception 'Invalid decision.';
  end if;
  new.decided_by := auth.uid();
  new.decided_at := now();
  return new;
end;
$$;

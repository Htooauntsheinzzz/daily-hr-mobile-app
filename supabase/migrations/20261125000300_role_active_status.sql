-- Active status for HR administrators, and one lookup the app uses after
-- sign-in to tell active, inactive and unassigned accounts apart.

-- HR admins can be turned off without deleting their row.
alter table public.hr_admins add column active boolean not null default true;

-- Only active HR admins get HR access.
create or replace function public.is_hr()
returns boolean language sql stable security definer set search_path = '' as $$
  select exists (
    select 1 from public.hr_admins
    where user_id = (select auth.uid()) and active
  );
$$;

-- The signed-in user's roles, including inactive ones:
--   hr:       true (active HR admin), false (inactive), or null (not HR)
--   employee: the user's employees row (with its active flag), or null
-- An inactive employee can't read their row through the table policies,
-- so the app reads it here to show "Your account is inactive."
create function public.my_account()
returns jsonb language sql stable security definer set search_path = '' as $$
  select jsonb_build_object(
    'hr', (select h.active from public.hr_admins h
           where h.user_id = (select auth.uid())),
    'employee', (select to_jsonb(e) from public.employees e
                 where e.user_id = (select auth.uid()))
  );
$$;

revoke execute on function public.my_account() from public, anon;
grant execute on function public.my_account() to authenticated;

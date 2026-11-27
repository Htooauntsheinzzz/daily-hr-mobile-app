// Creates a Supabase Auth login for an existing employee record.
//
// Only active HR administrators can call it. The employee must be active and
// not have a login yet. HR sets a temporary password and gives it to the
// employee. The database links the new login to the employee by email.
//
// Deploy with "Verify JWT" turned OFF: this function checks the caller itself.
import { createClient } from 'npm:@supabase/supabase-js@2'

const url = Deno.env.get('SUPABASE_URL')!
const secretKeys = Deno.env.get('SUPABASE_SECRET_KEYS')
const secretKey = secretKeys
  ? JSON.parse(secretKeys)['default']
  : Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!

const admin = createClient(url, secretKey, {
  auth: { autoRefreshToken: false, persistSession: false },
})

const cors = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

function reply(status: number, body: Record<string, unknown>) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...cors, 'Content-Type': 'application/json' },
  })
}

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: cors })
  if (req.method !== 'POST') return reply(405, { error: 'Use POST.' })

  // 1. Who is calling? The app sends the signed-in user's access token.
  const token = req.headers.get('Authorization')?.replace(/^Bearer\s+/i, '')
  if (!token) return reply(401, { error: 'Sign in first.' })
  const { data: caller, error: callerError } = await admin.auth.getUser(token)
  if (callerError || !caller.user) return reply(401, { error: 'Sign in again.' })

  // 2. Only active HR administrators may create logins.
  const { data: hr } = await admin
    .from('hr_admins')
    .select('active')
    .eq('user_id', caller.user.id)
    .maybeSingle()
  if (!hr?.active) return reply(403, { error: 'Only HR can create logins.' })

  // 3. Check the request.
  let body: { employee_id?: string; password?: string }
  try {
    body = await req.json()
  } catch {
    return reply(400, { error: 'Send employee_id and password.' })
  }
  const employeeId = body.employee_id?.trim()
  const password = body.password ?? ''
  if (!employeeId) return reply(400, { error: 'Choose an employee.' })
  if (password.length < 8) {
    return reply(400, { error: 'Use a temporary password of at least 8 characters.' })
  }

  const { data: employee } = await admin
    .from('employees')
    .select('id, email, active, user_id')
    .eq('id', employeeId)
    .maybeSingle()
  if (!employee) return reply(404, { error: 'Employee not found.' })
  if (!employee.active) return reply(400, { error: 'This employee is inactive.' })
  if (employee.user_id) return reply(409, { error: 'This employee already has a login.' })

  // 4. Create the login. The on_auth_user_created trigger links it by email.
  const { data: created, error: createError } = await admin.auth.admin.createUser({
    email: employee.email,
    password,
    email_confirm: true,
  })
  if (createError || !created.user) {
    const taken = createError?.message?.toLowerCase().includes('already')
    return reply(taken ? 409 : 400, {
      error: taken
        ? 'A login with this email already exists.'
        : createError?.message ?? 'The login could not be created.',
    })
  }

  // Make sure the link is in place even if the email trigger missed it.
  await admin
    .from('employees')
    .update({ user_id: created.user.id })
    .eq('id', employee.id)
    .is('user_id', null)

  return reply(200, { employee_id: employee.id, user_id: created.user.id })
})

import 'dart:async';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

/// Why a sign-in attempt failed or a session was closed.
enum AuthError { invalidCredentials, offline, noAccess, inactive, unavailable }

class AuthFailure implements Exception {
  const AuthFailure(this.error);
  final AuthError error;
  @override
  String toString() => 'AuthFailure($error)';
}

/// The signed-in person's DailyHR roles, including inactive ones.
///
/// An HR administrator who also works at the company has both an HR role and
/// an [employee] record.
class AuthRoles {
  const AuthRoles({this.hr, this.employee});

  /// true for an active HR admin, false for an inactive one, null if not HR.
  final bool? hr;

  /// The person's `employees` row from Supabase (with `active`), or null.
  final Map<String, dynamic>? employee;

  bool get hrActive => hr == true;
  String? get employeeId => employee?['id'] as String?;
  bool get employeeActive => employee != null && employee!['active'] != false;

  /// Has at least one role, but none of them is active.
  bool get inactive =>
      !hrActive && !employeeActive && (hr != null || employee != null);
}

/// Signs people in and reads their DailyHR roles.
abstract class AuthGateway {
  /// Signs in and returns the roles, or throws [AuthFailure].
  Future<AuthRoles> signIn(String email, String password);

  /// Roles for the session saved on this device, or null when signed out.
  /// Throws [AuthFailure] when the roles can't be read (for example offline).
  Future<AuthRoles?> currentRoles();

  /// Ends the Supabase session on this device.
  Future<void> signOut();

  /// Email of the signed-in account, or null.
  String? get currentEmail;
}

/// Supabase email/password sign-in. Roles come from the `my_account()`
/// database function, which reads `hr_admins` and `employees`.
class SupabaseAuthGateway implements AuthGateway {
  SupabaseAuthGateway(this.client);
  final SupabaseClient client;

  @override
  String? get currentEmail => client.auth.currentUser?.email;

  @override
  Future<AuthRoles> signIn(String email, String password) async {
    try {
      await client.auth.signInWithPassword(email: email, password: password);
    } on AuthRetryableFetchException {
      throw const AuthFailure(AuthError.offline);
    } on AuthApiException catch (e) {
      if (e.code == 'invalid_credentials' || e.statusCode == '400') {
        throw const AuthFailure(AuthError.invalidCredentials);
      }
      throw const AuthFailure(AuthError.unavailable);
    } on AuthException {
      throw const AuthFailure(AuthError.unavailable);
    } on SocketException {
      throw const AuthFailure(AuthError.offline);
    } on TimeoutException {
      throw const AuthFailure(AuthError.offline);
    }
    try {
      return (await currentRoles())!;
    } on AuthFailure {
      // Don't leave a half-signed-in session if the role lookup fails.
      await signOut();
      rethrow;
    }
  }

  @override
  Future<AuthRoles?> currentRoles() async {
    if (client.auth.currentSession == null) return null;
    try {
      final result = await client.rpc('my_account');
      final account = Map<String, dynamic>.from(result as Map);
      final employee = account['employee'];
      return AuthRoles(
        hr: account['hr'] as bool?,
        employee: employee == null
            ? null
            : Map<String, dynamic>.from(employee as Map),
      );
    } on PostgrestException {
      throw const AuthFailure(AuthError.unavailable);
    } on AuthException {
      throw const AuthFailure(AuthError.unavailable);
    } on SocketException {
      throw const AuthFailure(AuthError.offline);
    } on TimeoutException {
      throw const AuthFailure(AuthError.offline);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } catch (_) {
      // The local session is removed before the network call, so a failed
      // request still signs the person out on this device.
    }
  }
}

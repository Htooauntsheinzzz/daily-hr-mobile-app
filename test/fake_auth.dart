import 'package:daily_hr_mobile_application/src/auth.dart';

/// In-memory stand-in for Supabase sign-in.
class FakeAuth implements AuthGateway {
  FakeAuth({Map<String, AuthRoles>? accounts})
    : accounts =
          accounts ??
          {
            'arun@gmail.com/123456': const AuthRoles(hr: true),
            'maya@dailyhr.example/123456': const AuthRoles(
              employee: {'id': 'DH-001', 'active': true},
            ),
          };

  /// `email/password` to roles.
  final Map<String, AuthRoles> accounts;

  /// The signed-in account's current roles. Tests can change this to
  /// simulate HR deactivating someone while they are signed in.
  AuthRoles? signedInAs;
  String? signedInEmail;
  AuthError? failWith;
  int signOuts = 0;

  @override
  String? get currentEmail => signedInEmail;

  @override
  Future<AuthRoles> signIn(String email, String password) async {
    if (failWith != null) throw AuthFailure(failWith!);
    final roles = accounts['$email/$password'];
    if (roles == null) throw const AuthFailure(AuthError.invalidCredentials);
    signedInAs = roles;
    signedInEmail = email;
    return roles;
  }

  @override
  Future<AuthRoles?> currentRoles() async {
    if (failWith != null) throw AuthFailure(failWith!);
    return signedInAs;
  }

  @override
  Future<void> signOut() async {
    signOuts++;
    signedInAs = null;
    signedInEmail = null;
  }
}

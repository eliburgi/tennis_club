import 'package:meta/meta.dart';
import 'package:tennis_club/feature/auth/auth_failures.dart';
import 'package:tennis_club/feature/auth/auth_service.dart';
import 'package:tennis_club/feature/auth/user.dart';

class LoginUseCase {
  LoginUseCase({
    @required AuthService authService,
  })  : assert(authService != null),
        _authService = authService;

  final AuthService _authService;

  /// Logs in the user with his email and password.
  ///
  /// Returns the authenticated [User] if [email] and [password] are correct.
  ///
  /// Throws [EmailRequiredFailure] if [email] is `null` or empty.
  /// Throws [PasswordRequiredFailure] if [password] is `null` or empty.
  /// See [AuthService.login] for more possible thrown failures.
  Future<User> login(String email, String password) async {
    if (email == null || email.isEmpty) {
      throw EmailRequiredFailure();
    }
    if (password == null || password.isEmpty) {
      throw PasswordRequiredFailure();
    }
    return _authService.login(email, password);
  }
}

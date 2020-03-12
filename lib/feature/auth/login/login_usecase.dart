import 'package:meta/meta.dart';
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
  /// See [AuthService.login] for possible thrown failures.
  Future<User> login(String email, String password) async {
    return _authService.login(email, password);
  }
}

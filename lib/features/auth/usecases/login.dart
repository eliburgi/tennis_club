import 'package:meta/meta.dart';

import '../models/user.dart';
import '../services/auth_service.dart';

class LoginUseCase {
  LoginUseCase({
    @required AuthService authService,
  })  : assert(authService != null),
        _authService = authService;

  final AuthService _authService;

  /// Logs in the user with his email and password.
  ///
  /// Returns the [User] if [email] and [password] are correct.
  ///
  /// Throws [LoginException] if the [email] is not registered
  /// or the wrong [password] is used.
  Future<User> loginWithEmail(String email, String password) {
    // TODO: perform simple email and password validation
    throw UnimplementedError();
  }
}

bool _validateEmail(String email) {}

bool _validatePassword(String password) {}

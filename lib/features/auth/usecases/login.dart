import 'package:meta/meta.dart';

import '../models/user.dart';
import '../errors/errors.dart';
import '../services/auth_service.dart';

class LoginUseCase {
  LoginUseCase({
    @required AuthService authService,
  })  : assert(authService != null),
        _authService = authService;

  final AuthService _authService;

  /// Logs in the user with his email and password.
  ///
  /// Returns the [User] if [email] and [password] are valid and correct.
  ///
  /// Throws [InvalidEmailException] if the [email] is malformed.
  /// Throws [AccountNotFoundException] if no account for the given [email]
  /// exists.
  /// Throws [WrongPasswordException] if a wrong [password] is used.
  Future<User> loginWithEmail(String email, String password) async {
    if (!_isValidEmail(email)) {
      throw InvalidEmailException(email);
    }

    // For the sake of simplicity share the error models between
    // the services and usecases.
    return await _authService.login(email, password);
  }
}

bool _isValidEmail(String email) {
  if (email == null) return false;

  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return regex.hasMatch(email);
}

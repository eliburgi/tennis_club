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
  /// Returns the [User] if [email] and [password] are valid and correct.
  ///
  /// Throws [LoginException] if [email] or [password] are invalid, or
  /// no account for [email] exists, or the wrong [password is used].
  /// To differentiate between these exceptions, use [LoginException.code].
  Future<User> loginWithEmail(String email, String password) {
    if (!_isValidEmail(email)) {
      throw LoginException(
        LoginExceptionCode.invalidEmail,
        '\'$email\' is not a valid email address!',
      );
    }

    if (!_isValidPassword(password)) {
      throw LoginException(
        LoginExceptionCode.invalidPassword,
        '\'$password\' is not a valid password!',
      );
    }
    // TODO: perform simple email and password validation
    throw UnimplementedError();
  }
}

bool _isValidEmail(String email) {
  if (email == null) return false;

  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return regex.hasMatch(email);
}

bool _isValidPassword(String password) {
  // TODO: more advanced validation
  return password != null && password.isNotEmpty;
}

class LoginException implements Exception {
  LoginException(this.code, this.message)
      : assert(code != null),
        assert(message != null);

  final LoginExceptionCode code;
  final String message;
}

enum LoginExceptionCode {
  invalidEmail,
  invalidPassword,
  accountDoesNotExist,
  wrongPassword,
}

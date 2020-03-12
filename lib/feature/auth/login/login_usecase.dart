import 'package:meta/meta.dart';
import 'package:tennis_club/feature/auth/auth_service.dart';
import 'package:tennis_club/feature/auth/auth_utils.dart';
import 'package:tennis_club/feature/auth/user.dart';

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
    if (!AuthUtils.validateEmail(email)) {
      throw InvalidEmailException(email);
    }

    try {
      User user = await _authService.login(email, password);
      return user;
    } catch (e) {
      switch (e) {
        case AuthServiceException.accountNotFound:
          throw AccountNotFoundException(email);
        case AuthServiceException.wrongPassword:
          throw WrongPasswordException(password);
        default:
          // TODO: handle unknown errors somehow
          throw StateError(
            'AuthService::login throws an exception that is not handled'
            'by LoginUseCase! Cause: $e',
          );
      }
    }
  }
}

class InvalidEmailException implements Exception {
  InvalidEmailException(this.email);

  final String email;

  @override
  String toString() => '${email ?? 'null'} is not a valid email address!';
}

class WrongPasswordException implements Exception {
  WrongPasswordException(this.password);

  final String password;

  @override
  String toString() => 'Wrong password!';
}

class AccountNotFoundException implements Exception {
  AccountNotFoundException(this.email) : assert(email != null);

  final String email;

  @override
  String toString() => 'No account found for email: $email!';
}

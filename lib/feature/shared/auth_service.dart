import 'user.dart';

abstract class AuthService {
  /// Logs in the user.
  ///
  /// Returns the authenticated [User] if [email] and [password] are correct.
  ///
  /// Throws [AccountNotFoundException] if no account for the given [email]
  /// exists.
  /// Throws [WrongPasswordException] if a wrong [password] is used.
  Future<User> login(String email, String password);
}

class AccountNotFoundException implements Exception {}

class WrongPasswordException implements Exception {}

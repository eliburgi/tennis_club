import '../models/user.dart';

abstract class AuthService {
  /// Logs in the user with his email and password.
  ///
  /// Returns the [User] if [email] and [password] are correct.
  ///
  /// Throws [AuthError] if no account for the given [email] exists or
  /// the wrong [password] is used.
  Future<User> loginWithEmail(String email, String password) {
    throw UnimplementedError();
  }
}

enum AuthError {
  invalidEmail,
  invalidPassword,
  noConnection,
}

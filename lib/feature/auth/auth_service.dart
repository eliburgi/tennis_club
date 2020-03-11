import 'user.dart';
export 'user.dart';

abstract class AuthService {
  /// Logs in the user.
  ///
  /// Returns the authenticated [User] if [email] and [password] are correct.
  ///
  /// Throws [AuthServiceException.accountNotFound] if no account for
  /// the given [email] exists.
  /// Throws [AuthServiceException.wrongPassword] if a wrong [password] is used.
  Future<User> login(String email, String password);
}

enum AuthServiceException {
  accountNotFound,
  wrongPassword,
}

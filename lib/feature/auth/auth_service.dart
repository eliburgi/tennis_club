import 'user.dart';
export 'user.dart';

abstract class AuthService {
  /// Logs in the user.
  ///
  /// Returns the authenticated [User] if [email] and [password] are correct.
  ///
  /// Throws [AccountNotFoundFailure] if no account for [email] exists.
  /// Throws [WrongPasswordFailure] if a wrong [password] is used.
  Future<User> login(String email, String password);
}

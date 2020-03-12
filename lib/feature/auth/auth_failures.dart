import 'package:equatable/equatable.dart';

/// Base class for all failures that can happen within the auth feature.
abstract class AuthFailure extends Equatable {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Unknown authentication error.';
}

/// Indicates that no account with the given email exists.
///
/// For example, when a user wants to login with an email that is not registered.
class AccountNotFoundFailure extends AuthFailure {
  @override
  String toString() => 'No account found with this email address.';
}

/// Indicates that a wrong password is used.
///
/// For example, when a user wants to login but enters a wrong password.
class WrongPasswordFailure extends AuthFailure {
  @override
  String toString() => 'Wrong password.';
}

/// Indicates that the email is invalid and can not be used to create an account.
///
/// For example, when a new user wants to be registered.
class InvalidEmailFailure extends AuthFailure {}

/// Indicates that the password is invalid and can not be used.
///
/// For example, when a user wants to change his password.
class InvalidPasswordFailure extends AuthFailure {}

class InvalidEmailException implements Exception {
  InvalidEmailException(this.email);

  final String email;

  @override
  String toString() => '${email ?? 'null'} is not a valid email address!';
}

class WrongPasswordException implements Exception {
  @override
  String toString() => 'Wrong password!';
}

class AccountNotFoundException implements Exception {
  AccountNotFoundException(this.email) : assert(email != null);

  final String email;

  @override
  String toString() => 'No account found for email: $email!';
}

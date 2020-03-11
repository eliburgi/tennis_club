import 'package:tennis_club/feature/auth/login/login_utils.dart';

class FormBloc {
  String validateEmail(String email) {
    if (!LoginUtils.validateEmail(email)) {
      return 'Please enter a valid email address.';
    }
    // the email is valid so signal it by returning null
    return null;
  }

  // TODO: put into change password feature
  /*String validatePassword(String password) {
    switch (LoginUtils.validatePassword(password)) {
      case PasswordValidationResult.tooLessCharacters:
        return 'Password must at least contain '
            '${LoginUtils.kMinPasswordCharCount} characters.';
      case PasswordValidationResult.missingUpperCaseLetter:
        return 'Password must at least contain one uppercase letter.';
      case PasswordValidationResult.missingDigit:
        return 'Password must at least contain one digit.';
    }
    if (!LoginUtils.validatePassword(password)) {
      return 'Invalid Password';
    }
    // the password is valid so signal it by returning null
    return null;
  }*/
}

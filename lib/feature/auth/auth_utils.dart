abstract class AuthUtils {
  static bool validateEmail(String email) {
    if (email == null) return false;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(email);
  }

  // TODO: put into change password feature
  /*static const kMinPasswordCharCount = 6;

  static PasswordValidationResult validatePassword(String password) {
    if (password == null || password.trim().length < kMinPasswordCharCount) {
      return PasswordValidationResult.tooLessCharacters;
    }

    bool containsUpperCaseLetter = false;
    bool containsDigit = false;
    const kDigits = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
    for (int i = 0; i < password.length; i++) {
      if (kDigits.contains(password[i])) {
        containsDigit = true;
      } else if (password[i] == password[i].toUpperCase()) {
        containsUpperCaseLetter = true;
      }
    }
    if (!containsUpperCaseLetter) {
      return PasswordValidationResult.missingUpperCaseLetter;
    }
    if (!containsDigit) {
      return PasswordValidationResult.missingDigit;
    }
    return PasswordValidationResult.ok;
  }*/
}

/*enum PasswordValidationResult {
  ok,
  tooLessCharacters,
  missingUpperCaseLetter,
  missingDigit,
}*/

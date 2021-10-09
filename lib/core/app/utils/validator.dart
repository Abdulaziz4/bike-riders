class Validator {
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "Please enter an email.";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "Please enter a valid email.";
    }
    return null;
  }

  static String? passwordValidator(String? pass) {
    {
      if (pass == null || pass.isEmpty) {
        return "Please enter a password.";
      } else if (pass.length < 8) {
        return "Password should be at least 8 characters.";
      }
      return null;
    }
  }

  static String? confirmPasswordValidator(
    String? pass,
    String? confirmPassword,
  ) {
    {
      final isValid = Validator.passwordValidator(confirmPassword);
      if (isValid == null) {
        final isMatched = pass == confirmPassword;
        return isMatched ? null : "Password doesn't match.";
      }
      return isValid;
    }
  }
}

class Validator {
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "الرجاء ادخال بريد الكتروني";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "الرجاء التأكد من البريد الالكتروني";
    }
    return null;
  }

  static String? passwordValidator(String? pass) {
    {
      if (pass == null || pass.isEmpty) {
        return "الرجاء ادخال كلمة مرور";
      } else if (pass.length < 8) {
        return "الرجاء ادخال كلمة مرور أكثر من ٨ حروف";
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
        return isMatched ? null : "تأكد من مطابقة كلمة السر";
      }
      return null;
    }
  }
}

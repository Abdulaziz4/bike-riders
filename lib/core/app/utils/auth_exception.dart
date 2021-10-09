class AuthException implements Exception {
  final String code;
  AuthException(this.code);
  String get message {
    switch (code) {
      case "email-already-in-use":
        return "Email is already used.";

      case "invalid-email":
        return "Email is invalid.";

      case "operation-not-allowed":
        return "Something went wrong, please try again.";

      case "weak-password":
        return "Week password.";

      case "wrong-password":
      case "user-not-found":
        return "Wrong email or password.";

      case "user-disabled":
        return "Account is disabled.";
      default:
        return "Something went wrong, please try again.";
    }
  }
}

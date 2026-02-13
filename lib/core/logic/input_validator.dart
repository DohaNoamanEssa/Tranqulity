class InputValidator {
  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Password Must be Not Empty";
    } else if (value.length < 7) {
      return "Password Must be at least 7 Digits";
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return "Phone Must be Not Empty";
    } else if (value.length < 10) {
      return "Phone Must be 10 Digits";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email must not be empty";
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return "Enter a valid email address";
    }

    return null;
  }
}

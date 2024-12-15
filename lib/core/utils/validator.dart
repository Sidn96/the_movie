class Validator {
  static String? validateEmail(String? value) {
    //   r'^[\w-\.]{3,30}@([\w-]+\.)+[\w-]{2,4}$'
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());

    if (value == null) {
      return "Please enter email id";
    }

    if (value.trim().isEmpty) {
      return "Please enter email id";
    }

    if (!regex.hasMatch(value.trim())) {
      return "Please enter valid email id";
    }
    return null;
  }

  static String? validateContactNumber(String? value) {
    Pattern pattern = r'^(?!(\d)\1{4,})([6789]\d{9})$';
    RegExp regex = RegExp(pattern.toString());

    if (value == null) {
      return "Please enter contact number";
    }

    if (value.trim().isEmpty) {
      return "Please enter contact number";
    }

    if (!regex.hasMatch(value.trim())) {
      return "Please enter valid contact number";
    }
    return null;
  }

  static String? validateName(String? value) {
    String pattern = r'^[a-z A-Z]+$';
    RegExp regex = RegExp(pattern.toString());

    if (value == null || value.trim().isEmpty) {
      return "Please enter name";
    }

    if (value.trim().length < 2 ||
        value.startsWith(" ") ||
        !regex.hasMatch(value)) {
      return "Please enter valid name";
    }
    return null;
  }

  static String? validateFieldNotEmpty(String? value) {
    if (value == null ||
        value.trim().isEmpty ||
        value.trim().length < 2 ||
        value.startsWith(" ")) {
      return "This field can't be empty";
    }
    return null;
  }

  static String? validatePassword({required String? value}) {
    if (value == null || value.trim().isEmpty || value.startsWith(" ")) {
      return "This field can't be empty";
    }

    if (value.trim().length < 8) {
      return "Minimum 8 characters are required";
    }

    return null;
  }

  static String? reConfirmPassword(
      {required String mainValue, required String confirmValue}) {
    if (confirmValue.trim().isEmpty || confirmValue.startsWith(" ")) {
      return "This field can't be empty";
    }

    if (confirmValue.trim().length < 8) {
      return "Minimum 8 characters are required";
    }

    if (mainValue != confirmValue) {
      return "Password does not match";
    }
    return null;
  }

  static String? isCharacterLimitValid(
      String value, int lowerLimit, int higherLimit) {
    if (value.trim().length >= lowerLimit) {
      return "Minimum $lowerLimit characters are required";
    }

    if (value.trim().length <= higherLimit) {
      return "Maximum $higherLimit characters are allowed";
    }

    return null;
  }

  static String? validateMinLimit({required String value, int lowerLimit = 0}) {
    if (value.trim().length >= lowerLimit) {
      return "Minimum $lowerLimit characters are required";
    }

    return null;
  }

  static String? validateMaxLimit(
      {required String value, int higherLimit = 0}) {
    if (value.trim().length <= higherLimit) {
      return "Maximum $higherLimit characters are allowed";
    }
    return null;
  }

  static bool validateExactLength(
      {required int textLength, required int value}) {
    return textLength == value ? true : false;
  }

  static bool reConfirmField(
      {required String mainValue, required String confirmValue}) {
    return mainValue == confirmValue ? true : false;
  }
}

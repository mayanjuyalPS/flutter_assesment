mixin Validator {
  String? validateEmail(String? value) {
    String? _msg;
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value != null) {
      if (value.isEmpty) {
        _msg = "Your email is required";
      } else if (!regex.hasMatch(value)) {
        _msg = "Please provide a valid email address";
      }
    }
    return _msg;
  }

  String? validateSimpleField(String? value) {
    String? _msg;
    if (value != null) {
      if (value.isEmpty) {
        _msg = "This field is required";
      }
    }
    return _msg;
  }

  String? validatePassword(String? value) {
    String? _msg;
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value != null) {
      if (value.isEmpty) {
        _msg = "Your password is required";
      } else if (!regex.hasMatch(value)) {
        _msg = "Please provide a valid password";
      }
    }
    return _msg;
  }
}

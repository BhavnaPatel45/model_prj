class Validation {
  String? validateEmail(String? value) {
    final validCharacters =
        RegExp(r'^[a-zA-Z0-9@]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == "" || value == null) {
      return "Please enter Email Id";
    } else if (!validCharacters.hasMatch(value)) {
      return "Please enter valid Email Id";
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == "" || value == null) {
      return "Please enter Password";
    } else if (value.length < 6) {
      return "Password require atleast 6 characters";
    }
    return null;
  }
}

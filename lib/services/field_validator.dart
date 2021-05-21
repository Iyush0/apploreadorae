class Validator {
  String emailValidate(String email) {
    try {
      if (email.isEmpty || email == null) {
        return 'Required*';
      }
      if (!RegExp(
              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
          .hasMatch(email)) {
        return 'Enter your correct email';
      }
      return null;
    } catch (e) {
      print(e);
      print('inside catch');
      return e;
    }
  }

  String passwordValidate(String password) {
    if (password.isEmpty) {
      return 'Required*';
    }
    if (password.length < 6) {
      return 'Minimum 6 character password';
    }
    return null;
  }

  String nameValidate(String name) {
    if (name.isEmpty) {
      return 'Required*';
    }
    if (name.length < 4) {
      return 'Enter atleast 4 character';
    }
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(name)) {
      return "Enter your correct name";
    }
    return null;
  }

  String userNameValidate(String userName) {
    if (userName.isEmpty) {
      return 'Required*';
    }
    if (userName.length < 4) {
      return 'Enter atleast 4 character';
    }
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(userName)) {
      return "Enter your correct name";
    }
    return null;
  }

  String numberValidate(String number) {
    if (number.isEmpty || number == null) {
      return "Required*";
    } else if (number.length < 10) {
      return 'Please enter a valid number';
    } else if (double.tryParse(number) == null) {
      return 'Please enter valid input.';
    } else {
      return null;
    }
  }

  // String emailandnumberValidate(String value) {
  //   if (value.isEmpty || value == null) {
  //     return "Required*";
  //   } else if (value.length < 10) {
  //     return 'Please enter a valid number';
  //   } else if (value.isEmpty || value == null) {
  //     return 'Required*';
  //   } else if (value.length < 2) {
  //     return 'enter your correct email';
  //   } else if (!RegExp(
  //           r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
  //       .hasMatch(value)) {
  //     return 'enter your correct email';
  //   }
  //   return null;
  // }

  String ageValidate(String age) {
    if (age.isEmpty || age == null) {
      return 'Required*';
    } else if (double.tryParse(age) == null) {
      return 'Please enter a valid age';
    } else if (age.length < 0 || age.length > 100) {
      return 'Please enter age between 1 - 100';
    } else {
      return null;
    }
  }
}

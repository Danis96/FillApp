/// Validation class
///
/// This class contains methods for all validation in the app.
///
/// Imports:
///   MyText for validation text
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'package:fillproject/components/constants/myText.dart';

class MyValidation {
  int snackCounter = 0;

  RegExp regexPassword = new RegExp(r'^(?=.*?[A-Z])(?=.*[0-9])(?=.{8,})');
  RegExp regexSpace = new RegExp(r'\s');
  RegExp regexEmail = new RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  String validatePhone(String phone, bool brPostoji) {
    if (phone == '') {
      return MyText().regPhoneSnack;
    } else if (brPostoji) {
      return MyText().numberExists;
    }

    return null;
  }

  String validateUsername(String username, bool usernamePostoji) {
    if (username == '') {
      return MyText().regUserSnack;
    } else if (regexSpace.hasMatch(username) == true) {
      return MyText().validateSpaceUsername;
    } else if (usernamePostoji) {
      return MyText().usernameExist;
    }
    return null;
  }

  /// Dodatna validacija na loginu skrinu
  /// Error text je drugaciji, rijesit cemo prilikom refaktorisanja
  String validateUsernameLogin(String username, bool usernamePostoji) {
    if (username == '') {
      return MyText().regUserSnack;
    } else if (regexSpace.hasMatch(username) == true) {
      return MyText().validateSpaceUsername;
    } else if (usernamePostoji) {
      return MyText().usernameDontExist;
    }
    return null;
  }

  String validatePassword(String password) {
    if (password == '') {
      return MyText().regPassSnack;
    } else if (password.length < 8) {
      return MyText().regPassLengthSnack;
    } else if (regexPassword.hasMatch(password) == false) {
      return MyText().regexPasswordSnack;
    } else if (regexSpace.hasMatch(password) == true) {
      return MyText().validateSpacePassword;
    }
    return null;
  }

  /// Dodatna validacija na loginu
  /// Error text je drugaciji, rijesit cemo prilikom refaktorisanja
  String validatePasswordLogin(String password, bool passwordPostoji) {
    if (password == '') {
      return MyText().regPassSnack;
    } else if (password.length < 8) {
      return MyText().regPassLengthSnack;
    } else if (regexPassword.hasMatch(password) == false) {
      return MyText().regexPasswordSnack;
    } else if (regexSpace.hasMatch(password) == true) {
      return MyText().validateSpacePassword;
    } else if (passwordPostoji) {
      return MyText().passDontExist;
    }
    return null;
  }

  String validateEmailLogin(String input, int counter) {
    if (input == '') {
      counter = 0;
      return MyText().regEmailSnack;
    } else if (regexEmail.hasMatch(input) == false) {
      counter = 0;
      return MyText().validEmail;
    } else if (regexSpace.hasMatch(input) == true) {
      counter = 0;
      return MyText().validEmail;
    }
    return null;
  }

  /// Dodatna validacija na [sendEmailPage] za email
  /// Error text je drugaciji, rijesit cemo prilikom refaktorisanja
  String validateEmail(String input, int counter, bool emailPostoji) {
    if (input == '') {
      counter = 0;
      return MyText().regEmailSnack;
    } else if (emailPostoji) {
      return MyText().emailExist;
    } else if (regexSpace.hasMatch(input) == true) {
      counter = 0;
      return MyText().validEmail;
    } else if (regexEmail.hasMatch(input) == false) {
      counter = 0;
      return MyText().validEmail;
    }
    return null;
  }

  String resetPassword(String input, String compareWith) {
    if (input == '') {
      return MyText().emptyFieldSnack;
    } else if (input != compareWith) {
      return MyText().repeatPassSnack;
    }
    return null;
  }
}

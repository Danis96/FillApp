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

import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class MyValidation {
  int snackCounter = 0;

  RegExp regexPassword = new RegExp(r'^(?=.*?[A-Z])(?=.*[0-9])(?=.{8,})');
  RegExp regexSpace = new RegExp(r'\s');
  RegExp regexEmail = new RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-_]+\.[a-zA-Z]+");

  String validatePhone(String phone, bool brPostoji, BuildContext context) {
    if (phone == '') {
      return AppLocalizations.of(context).translate('phoneCantEmpty');
    } else if (brPostoji) {
      return AppLocalizations.of(context).translate('numberAlreadyExists');
    }

    return null;
  }

  String validateUsername(
      String username, bool usernamePostoji, BuildContext context) {
    if (username == '') {
      return AppLocalizations.of(context).translate('usernaneCantEmoty');
    } else if (regexSpace.hasMatch(username) == true) {
      return AppLocalizations.of(context).translate('usernameMustNotSpace');
    } else if (usernamePostoji) {
      return AppLocalizations.of(context).translate('userAlreadyExists');
    }
    return null;
  }

  /// Dodatna validacija na loginu skrinu
  /// Error text je drugaciji, rijesit cemo prilikom refaktorisanja
  String validateUsernameLogin(
      String username, bool usernamePostoji, BuildContext context) {
    if (username == '') {
      return AppLocalizations.of(context).translate('usernaneCantEmoty');
    } else if (regexSpace.hasMatch(username) == true) {
      return AppLocalizations.of(context).translate('usernameMustNotSpace');
    } else if (usernamePostoji) {
      return AppLocalizations.of(context).translate('userDoesntExists');
    }
    return null;
  }

  String validatePassword(String password, BuildContext context) {
    if (password == '') {
      return AppLocalizations.of(context).translate('passCantEmpty');
    } else if (password.length < 8) {
      return AppLocalizations.of(context).translate('passCantBeLess8');
    } else if (regexPassword.hasMatch(password) == false) {
      return AppLocalizations.of(context).translate('passContainAll');
    } else if (regexSpace.hasMatch(password) == true) {
      return AppLocalizations.of(context).translate('passMustNotSpace');
    }
    return null;
  }

  /// Dodatna validacija na loginu
  /// Error text je drugaciji, rijesit cemo prilikom refaktorisanja
  String validatePasswordLogin(
      String password, bool passwordPostoji, BuildContext context) {
    if (password == '') {
      return AppLocalizations.of(context).translate('passCantEmpty');
    } else if (password.length < 8) {
      return AppLocalizations.of(context).translate('passCantBeLess8');
    } else if (regexPassword.hasMatch(password) == false) {
      return AppLocalizations.of(context).translate('passContainAll');
    } else if (regexSpace.hasMatch(password) == true) {
      return AppLocalizations.of(context).translate('passMustNotSpace');
    } else if (passwordPostoji) {
      return AppLocalizations.of(context).translate('wrongPass');
    }
    return null;
  }

  String validateEmailLogin(String input, int counter, BuildContext context) {
    if (input == '') {
      counter = 0;
      return AppLocalizations.of(context).translate('emailCantEmpty');
    } else if (regexEmail.hasMatch(input) == false) {
      counter = 0;
      return AppLocalizations.of(context).translate('emailMustBeValid');
    } else if (regexSpace.hasMatch(input) == true) {
      counter = 0;
      return AppLocalizations.of(context).translate('emailMustBeValid');
    } else if (input.endsWith('.con') == true) {
      counter = 0;
      return AppLocalizations.of(context).translate('emailMustBeValid');
    }
    return null;
  }

  /// Dodatna validacija na [sendEmailPage] za email
  /// Error text je drugaciji, rijesit cemo prilikom refaktorisanja
  String validateEmail(
      String input, int counter, bool emailPostoji, BuildContext context) {
    if (input == '') {
      counter = 0;
      return AppLocalizations.of(context).translate('emailCantEmpty');
    } else if (emailPostoji) {
      return AppLocalizations.of(context).translate('emailAlreadyExists');
    } else if (regexSpace.hasMatch(input) == true) {
      counter = 0;
      return AppLocalizations.of(context).translate('emailMustBeValid');
    } else if (regexEmail.hasMatch(input) == false) {
      counter = 0;
      return AppLocalizations.of(context).translate('emailMustBeValid');
    } else if (input.endsWith('.con') == true) {
      counter = 0;
      return AppLocalizations.of(context).translate('emailMustBeValid');
    }
    return null;
  }

  String resetPassword(String input, String compareWith, BuildContext context) {
    if (input == '') {
      return AppLocalizations.of(context).translate('thisFiledCantBeEmpty');
    } else if (input != compareWith) {
      return AppLocalizations.of(context).translate('wrongInput');
    }
    return null;
  }

  String validateAnswer(String answer, BuildContext context) {
    if (answer == '') {
      return AppLocalizations.of(context).translate('thisFiledCantBeEmpty');
    }

    return null;
  }
}

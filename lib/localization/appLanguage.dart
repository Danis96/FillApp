import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Class used for managing Locale, the property used
///
///for detecting the language which will be used in the app
class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('en');
  Locale get appLocal => _appLocale ?? Locale("en");

  ///Method for fetching the laguage from local storage
  ///
  ///If there is no language in shared preference, the language 
  ///will be set to English
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return Null;
  }

  ///Method used for changing the language within the application,
  ///
  ///on button click it will be called
  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("ar")) {
      _appLocale = Locale("ar");
      await prefs.setString('language_code', "ar");
      await prefs.setString('countryCode', '');
    } else {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}

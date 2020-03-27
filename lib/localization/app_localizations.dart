import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {

      final Locale locale;
      AppLocalizations(this.locale);


      /// helper method to keep the code in the widgets concise
      /// Localizations are accessed using an InheritedWidget "of" syntax
      static AppLocalizations of(BuildContext context) {
          return Localizations.of<AppLocalizations>(context, AppLocalizations);
      }

     /// static member to have simple access to the delegate from Material App
      static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

      Map<String,String> _localizedStrings;

      Future<bool> load() async {
           /// load the language JSON file from the lang
           String jsonString = await rootBundle.loadString('lang/${locale.languageCode}.json');

           Map<String, dynamic> jsonMap = json.decode(jsonString);
           /// convert dynamic into String
           _localizedStrings = jsonMap.map((key, value) {
                return MapEntry(key, value.toString());
           });

           return true;
      }


      /// this method will be called from every Widget that needs to be localized
      String translate(String key) {
          return _localizedStrings[key];
      }
}


/// Localizations delegate is the factory for a aset of localized resources

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {

       const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    /// include all of ours languages
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    /// where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;       
}
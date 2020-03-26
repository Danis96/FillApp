import 'package:fillproject/home/mySplashScreen.dart';
import 'package:fillproject/localization/appLanguage.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:fillproject/routes/routeGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(FillApp());

class FillApp extends StatelessWidget {
  final AppLanguage appLanguage;
  FillApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (context) => AppLanguage(),
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          locale: model.appLocal,
          ///localization
          ///
          ///list of supported languages
          supportedLocales: [
            Locale('en', 'US'),
            Locale('bs', 'BS'),
          ],

          ///localization delegates
          localizationsDelegates: [
            /// our localization, load translates from JSON
            AppLocalizations.delegate,

            /// translates Material texts
            GlobalMaterialLocalizations.delegate,

            /// translate Widget texts
            GlobalWidgetsLocalizations.delegate,
          ],

          // /// returns locale wich will be used by the app
          // localeResolutionCallback: (locale, supportedLocales) {
          //   /// check if the current device locale is supported
          //   for (var supportedLocale in supportedLocales) {
          //     if (supportedLocale.languageCode == locale.languageCode &&
          //         supportedLocale.countryCode == locale.countryCode) {
          //       return supportedLocale;
          //     }
          //   }

          //   /// if the locale device is not supported, get first language from the list (eng)
          //   return supportedLocales.first;
          // },

          debugShowCheckedModeBanner: false,
          initialRoute: Home,
          onGenerateRoute: RouteGenerator.generateRoute,
          home: Scaffold(body: MySplashScreen()),
        );
      }),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //   return MaterialApp(
  //     ///localization
  //     ///
  //     ///list of supported languages
  //     supportedLocales: [
  //       Locale('en', 'US'),
  //       Locale('bs', 'BS'),
  //     ],

  //     ///localization delegates
  //     localizationsDelegates: [
  //       /// our localization, load translates from JSON
  //       AppLocalizations.delegate,

  //       /// translates Material texts
  //       GlobalMaterialLocalizations.delegate,

  //       /// translate Widget texts
  //       GlobalWidgetsLocalizations.delegate,
  //     ],

  //     /// returns locale wich will be used by the app
  //     localeResolutionCallback: (locale, supportedLocales) {
  //       /// check if the current device locale is supported
  //       for (var supportedLocale in supportedLocales) {
  //         if (supportedLocale.languageCode == locale.languageCode &&
  //             supportedLocale.countryCode == locale.countryCode) {
  //           return supportedLocale;
  //         }
  //       }

  //       /// if the locale device is not supported, get first language from the list (eng)
  //       return supportedLocales.first;
  //     },

  //     debugShowCheckedModeBanner: false,
  //     initialRoute: Home,
  //     onGenerateRoute: RouteGenerator.generateRoute,
  //     home: Scaffold(body: MySplashScreen()),
  //   );
  // }
}

/// example
///
/// Text(
///   AppLocalizations.of(context).translate('first_string'),
/// )
///
///
///
/// BTN
///
/// onPressed() {
/// AppLocalizations.load(Locale('en', 'US'))
/// }

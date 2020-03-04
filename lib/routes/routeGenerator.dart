/// Route Generator class
///
/// This class contains all routes for the app
///
/// Imports:
///   Navigation Bar Controller
///   Routes
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020
import 'package:fillproject/dashboard/dashboard.dart';
import 'package:fillproject/dashboard/navigationBarController.dart';
import 'package:fillproject/home/homePage.dart';
import 'package:fillproject/login/loginPage.dart';
import 'package:fillproject/login/resetPasswordPage.dart';
import 'package:fillproject/login/sendEmailPage.dart';
import 'package:fillproject/register/EmailPage.dart';
import 'package:fillproject/register/passwordPage.dart';
import 'package:fillproject/register/registerPage.dart';
import 'package:fillproject/register/verifyPinPage.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Home:
        return MaterialPageRoute(builder: (_) => SignUp());
      case Register:
        return MaterialPageRoute(builder: (_) => RegisterPage(arguments: args));
      case VerifyPin:
        return MaterialPageRoute(
            builder: (_) => VerifyPinPage(arguments: args));
      case Password:
        return MaterialPageRoute(builder: (_) => PasswordPage(arguments: args));
      case Dashboard:
        return MaterialPageRoute(
            builder: (_) => DashboardPage(arguments: args));
      case Login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Email:
        return MaterialPageRoute(builder: (_) => EmailPage(arguments: args));
      case EmailReset:
        return MaterialPageRoute(builder: (_) => EmailResetPage());
      case PasswordReset:
        return MaterialPageRoute(
            builder: (_) => ResetPasswordPage(arguments: args));
      case NavBar:
        return MaterialPageRoute(
            builder: (_) => BottomNavigationBarController(arguments: args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: Container(
            child: Text('Error Screen'),
          ),
        ),
      );
    });
  }
}

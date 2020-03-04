/// Login Storage class
///
/// This class contains methods Login, autologin and logout.
///
/// Imports:
///   SharedPeferences for saving data to local storage.
///   Routes
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStorage {
  Future<Null> loginUser(String username, bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    // name = usernameController.text;
    isLoggedIn = true;
  }

  void autoLogIn(BuildContext context, bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('username');
    if (userId != null) {
      isLoggedIn = true;
      Navigator.of(context).pushNamed(NavBar,
          arguments: PasswordArguments(
              email: '', password: '', phone: '', username: userId));
      return;
    }
  }

  Future<Null> logout(String name, bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);
    name = '';
    isLoggedIn = false;
  }
}

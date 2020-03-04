/// Home Page class
///
/// This class contains methods and layout for Home page.
///
/// Imports:
///   MyColor constant class with all colors
///   Cloud_firestore for connection to the firebase
///   ScreenUtil class for respnsive desing
///   Routes
///   Database connections
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'dart:async';
import 'dart:io';

import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/firebaseMethods/firebaseSignIn.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:fillproject/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoggedIn = false;
  String name = '', username;

  @override
  void initState() {
    super.initState();
    autoLogIn(context, isLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    Constant().responsive(context);
    return Scaffold(
      backgroundColor: MyColor().black,
      body: Builder(
        builder: (context) => WillPopScope(
          onWillPop: _onWillPop,
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(210.0)),
              child: Column(
                children: <Widget>[
                  Center(
                      child: Text(
                    MyText().headline,
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(70.0),
                        color: MyColor().white,
                        fontFamily: roboto),
                  )),
                  Padding(
                      padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(120.0)),
                      child: Text(
                        MyText().subtitle,
                        style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(23.0),
                            color: MyColor().white),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    width: ScreenUtil.instance.setWidth(316.0),
                    height: ScreenUtil.instance.setHeight(67.0),
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(27.0), bottom: ScreenUtil.instance.setWidth(15.0), left: ScreenUtil.instance.setWidth(49.0), right: ScreenUtil.instance.setWidth(49.0)),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(33.5),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(Register);
                        },
                        child: Text(MyText().btnSU)),
                  ),
                  Container(
                    width: ScreenUtil.instance.setWidth(316.0),
                    height: ScreenUtil.instance.setHeight(67.0),
                    margin: EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(33.0), left: ScreenUtil.instance.setWidth(49.0), right: ScreenUtil.instance.setWidth(49.0)),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(33.5),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Login); // go to Login Page
                        },
                        child: Text(MyText().btnSI)),
                  ),
                  Container(
                      width: ScreenUtil.instance.setWidth(255.0),
                      child: Center(
                          child: FlatButton(
                              onPressed: () async {
                                //  FirebaseJson().importJson();
                                try {
                                  final result = await InternetAddress.lookup(
                                      'google.com');
                                  if (result.isNotEmpty &&
                                      result[0].rawAddress.isNotEmpty) {
                                    username = randomAlphaNumeric(5);
                                    loginUser();
                                    FirebaseSignIn()
                                        .signInAnonymously(username);
                                    Timer(Duration(milliseconds: 500), () {
                                      Navigator.of(context).pushNamed(NavBar,
                                          arguments: PasswordArguments(
                                              email: '',
                                              password: '',
                                              phone: '',
                                              username: username));
                                    });
                                  }
                                } on SocketException catch (_) {
                                  MySnackbar().showSnackbar(
                                      MyText().checkConnection,
                                      context,
                                      MyText().snackUndo);
                                }
                              },
                              child: Text(
                                MyText().skipThisStep,
                                style: TextStyle(
                                    color: MyColor().white, fontSize: ScreenUtil.instance.setSp(23.0)),
                              ))))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(MyText().willQuestion),
            content: new Text(MyText().willQuestion1),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(MyText().willNo),
              ),
              new FlatButton(
                onPressed: () => exit(0),
                child: new Text(MyText().willYes),
              ),
            ],
          ),
        ) ??
        true;
  }

  void autoLogIn(BuildContext context, bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('username');
    print(username);
    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        username = userId;
      });

      Navigator.of(context).pushNamed(NavBar,
          arguments: PasswordArguments(
              email: '', password: '', phone: '', username: username));
      return;
    }
  }

  //duplanje koda i implementacija funckije ovdje zbog setState-a
  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    setState(() {
      username = username;
      isLoggedIn = true;
    });
  }
}

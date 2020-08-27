/// Login Page class
///
/// This class contains methods and layout for login page.
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
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/components/myValidation.dart';
import 'package:fillproject/components/pageRouteBuilderAnimation.dart';
import 'package:fillproject/dashboard/navigationBarController.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/home/homePage.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/login/sendEmailPage.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _btnCounter = 0;
  String username, password;
  bool usernamePostoji = false;
  bool passwordPostoji = false;
  bool isLoggedIn = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(""),
        backgroundColor: Color.fromRGBO(74, 85, 98, 1.0),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: MyColor().white,
          onPressed: () {
            isFromProfile
                ? Navigator.of(context).pop()
                : Navigator.of(context).push(CardAnimationTween(
              widget: SignUp(),
            ));
          },
        ),
      ),
      backgroundColor: Color.fromRGBO(74, 85, 98, 1.0),
      body: Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: WillPopScope(
            onWillPop: _onWillPop,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        bottom: ScreenUtil.instance.setWidth(59.0),
                        left: ScreenUtil.instance.setWidth(49.0),
                        right: ScreenUtil.instance.setWidth(49.0),
                        top: ScreenUtil.instance.setWidth(28.0),
                      ),
                      child: SizedBox(
                          width: ScreenUtil.instance.setWidth(215.0),
                          height: ScreenUtil.instance.setHeight(60.0),
                          child: Text(
                              AppLocalizations.of(context)
                                  .translate('login&startGenMoney'),
                              style: TextStyle(
                                  color: MyColor().white,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: arabic,
                                  fontSize: ScreenUtil.instance.setSp(23.0)),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible)),
                    ),
                    Container(
                      width: ScreenUtil.instance.setWidth(316.0),
                      height: ScreenUtil.instance.setHeight(92.0),
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setWidth(10.0),
                          left: ScreenUtil.instance.setWidth(54.0),
                          right: ScreenUtil.instance.setWidth(55.0)),
                      child: TextFormField(
                        enableSuggestions: false,
                        textCapitalization: TextCapitalization.sentences,
                        controller: usernameController,
                        decoration: InputDecoration(
                          hasFloatingPlaceholder: false,
                          errorStyle: TextStyle(
                              inherit: true,
                              textBaseline: TextBaseline.ideographic),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 35.0),
                          labelText:
                              AppLocalizations.of(context).translate('email'),
                          labelStyle: TextStyle(
                            color: MyColor().white,
                            fontSize: ScreenUtil.instance.setSp(18.0),
                            fontFamily: arabic,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(color: MyColor().white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(color: MyColor().white),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: MyColor().error,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: MyColor().error,
                            ),
                          ),
                        ),
                        style: TextStyle(color: MyColor().white),
                        validator: (username) => MyValidation()
                            .validateUsernameLogin(username, usernamePostoji, context),
                        onChanged: (input) {
                          setState(() {
                            username = input;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: ScreenUtil.instance.setWidth(316.0),
                      height: ScreenUtil.instance.setHeight(100.0),
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setWidth(10.0),
                          left: ScreenUtil.instance.setWidth(54.0),
                          right: ScreenUtil.instance.setWidth(55.0)),
                      child: TextFormField(
                        enableSuggestions: false,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hasFloatingPlaceholder: false,
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 35.0),
                          labelText: AppLocalizations.of(context)
                              .translate('password'),
                          labelStyle: TextStyle(
                              color: MyColor().white,
                              fontFamily: arabic,
                              fontSize: ScreenUtil.instance.setSp(18.0)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(color: MyColor().white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(color: MyColor().white),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: MyColor().error,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: MyColor().error,
                            ),
                          ),
                        ),
                        style: TextStyle(color: MyColor().white),
                        obscureText: true,
                        validator: (password) => MyValidation()
                            .validatePasswordLogin(
                                password, passwordPostoji, context),
                        onChanged: (input) {
                          setState(() {
                            password = input;
                          });
                        },
                      ),
                    ),
                    Container(
                        width: ScreenUtil.instance.setWidth(316.0),
                        height: ScreenUtil.instance.setHeight(67.0),
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(35.0),
                            left: ScreenUtil.instance.setWidth(54.0),
                            right: ScreenUtil.instance.setWidth(55.0)),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(33.5),
                          ),
                          onPressed: () async {
                            try {
                              final result =
                                  await InternetAddress.lookup('google.com');
                              if (result.isNotEmpty &&
                                  result[0].rawAddress.isNotEmpty) {
                                onPressed(context);
                              }
                            } on SocketException catch (_) {
                              MySnackbar().showSnackbar(
                                  AppLocalizations.of(context)
                                      .translate('noIternent'),
                                  context,
                                  AppLocalizations.of(context)
                                      .translate('undo'));
                            }
                          },
                          child: Text(
                              AppLocalizations.of(context).translate('login'),
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(18.0))),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(20.0)),
                        child: RichText(
                            text: new TextSpan(children: [
                          new TextSpan(
                              text: AppLocalizations.of(context)
                                  .translate('forgetPass'),
                              style: TextStyle(
                                  color: MyColor().white,
                                  fontSize: ScreenUtil.instance.setSp(18.0),
                                  fontWeight: FontWeight.w300),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(CardAnimationTween(
                                      widget: EmailResetPage()));
                                })
                        ]))),
                    Column(
                      children: <Widget>[
                        FutureBuilder(
                          future:
                              FirebaseCheck().doesNameAlreadyExist(username),
                          builder: (context, AsyncSnapshot<bool> result) {
                            if (!result.hasData) {
                              return EmptyContainer();
                            }
                            if (result.data) {
                              usernamePostoji = false;
                              return EmptyContainer();
                            } else {
                              usernamePostoji = true;
                              return EmptyContainer();
                            }
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        FutureBuilder(
                          future: FirebaseCheck()
                              .doesPassAlreadyExist(password, username),
                          builder: (context, AsyncSnapshot<bool> result) {
                            if (!result.hasData) {
                              return EmptyContainer();
                            }
                            if (result.data) {
                              passwordPostoji = false;
                              return EmptyContainer();
                            } else {
                              passwordPostoji = true;
                              return EmptyContainer();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onPressed(BuildContext context) {
    final _formState = _formKey.currentState;
    if (_formState.validate()) {
      if (_btnCounter == 0) {
        username = usernameController.text;
        password = passwordController.text;
        loginUser();
        Navigator.of(context).push(CardAnimationTween(
            widget: BottomNavigationBarController(
          arguments: PasswordArguments(
              username: username, password: password, email: '', phone: ''),
        )));
        _btnCounter = 1;
        Timer(Duration(seconds: 2), () {
          _btnCounter = 0;
        });
      }
    }
  }

  //duplanje koda i implementacija funckije ovdje zbog setState-a
  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    // name = usernameController.text;
    setState(() {
      username = usernameController.text;
      isLoggedIn = true;
    });
  }

  Future<bool> _onWillPop() async {
    isFromProfile
        ? Navigator.of(context).pop()
        : Navigator.of(context).push(CardAnimationTween(
      widget: SignUp(),
    ));
    return EmptyContainer() ?? true;
  }
}

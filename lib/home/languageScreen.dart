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
import 'package:fillproject/components/checkIfIsFirstTime.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/myAlertDialog.dart';
import 'package:fillproject/components/pageRouteBuilderAnimation.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/home/homePage.dart';
import 'package:fillproject/localization/appLanguage.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:fillproject/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool isLoggedIn = false;
  String name = '', username;
  String selectedLanguageCode, selectedLanguage;
  var appLanguage;

  @override
  void initState() {
    super.initState();
    Check().isChecking();
    autoLogIn(context, isLoggedIn);
    getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    appLanguage = Provider.of<AppLanguage>(context);
    Constant().responsive(context);
    return Scaffold(
      backgroundColor: MyColor().black,
      body: Builder(
        builder: (context) => WillPopScope(
          onWillPop: _onWillPop,
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(170.0)),
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
                  Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setWidth(85.0)),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('register&get5SAR'),
                        style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(23.0),
                            color: MyColor().white),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(33.5),
                        border: Border.all(width: 1, color: MyColor().white),
                        color: languageOfApp == 'Arabic'
                            ? MyColor().white
                            : MyColor().black),
                    width: ScreenUtil.instance.setWidth(316.0),
                    height: ScreenUtil.instance.setHeight(67.0),
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(27.0),
                        bottom: ScreenUtil.instance.setWidth(15.0),
                        left: ScreenUtil.instance.setWidth(49.0),
                        right: ScreenUtil.instance.setWidth(49.0)),
                    child: RaisedButton(
                        color: languageOfApp == 'Arabic'
                            ? MyColor().white
                            : MyColor().black,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(33.5),
                        ),
                        onPressed: () {
                          setState(() {
                            appLanguage.changeLanguage(Locale("ar"));
                            selectedLanguage = AppLocalizations.of(context).translate('arabic');
                            languageOfApp = 'Arabic';
                          });

                          Navigator.of(context).push(
                            CardAnimationTween(
                              widget: SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context).translate('arabic'),
                          style: TextStyle(
                              color: languageOfApp == 'Arabic'
                                  ? MyColor().black
                                  : MyColor().white),
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(33.5),
                        border: Border.all(width: 1, color: MyColor().white),
                        color: languageOfApp == 'English'
                            ? MyColor().white
                            : MyColor().black),
                    width: ScreenUtil.instance.setWidth(316.0),
                    height: ScreenUtil.instance.setHeight(67.0),
                    margin: EdgeInsets.only(
                        bottom: ScreenUtil.instance.setWidth(33.0),
                        left: ScreenUtil.instance.setWidth(49.0),
                        right: ScreenUtil.instance.setWidth(49.0)),
                    child: RaisedButton(
                        color: languageOfApp == 'English'
                            ? MyColor().white
                            : MyColor().black,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(33.5),
                        ),
                        onPressed: () {
                          setState(() {
                            appLanguage.changeLanguage(Locale("en"));
                            selectedLanguage = AppLocalizations.of(context).translate('english');
                            languageOfApp = 'English';
                          });

                          Navigator.of(context).push(
                            CardAnimationTween(
                              widget: SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context).translate('english'),
                          style: TextStyle(
                              color: languageOfApp == 'English'
                                  ? MyColor().black
                                  : MyColor().white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///Method for fetching last selected language in order to continue
  ///
  ///with the same language after opening the application again
  getLanguage() async {
    var prefs = await SharedPreferences.getInstance();
    selectedLanguageCode = prefs.getString('language_code');
    if (selectedLanguageCode == 'en') {
      setState(() {
        selectedLanguage = AppLocalizations.of(context).translate('english');
        appLanguage.changeLanguage(Locale("en"));
        languageOfApp = 'English';
      });
    } else {
      setState(() {
        selectedLanguage = AppLocalizations.of(context).translate('english');
        appLanguage.changeLanguage(Locale("ar"));
        languageOfApp = 'Arabic';
      });
    }
  }

  exitApp() {
    exit(0);
  }

  Future<bool> _onWillPop() async {
    return showDialog(
          context: context,
          builder: (context) => MyAlertDialog(
            title: AppLocalizations.of(context).translate('areYouSure'),
            content:
                AppLocalizations.of(context).translate('doYouWantToExitTheApp'),
            yes: AppLocalizations.of(context).translate('yes'),
            notifyParent: exitApp,
            no: AppLocalizations.of(context).translate('no'),
          ),
        ) ??
        true;
  }

  void autoLogIn(BuildContext context, bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('username');
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
}

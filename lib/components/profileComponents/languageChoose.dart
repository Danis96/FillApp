import 'dart:async';

import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/appLanguage.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChoose extends StatefulWidget {
  final Function refresh;
  LanguageChoose({this.refresh});

  @override
  _LanguageChooseState createState() => _LanguageChooseState();
}

class _LanguageChooseState extends State<LanguageChoose> {
  String selectedLanguageCode;
  String selectedLanguage;
  var appLanguage;

  @override
  void initState() {
    super.initState();
    getLanguage();
  }

  refreshing() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    appLanguage = Provider.of<AppLanguage>(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              appLanguage.changeLanguage(Locale("ar"));
              selectedLanguage =
                  AppLocalizations.of(context).translate('arabic');
              languageOfApp = 'Arabic';
              var prefs = await SharedPreferences.getInstance();
              prefs.setString('language_code', 'ar');
              Timer(Duration(milliseconds: 100), () {
                widget.refresh();
              });
              Timer(Duration(milliseconds: 300), () {
                widget.refresh();
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(22.0)),
              width: ScreenUtil.instance.setWidth(156.0),
              height: ScreenUtil.instance.setWidth(58.0),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: MyColor().black),
                borderRadius: BorderRadius.all(Radius.circular(29)),
                color: languageOfApp == 'Arabic'
                    ? MyColor().white
                    : MyColor().black,
              ),
              child: Text(AppLocalizations.of(context).translate('arabic'),
                  style: TextStyle(
                      color: languageOfApp == 'Arabic'
                          ? MyColor().black
                          : MyColor().white,
                      fontWeight: FontWeight.w700,
                      fontFamily: arabic,
                      fontStyle: FontStyle.normal,
                      fontSize: ScreenUtil.instance.setSp(18.0)),
                  textAlign: TextAlign.center),
            ),
          ),
          GestureDetector(
            onTap: () async {
              appLanguage.changeLanguage(Locale("en"));
              selectedLanguage =
                  AppLocalizations.of(context).translate('english');
              languageOfApp = 'English';
              var prefs = await SharedPreferences.getInstance();
              prefs.setString('language_code', 'en');
              Timer(Duration(milliseconds: 100), () {
                widget.refresh();
              });
              Timer(Duration(milliseconds: 300), () {
                widget.refresh();
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: ScreenUtil.instance.setWidth(22.0),
                  left: ScreenUtil.instance.setWidth(5.0)),
              width: ScreenUtil.instance.setWidth(156.0),
              height: ScreenUtil.instance.setWidth(58.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: MyColor().black),
                  borderRadius: BorderRadius.all(Radius.circular(29)),
                  color: languageOfApp == 'English'
                      ? MyColor().white
                      : MyColor().black),
              child: Text(AppLocalizations.of(context).translate('english'),
                  style: TextStyle(
                      color: languageOfApp == 'English'
                          ? MyColor().black
                          : MyColor().white,
                      fontWeight: FontWeight.w700,
                      fontFamily: arabic,
                      fontStyle: FontStyle.normal,
                      fontSize: ScreenUtil.instance.setSp(18.0)),
                  textAlign: TextAlign.center),
            ),
          ),
        ],
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
        prefs.setString('language_code', 'en');
      });
    } else if (selectedLanguageCode == 'ar') {
      setState(() {
        selectedLanguage = AppLocalizations.of(context).translate('english');
        appLanguage.changeLanguage(Locale("ar"));
        languageOfApp = 'Arabic';
        prefs.setString('language_code', 'ar');
      });
    } else {
      setState(() {
        selectedLanguage = AppLocalizations.of(context).translate('english');
        appLanguage.changeLanguage(Locale("en"));
        languageOfApp = 'English';
        prefs.setString('language_code', 'en');
      });
    }
  }
}

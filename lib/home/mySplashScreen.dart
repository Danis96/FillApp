/// Splash Screen class
///
/// This class contains layout for SplashScreen page.
///
/// Imports:
///   MyColor constant class with all colors
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/home/languageScreen.dart';
import 'package:fillproject/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => new _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new LanguageScreen(),
//      title: new Text(
//        MyText().fill,
//        style: new TextStyle(
//            fontSize: 70.0, color: MyColor().white, fontFamily: roboto),
//      ),
    image: Image(
        image: AssetImage('assets/images/fillSplashSlogo.png'),
      ),
      gradientBackground:LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp,
        colors: [
          Color.fromRGBO(42, 92, 157, 1.0),
          Color.fromRGBO(47, 150, 126, 1.0),
        ],
      ),
      photoSize: SizeConfig.safeBlockHorizontal * 50,
      styleTextUnderTheLoader: new TextStyle(),
      onClick: () => new LanguageScreen(),
      loaderColor: Colors.transparent,
      loadingText: new Text(
        MyText().builtBy,
        style: new TextStyle(
            fontSize: 23, color: MyColor().white, fontFamily: roboto),
      ),
    );
  }
}

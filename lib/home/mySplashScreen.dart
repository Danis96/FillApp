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
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => new _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
//  final PushNotification _pushNotification = PushNotification();
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _fcm.configure(
      /// called when the app is in the foreground
      onMessage: (Map<String,dynamic> message) async {
        print('Message $message');
      },
        /// called when the app is closed completely
      onLaunch: (Map<String,dynamic> message) async {
      print('Message $message');
      },
        /// called when the app is in the bacgkround
      onResume: (Map<String,dynamic> message) async {
        print('Message $message');
      }
    );

    _fcm.requestNotificationPermissions(const IosNotificationSettings(sound: true, alert: true, badge: true));
    _fcm.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
       print('Settings registered: $settings');
    });
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          colors: [
            Color.fromRGBO(42, 92, 157, 1.0),
            Color.fromRGBO(47, 150, 126, 1.0),
          ],
        ),
      ),
//      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
      child: new SplashScreen(
        seconds: 2,
        navigateAfterSeconds: new LanguageScreen(),
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
        photoSize: MediaQuery.of(context).size.width < 400 ? SizeConfig.safeBlockHorizontal * 40 : SizeConfig.safeBlockHorizontal * 30,
        styleTextUnderTheLoader: new TextStyle(),
        onClick: () => new LanguageScreen(),
        loaderColor: Colors.transparent,
        loadingText: new Text(
          MyText().builtBy,
          style: new TextStyle(
              fontSize: 23, color: MyColor().white, fontFamily: roboto),
        ),
      ),
    );
  }
}

/// Navigation Bar Controller class
///
/// This class contains Layout for navigation bar.
///
/// Imports:
///   MyColor constant class with all colors
///   ScreenUtil class for respnsive desing
///   Routes
///   Other pages like Dashboard, Profile and Survey
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/imageConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/userExistanceCheck.dart';
import 'package:fillproject/dashboard/dashboard.dart';
import 'package:fillproject/dashboard/profile.dart';
import 'package:fillproject/dashboard/survey.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../components/emptyCont.dart';
import '../firebaseMethods/firebaseCheck.dart';
import '../routes/routeConstants.dart';

bool isTab1Selected = true;
bool isTab2Selected = false;
bool isLoading = true, showData = false;
DocumentSnapshot snap;
int isAnonymous, usersSars;
bool isUserInDB = true, isReadOnly = false;
Key key = UniqueKey();
String cc, dob, nameAndS;

class BottomNavigationBarController extends StatefulWidget {
  final PasswordArguments arguments;

  BottomNavigationBarController({Key key, this.arguments}) : super(key: key);
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState(arguments: arguments);
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final PasswordArguments arguments;
  _BottomNavigationBarControllerState({Key key, this.arguments});

  @override
  void initState() {
    super.initState();
    isOnSummary = false;
    /// after widget is done building call this method
    SchedulerBinding.instance.addPostFrameCallback((_) {
      settingStates();
    });
    
  }

  Widget getIsAnonymous(String username) {
    usernameGlobal = widget.arguments.username;
    passGlobal = widget.arguments.password;
    phoneGlobal = widget.arguments.phone;
    emailGlobal = widget.arguments.email;

    return FutureBuilder(
      future: FirebaseCheck().getUserUsername(username),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                snap = snapshot.data[index];
                isAnonymous = snap.data['is_anonymous'];
                passGlobal = snap.data['password'];
                emailGlobal = snap.data['email'];
                phoneGlobal = snap.data['phone'];
                usersSars = snap.data['sar'];
                cc = snap.data['cc'];
                dob = snap.data['date_of_birth'];
                return EmptyContainer();
              });
        }
        return EmptyContainer();
      },
    );
  }

  checkForInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isSar = false;
      }
    } on SocketException catch (_) {
      isSar = true;
    }
  }

  settingStates() {
    /// State 1
    ///
    /// user anonymous
    if (isAnonymous == 1) {
      /// if user is anonymous + no sars
      if (usersSars < 100 || saroviOffline < 100) {
        setState(() {
          btnText =
              AppLocalizations.of(context).translate('transferAfter100SAR');
        });
      } 
    }

    /// State 2
    ///
    /// user registered
    else if (isAnonymous == 0) {
      /// if user is registered + have sars + profile not completed
      if ((usersSars >= 100 || saroviOffline >= 100) && dob == '') {
        setState(() {
          btnText = AppLocalizations.of(context).translate('completeProfile');
        });

        /// if user is registered + have sars + profile completed
      } else if ((usersSars >= 100 || saroviOffline >= 100) && dob != '') {
        setState(() {
          btnText = AppLocalizations.of(context).translate('transfer');
        });

        /// if user is registered + no sars + not profile completed
      } else if ((usersSars < 100 || saroviOffline < 100) && dob != '') {
        setState(() {
          btnText =
              AppLocalizations.of(context).translate('transferAfter100SAR');
        });
      }
    }
  }

  List<Widget> pages() => [
        DashboardPage(
            arguments: PasswordArguments(
          email: emailGlobal,
          password: passGlobal,
          phone: phoneGlobal,
          username: arguments.username,
        )),
        SurveyPage(
            arguments: PasswordArguments(
          email: emailGlobal,
          password: passGlobal,
          phone: phoneGlobal,
          username: arguments.username,
        )),
        Profile(
            isAnonymous: isAnonymous,
            settingStates: settingStates,
            snap2: snap,
            refreshNavbar: refreshNavbar,
            isReadOnly: isReadOnly,
            btnText: btnText,
            arguments: PasswordArguments(
              email: emailGlobal,
              password: passGlobal,
              phone: phoneGlobal,
              username: arguments.username,
            )),
        getIsAnonymous(arguments.username),
      ];

  int currentIndex = 1;

  void onTap(int index) {
    Timer(Duration(milliseconds: 600), () {
      settingStates();
      setState(() {
        currentIndex = index;
      });
    });

    if (currentIndex == 0) {
      isTab1Selected = true;
      isTab2Selected = false;
    } else if (currentIndex == 1) {
      isTab1Selected = false;
      isTab2Selected = true;
    } else if (currentIndex == 2) {
      isTab1Selected = false;
      isTab2Selected = false;
      getIsAnonymous(arguments.username);
      checkForInternet();
      if (isAnonymous == 1) {
        anonym = 1;
      } else {
        anonym = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: MyColor().black,
          unselectedItemColor: MyColor().unselectedItemColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(IconData(0xF391,
                  fontFamily: CupertinoIcons.iconFont,
                  fontPackage: CupertinoIcons.iconFontPackage)),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: isTab2Selected
                  ? ImageIcon(AssetImage(imageTab2))
                  : ImageIcon(AssetImage(imageTab2)),
              title: Text(''),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text(''))
          ],
          currentIndex: currentIndex,
          onTap: (currentIndex) {
            setState(() {});
            onTap(currentIndex);
          }),
      body: isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  UserExistanceCheck(
                      username: arguments.username, isUserInDB: isUserInDB),
                  isLoadingCircular(),
                ],
              ),
            )
          : IndexedStack(
              index: currentIndex,
              children: pages(),
            ),
    );
  }

  navigateToRegister() {
    Navigator.of(context).pushNamed(Register,
        arguments:
            DidntRecievePinArguments(username: widget.arguments.username));
  }

  refreshNavbar() {
    setState(() {
      key = UniqueKey();
    });
  }

  /// function for loader
  ///
  /// this function returns [CircularProgressIndicator]
  /// and after 1 second the variable that controls indicator is set to false
  isLoadingCircular() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
    return CircularProgressIndicator(
      backgroundColor: MyColor().black,
    );
  }
}

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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/imageConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/dashboard/dashboard.dart';
import 'package:fillproject/dashboard/profile.dart';
import 'package:fillproject/dashboard/survey.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:flutter/material.dart';

import '../components/constants/myText.dart';
import '../components/emptyCont.dart';
import '../firebaseMethods/firebaseCheck.dart';
import '../routes/routeConstants.dart';

bool isTab1Selected = true;
bool isTab2Selected = false;
bool isLoading = true;
DocumentSnapshot snap;
int isAnonymous;

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

  
  Widget getIsAnonymous(String username) {
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
                return EmptyContainer();
              });
        }
        return EmptyContainer();
      },
    );
  }

  List<Widget> pages() => [
        DashboardPage(
            arguments: PasswordArguments(
          email: arguments.email,
          password: arguments.password,
          phone: arguments.phone,
          username: arguments.username,
        )),
        Survey(),
        Profile(
            arguments: PasswordArguments(
          email: arguments.email,
          password: arguments.password,
          phone: arguments.phone,
          username: arguments.username,
        )),
        getIsAnonymous(arguments.username)
      ];

  final items = [
    BottomNavigationBarItem(
      icon: isTab1Selected
          ? ImageIcon(AssetImage(imageTab1))
          : ImageIcon(AssetImage(imageTab1)),
      title: Text(''),
    ),
    BottomNavigationBarItem(
      icon: isTab2Selected
          ? ImageIcon(AssetImage(imageTab2))
          : ImageIcon(AssetImage(imageTab2)),
      title: Text(''),
    ),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text(''))
  ];

  int currentIndex = 1;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
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
      print(arguments.username);
      print(isAnonymous);
      if (isAnonymous == 1) {
        askUserToRegister();
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
          items: items,
          currentIndex: currentIndex,
          onTap: onTap),
      body: isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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

  askUserToRegister() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(MyText().registerQuestion),
        content: new Text(MyText().registerQuestion1),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: new Text(MyText().registerNo),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pushNamed(Register,
                arguments: DidntRecievePinArguments(
                    username: widget.arguments.username)),
            child: new Text(MyText().willYes),
          ),
        ],
      ),
    );
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

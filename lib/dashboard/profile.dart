import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/profileComponents/languageChoose.dart';
import 'package:fillproject/dashboard/navigationBarController.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routes/routeArguments.dart';

/// Profile class
///
/// This class contains methods and layout for profile page.
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

class Profile extends StatefulWidget {
  final PasswordArguments arguments;
  final DocumentSnapshot doc;
  final String usersName,
      usersEmail,
      usersCC,
      usersDOB,
      usersCard,
      usersCardDate;
  final int usersSars;

  Profile(
      {Key key,
      this.usersSars,
      this.arguments,
      this.doc,
      this.usersCard,
      this.usersCardDate,
      this.usersCC,
      this.usersDOB,
      this.usersEmail,
      this.usersName})
      : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

TextEditingController controllerName = TextEditingController(text: usersName);
TextEditingController controllerDOB = TextEditingController(text: usersDOB);
TextEditingController controllerEmail = TextEditingController(text: usersEmail);
TextEditingController controllerCreditCard =
    TextEditingController(text: usersCard);
TextEditingController controllerDate =
    TextEditingController(text: usersCardDate);
TextEditingController controllerCC = TextEditingController(text: usersCC);
String name, dateOfBirth, email, creditCard, date, cc;
bool isSar = false,
    isEmptyName = false,
    isEmptyBirth = false,
    isEmptyMail = false,
    isEmptyCard = false,
    isEmptyDate = false,
    isEmptyCC = false;

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    checkForInternet();
    print('BILDAO SSAAAAAAAAAAAAAAAAAAAMMMMMMMM');
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

  @override
  Widget build(BuildContext context) {
    print(anonym);
    print(widget.arguments.username);

    /// State 1
    if (usersSars < 100) {
      print('STATE 1');
      print('Transfer after 100 SAR');
      setState(() {
        btnText = 'Transfer after 100 SAR';
      });
    }

    /// State 2
    if (usersSars >= 100) {
      print('STATE 2');
      print('SAROVI SU VEĆI OD 100');
      if (anonym == 0) {
        print('USER NIJE ANONIMNI');
        if (controllerName.text == null ||
            controllerDate.text == null ||
            controllerEmail.text == null ||
            controllerCreditCard.text == null ||
            controllerDOB.text == null ||
            controllerCC.text == null ||
            controllerName.text == '' ||
            controllerDate.text == '' ||
            controllerEmail.text == '' ||
            controllerCreditCard.text == '' ||
            controllerDOB.text == '' ||
            controllerCC.text == '') {
          print('POLJA SU PRAZNA');
          setState(() {
            btnText = 'Complete profile';
          });
        }
      } else {
        print('USER JE ANONIMNI');
        print('HAHAHAHAAAAAAAAAAAAAAAAAAA');
        setState(() {
          btnText = 'Register';
        });
      }
    }

    /// State 3
    if (usersSars >= 100 && anonym == 0) {
      if (controllerName.text != null &&
          controllerDate.text != null &&
          controllerEmail.text != null &&
          controllerCreditCard.text != null &&
          controllerDOB.text != null &&
          controllerCC.text != null &&
          controllerName.text != '' &&
          controllerDate.text != '' &&
          controllerEmail.text != '' &&
          controllerCreditCard.text != '' &&
          controllerDOB.text != '' &&
          controllerCC.text != '') {
        print('STATE 3');
        setState(() {
          btnText = 'Transfer';
        });
      }
    }

    return Scaffold(
      body: ListView(shrinkWrap: true, children: <Widget>[
        Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(70.0)),
              child: Text(
                'Profile',
                style: TextStyle(fontSize: 23.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0)),
              child: bigCircle,
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0)),
              child: rowBelow,
            ),
            Container(
              width: ScreenUtil.instance.setWidth(316.0),
              height: ScreenUtil.instance.setHeight(67.0),
              margin: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(47.0),
                top: ScreenUtil.instance.setWidth(22.0),
                right: ScreenUtil.instance.setWidth(47.0),
              ),
              child: TextFormField(
                maxLength: 200,
                enableSuggestions: false,
                style: TextStyle(color: Colors.black),
                controller: controllerName,
                decoration: InputDecoration(
                  counterText: '',
                  hasFloatingPlaceholder: false,
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 35.0),
                  labelText: 'Enter your name',
                  labelStyle: TextStyle(color: MyColor().black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                      color: isEmptyName ? MyColor().error : MyColor().black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                        color: isEmptyName ? MyColor().error : MyColor().black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                      color: MyColor().error,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                      color: MyColor().error,
                    ),
                  ),
                ),
                obscureText: false,
              ),
            ),
            Container(
              width: ScreenUtil.instance.setWidth(316.0),
              height: ScreenUtil.instance.setHeight(67.0),
              margin: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(47.0),
                top: ScreenUtil.instance.setWidth(22.0),
                right: ScreenUtil.instance.setWidth(47.0),
              ),
              child: TextFormField(
                maxLength: 200,
                enableSuggestions: false,
                style: TextStyle(color: Colors.black),
                controller: controllerDOB,
                decoration: InputDecoration(
                  counterText: '',
                  hasFloatingPlaceholder: false,
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 35.0),
                  labelText: 'Enter date of birth',
                  labelStyle: TextStyle(color: MyColor().black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                      color: isEmptyBirth ? MyColor().error : MyColor().black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                        color:
                            isEmptyBirth ? MyColor().error : MyColor().black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                      color: MyColor().error,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                      color: MyColor().error,
                    ),
                  ),
                ),
                obscureText: false,
              ),
            ),
            Container(
              width: ScreenUtil.instance.setWidth(316.0),
              height: ScreenUtil.instance.setHeight(67.0),
              margin: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(47.0),
                top: ScreenUtil.instance.setWidth(22.0),
                right: ScreenUtil.instance.setWidth(47.0),
              ),
              child: TextFormField(
                maxLength: 200,
                enableSuggestions: false,
                style: TextStyle(color: Colors.black),
                controller: controllerEmail,
                decoration: InputDecoration(
                  counterText: '',
                  hasFloatingPlaceholder: false,
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 35.0),
                  labelText: 'Enter email',
                  labelStyle: TextStyle(color: MyColor().black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                      color: isEmptyMail ? MyColor().error : MyColor().black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                        color: isEmptyMail ? MyColor().error : MyColor().black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                      color: MyColor().error,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                      color: MyColor().error,
                    ),
                  ),
                ),
                obscureText: false,
              ),
            ),
            Container(
              child: LanguageChoose(),
            ),
            Container(
              width: ScreenUtil.instance.setWidth(316.0),
              height: ScreenUtil.instance.setHeight(67.0),
              margin: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(47.0),
                top: ScreenUtil.instance.setWidth(22.0),
                right: ScreenUtil.instance.setWidth(47.0),
              ),
              child: TextFormField(
                maxLength: 200,
                enableSuggestions: false,
                style: TextStyle(color: Colors.black),
                controller: controllerCreditCard,
                decoration: InputDecoration(
                  counterText: '',
                  hasFloatingPlaceholder: false,
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 35.0),
                  labelText: 'Enter card number ',
                  labelStyle: TextStyle(color: MyColor().black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                      color: isEmptyCard ? MyColor().error : MyColor().black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                        color: isEmptyCard ? MyColor().error : MyColor().black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                      color: MyColor().error,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.5)),
                    borderSide: BorderSide(
                      color: MyColor().error,
                    ),
                  ),
                ),
                obscureText: false,
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil.instance.setWidth(156.0),
                  height: ScreenUtil.instance.setHeight(67.0),
                  margin: EdgeInsets.only(
                    left: ScreenUtil.instance.setWidth(47.0),
                    top: ScreenUtil.instance.setWidth(22.0),
                    right: ScreenUtil.instance.setWidth(0.0),
                  ),
                  child: TextFormField(
                    maxLength: 200,
                    enableSuggestions: false,
                    style: TextStyle(color: Colors.black),
                    controller: controllerDate,
                    decoration: InputDecoration(
                      counterText: '',
                      hasFloatingPlaceholder: false,
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 35.0),
                      labelText: 'Date',
                      labelStyle: TextStyle(color: MyColor().black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.5)),
                        borderSide: BorderSide(
                          color:
                              isEmptyDate ? MyColor().error : MyColor().black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.5)),
                        borderSide: BorderSide(
                            color: isEmptyDate
                                ? MyColor().error
                                : MyColor().black),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.5)),
                        borderSide: BorderSide(
                          color: MyColor().error,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.5)),
                        borderSide: BorderSide(
                          color: MyColor().error,
                        ),
                      ),
                    ),
                    obscureText: false,
                  ),
                ),
                Container(
                  width: ScreenUtil.instance.setWidth(156.0),
                  height: ScreenUtil.instance.setHeight(67.0),
                  margin: EdgeInsets.only(
                    left: ScreenUtil.instance.setWidth(5.0),
                    top: ScreenUtil.instance.setWidth(22.0),
                    right: ScreenUtil.instance.setWidth(0.0),
                  ),
                  child: TextFormField(
                    maxLength: 200,
                    enableSuggestions: false,
                    style: TextStyle(color: Colors.black),
                    controller: controllerCC,
                    decoration: InputDecoration(
                      counterText: '',
                      hasFloatingPlaceholder: false,
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 35.0),
                      labelText: 'CC',
                      labelStyle: TextStyle(color: MyColor().black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.5)),
                        borderSide: BorderSide(
                          color: isEmptyCC ? MyColor().error : MyColor().black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.5)),
                        borderSide: BorderSide(
                            color:
                                isEmptyCC ? MyColor().error : MyColor().black),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.5)),
                        borderSide: BorderSide(
                          color: MyColor().error,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.5)),
                        borderSide: BorderSide(
                          color: MyColor().error,
                        ),
                      ),
                    ),
                    obscureText: false,
                  ),
                ),
              ],
            ),
            Container(
              child: btnProfile(),
            ),
          ],
        )),
      ]),
    );
  }

  onPressed() {
    name = controllerName.text;
    email = controllerEmail.text;
    dateOfBirth = controllerDOB.text;
    creditCard = controllerCreditCard.text;
    date = controllerDate.text;
    cc = controllerCC.text;

    print('TEXT JE: + ' + btnText);

    if (name == '') {
      setState(() {
        isEmptyName = true;
      });
      Timer(Duration(seconds: 2), () {
        setState(() {
          isEmptyName = false;
        });
      });
    } else if (email == '') {
      setState(() {
        isEmptyMail = true;
      });
      Timer(Duration(seconds: 2), () {
        setState(() {
          isEmptyMail = false;
        });
      });
    } else if (dateOfBirth == '') {
      setState(() {
        isEmptyBirth = true;
      });
      Timer(Duration(seconds: 2), () {
        setState(() {
          isEmptyBirth = false;
        });
      });
    } else if (creditCard == '') {
      setState(() {
        isEmptyCard = true;
      });
      Timer(Duration(seconds: 2), () {
        setState(() {
          isEmptyCard = false;
        });
      });
    } else if (date == '') {
      setState(() {
        isEmptyDate = true;
      });
      Timer(Duration(seconds: 2), () {
        setState(() {
          isEmptyDate = false;
        });
      });
    } else if (cc == '') {
      setState(() {
        isEmptyCC = true;
      });
      Timer(Duration(seconds: 2), () {
        setState(() {
          isEmptyCC = false;
        });
      });
    } else {
      print('Your name is : ' +
          name +
          '\n' +
          'Your email is : ' +
          email +
          '\n' +
          'Your date of birth : ' +
          dateOfBirth +
          '\n' +
          'Your credit card number is : ' +
          creditCard +
          '\n' +
          'Your card date is :' +
          date +
          '\n' +
          'Your CC is : ' +
          cc);

      print('TEXT JE: + ' + btnText);
      if (btnText == 'Register') {
        userRegister();
      } else if (btnText == 'Complete profile') {
        completeProfile();
      } else if (btnText == 'Transfer') {
        transferSAR();
      }
    }
  }

  /// Metoda koja se poziva na klik button-a kada na njemu piše 'Register'
  userRegister() {
    Navigator.of(context).pushNamed(Register,
        arguments:
            DidntRecievePinArguments(username: widget.arguments.username));
  }

  /// Metoda koja se poziva na klik button-a kada na njemu piše 'Complete profile'
  completeProfile() {
    FirebaseCrud().updateUserOnCompletePRofile(
        widget.doc,
        controllerName.text,
        controllerDOB.text,
        controllerEmail.text,
        controllerCreditCard.text,
        controllerDate.text,
        controllerCC.text,
        usersSars);
    setState(() {
      btnText = 'Transfer';
    });
  }

  transferSAR() {
    FirebaseCrud().updateUserOnCompletePRofile(
        widget.doc,
        controllerName.text,
        controllerDOB.text,
        controllerEmail.text,
        controllerCreditCard.text,
        controllerDate.text,
        controllerCC.text,
        0);
    setState(() {
      btnText = 'Transfer after 100';
    });
  }

  btnProfile() {
    return Container(
      child: Container(
        margin: EdgeInsets.only(
            top: ScreenUtil.instance.setWidth(30.0),
            bottom: ScreenUtil.instance.setWidth(20.0)),
        width: ScreenUtil.instance.setWidth(303.0),
        height: ScreenUtil.instance.setWidth(58.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(29)),
            color: MyColor().white),
        child: RaisedButton(
            color: MyColor().black,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(28.0),
            ),
            child: btnText == 'Register'
                ? Text('Register',
                    style: TextStyle(
                        color: MyColor().white,
                        fontFamily: "LoewNextArabic",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center)
                : btnText == 'Transfer'
                    ? Text('Transfer',
                        style: TextStyle(
                            color: MyColor().white,
                            fontFamily: "LoewNextArabic",
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0),
                        textAlign: TextAlign.center)
                    : btnText == 'Complete profile'
                        ? Text('Complete profile',
                            style: TextStyle(
                                color: MyColor().white,
                                fontFamily: "LoewNextArabic",
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0),
                            textAlign: TextAlign.center)
                        : Text('Transfer after 100 SAR',
                            style: TextStyle(
                                color: MyColor().white,
                                fontFamily: "LoewNextArabic",
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0),
                            textAlign: TextAlign.center),
            onPressed: () => onPressed()),
      ),
    );
  }
}

Widget bigCircle = Container(
  width: ScreenUtil.instance.setWidth(198.0),
  height: ScreenUtil.instance.setHeight(198.0),
  child: Column(
    children: <Widget>[
      Container(
          margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(40.0)),
          child: Text(
            usersSars.toString(),
            style: TextStyle(
              color: btnText == 'Complete profile'
                  ? MyColor().black
                  : btnText == 'Transfer' ? MyColor().black : MyColor().white,
              fontSize: 35.0,
              fontFamily: "LoewNextArabic",
            ),
          )),
      Container(
          child: Text(
        'SAR',
        style: TextStyle(
          color: btnText == 'Complete profile'
              ? MyColor().black
              : btnText == 'Transfer' ? MyColor().black : MyColor().white,
          fontSize: 35.0,
          fontFamily: "LoewNextArabic",
        ),
      )),
    ],
  ),
  decoration: BoxDecoration(
    border: Border.all(
        width: 1,
        color: btnText == 'Complete profile'
            ? Colors.red
            : btnText == 'Transfer' ? Colors.green : MyColor().white),
    color: btnText == 'Complete profile'
        ? MyColor().white
        : btnText == 'Transfer' ? MyColor().white : MyColor().black,
    shape: BoxShape.circle,
  ),
);

Widget rowBelow = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        child: Text('transfer with'),
      ),
      Container(
        height: ScreenUtil.instance.setHeight(27.0),
        width: ScreenUtil.instance.setWidth(81.0),
        margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
        child: Image.asset('assets/images/transferImage.png'),
      ),
    ],
  ),
);

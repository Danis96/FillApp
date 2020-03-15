import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/profileComponents/languageChoose.dart';
import 'package:fillproject/components/profileComponents/textFieldProfile.dart';
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
  Profile({Key key, this.arguments}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

TextEditingController controllerName = TextEditingController();
TextEditingController controllerDOB = TextEditingController();
TextEditingController controllerEmail = TextEditingController();
TextEditingController controllerCreditCard = TextEditingController();
TextEditingController controllerDate = TextEditingController();
TextEditingController controllerCC = TextEditingController();
String name, dateOfBirth, email, creditCard, date, cc;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
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
              child: TextFieldProfile(
                controller: controllerName,
                label: 'Enter your name',
                maxTextLength: 100,
                obscureText: false,
                widthh: 316.0,
                leftMargin: 47.0,
                rightMargin: 47.0,
              ),
            ),
            Container(
              child: TextFieldProfile(
                controller: controllerDOB,
                label: 'Enter date of birth',
                maxTextLength: 100,
                obscureText: false,
                widthh: 316.0,
                leftMargin: 47.0,
                rightMargin: 47.0,
              ),
            ),
            Container(
              child: TextFieldProfile(
                controller: controllerEmail,
                label: 'Enter email',
                maxTextLength: 100,
                obscureText: false,
                widthh: 316.0,
                leftMargin: 47.0,
                rightMargin: 47.0,
              ),
            ),
            Container(
              child: LanguageChoose(),
            ),
            Container(
              child: TextFieldProfile(
                controller: controllerCreditCard,
                label: 'Enter card number',
                maxTextLength: 100,
                obscureText: false,
                widthh: 316.0,
                leftMargin: 47.0,
                rightMargin: 47.0,
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: TextFieldProfile(
                    controller: controllerDate,
                    label: 'Date',
                    maxTextLength: 100,
                    obscureText: false,
                    widthh: 156.0,
                    leftMargin: 47.0,
                    rightMargin: 0.0,
                  ),
                ),
                Container(
                  child: TextFieldProfile(
                    controller: controllerCC,
                    label: 'CC',
                    maxTextLength: 100,
                    obscureText: false,
                    widthh: 156.0,
                    leftMargin: 5.0,
                    rightMargin: 0.0,
                  ),
                ),
              ],
            ),
            Container(
              child: btnProfile,
            ),
          ],
        )),
      ]),
    );
  }
}

Widget btnProfile = Container(
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
        child: Text('Transfer after 100 SAR',
            style: TextStyle(
                color: MyColor().white,
                fontFamily: "LoewNextArabic",
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
            textAlign: TextAlign.center),
        onPressed: () => onPressed()),
  ),
);

onPressed() {
  name = controllerName.text;
  email = controllerEmail.text;
  dateOfBirth = controllerDOB.text;
  creditCard = controllerCreditCard.text;
  date = controllerDate.text;
  cc = controllerCC.text;

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
}

Widget bigCircle = Container(
  width: ScreenUtil.instance.setWidth(198.0),
  height: ScreenUtil.instance.setHeight(198.0),
  child: Column(
    children: <Widget>[
      Container(
          margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(40.0)),
          child: Text(
            '5',
            style: TextStyle(
              color: MyColor().white,
              fontSize: 35.0,
              fontFamily: "LoewNextArabic",
            ),
          )),
      Container(
          child: Text(
        'SAR',
        style: TextStyle(
          color: MyColor().white,
          fontSize: 35.0,
          fontFamily: "LoewNextArabic",
        ),
      )),
    ],
  ),
  decoration: BoxDecoration(
    color: MyColor().black,
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
        margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
        child: Text('slika'),
      ),
    ],
  ),
);

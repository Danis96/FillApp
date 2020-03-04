/// Verify Pin  class
///
/// This class contains methods and layout for Verify Pin page.
///
/// Imports:
///   MyColor constant class with all colors
///   ScreenUtil class for respnsive desing
///   Routes
///   Database connections
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'dart:async';
import 'dart:io';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/myPinCode.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/components/myTextComponent.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:fillproject/utils/screenUtils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String verificationCode;
int _btnCounter = 0;

class VerifyPinPage extends StatefulWidget {
  final RegisterArguments arguments;

  VerifyPinPage({this.arguments});

  @override
  _VerifyPinPageState createState() => _VerifyPinPageState();
}

class _VerifyPinPageState extends State<VerifyPinPage> {
  bool fieldColor = false, codeError = false;

  String smsCode, wrongCodeError;

  TextEditingController codeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Constant().responsive(context);
    signIn(String smsCode) {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
          verificationId: widget.arguments.verId, smsCode: smsCode);
      FirebaseAuth.instance.signInWithCredential(credential).then((user) async {
        Navigator.of(context).pushNamed(Email,
            arguments: RegisterArguments(
                username: widget.arguments.username,
                usernameSecond: widget.arguments.usernameSecond,
                phone: widget.arguments.phone));
      }).catchError((e) {
        print('Auth Credential Error : $e');
        wrongCodeError = e.toString();
        setState(() {
          codeError = true;
        });
        Timer(Duration(seconds: 2), () {
          setState(() {
            codeError = false;
          });
        });
      });
    }

    onPressed(BuildContext context) {
      smsCode = codeController.text;
      if (smsCode.length < 6) {
        setState(() {
          fieldColor = true;
        });
        Timer(Duration(seconds: 2), () {
          setState(() {
            fieldColor = false;
          });
        });
      } else {
        setState(() {
          fieldColor = false;
          codeError = false;
          if (_btnCounter == 0) {
            FirebaseAuth.instance.currentUser().then((user) {
              signIn(smsCode);
            });
            _btnCounter = 1;
            Timer(Duration(seconds: 2), () {
              _btnCounter = 0;
            });
          }
        });
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColor().black,
      body: Builder(
        builder: (context) => Center(
            child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(105), bottom: ScreenUtil.instance.setWidth(35.0)),
                child: MyTextComponent(text: MyText().verifyPageHeadline)),
            Container(
              child: Text(
                MyText().verifyMoney,
                style: TextStyle(
                    color: MyColor().white,
                    fontSize: ScreenUtil.instance.setSp(40.0)),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(23.0)),
              child: Text(MyText().verifyEnterPin,
                  style: TextStyle(
                      color: MyColor().white,
                      fontSize: ScreenUtil.instance.setSp(17.0),
                      fontWeight: FontWeight.w300)),
            ),
            Container(
              child: Container(
                height: ScreenUtil.instance.setHeight(83.0),
                width: ScreenUtil.instance.setWidth(350.0),
                child: MyPinCodeTextField(
                  length: 6,
                  animationType: AnimationType.fade,
                  shape: PinCodeFieldShape.circle,
                  animationDuration: Duration(milliseconds: 400),
                  fieldHeight: ScreenUtil.instance.setHeight(60),
                  fieldWidth: ScreenUtil.instance.setWidth(50),
                  textStyle: TextStyle(color: MyColor().white, fontSize: ScreenUtil.instance.setSp(28)),
                  activeColor: fieldColor || codeError
                      ? MyColor().error
                      : MyColor().white,
                  inactiveColor: fieldColor || codeError
                      ? MyColor().error
                      : MyColor().white,
                  selectedColor: fieldColor || codeError
                      ? MyColor().error
                      : MyColor().white,
                  backgroundColor: MyColor().black,
                  borderWidth: ScreenUtil.instance.setWidth(1),
                  controller: codeController,
                  onChanged: (value) => {
                    setState(() {
                      smsCode = value;
                    }),
                  },
                ),
              ),
            ),
            Container(
              child: fieldColor
                  ? Text(
                      MyText().smsLengthSnack,
                      style: TextStyle(color: MyColor().error),
                    )
                  : codeError
                      ? Text(MyText().wrongCode,
                          style: TextStyle(color: MyColor().error))
                      : Text(''),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(20.0)),
              width: ScreenUtil.instance.setWidth(316.0),
              height: ScreenUtil.instance.setHeight(67.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(33.5),
                ),
                onPressed: () async {
                  try {
                    final result = await InternetAddress.lookup('google.com');
                    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                      onPressed(context);
                    }
                  } on SocketException catch (_) {
                    MySnackbar().showSnackbar(
                        MyText().checkConnection, context, MyText().snackUndo);
                  }
                },
                child: Text(MyText().btnVerify, style: TextStyle(fontSize: ScreenUtil.instance.setSp(18))),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(20.0)),
                child: RichText(
                    text: new TextSpan(children: [
                  new TextSpan(
                      text: MyText().verifyRecieve,
                      style: TextStyle(
                          color: MyColor().white,
                          fontSize: ScreenUtil.instance.setSp(15.0),
                          fontWeight: FontWeight.w300),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed(Register,
                              arguments: DidntRecievePinArguments(
                                  phone: widget.arguments.phone,
                                  username: widget.arguments.username));
                        })
                ]))),
          ],
        )),
      ),
    );
  }
}

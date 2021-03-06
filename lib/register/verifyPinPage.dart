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
import 'package:fillproject/components/myPinCode.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/components/myTextComponent.dart';
import 'package:fillproject/components/pageRouteBuilderAnimation.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/register/emailAndDOB.dart';
import 'package:fillproject/register/passwordPage.dart';
import 'package:fillproject/register/registerPage.dart';
import 'package:fillproject/routes/routeArguments.dart';
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
        Navigator.of(context).push(
          CardAnimationTween(
            widget: NameAndDOB(
                arguments: RegisterArguments(
                    email: widget.arguments.email,
                    verId: widget.arguments.verId,
                    username: widget.arguments.username,
                    usernameSecond: widget.arguments.usernameSecond,
                    phone: widget.arguments.phone)),
          ),
        );
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
      backgroundColor: Color.fromRGBO(74, 85, 98, 1.0),
      body: Builder(
        builder: (context) => Center(
            child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.instance.setWidth(105),
                    bottom: ScreenUtil.instance.setWidth(35.0)),
                child: MyTextComponent(
                    text: AppLocalizations.of(context)
                        .translate('verifyYourNumber'))),
            Container(
              child: Text(
                AppLocalizations.of(context).translate('verifySAR'),
                style: TextStyle(
                    color: MyColor().white,
                    fontSize: ScreenUtil.instance.setSp(40.0)),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(23.0)),
              child: Text(AppLocalizations.of(context).translate('enterThePin'),
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
                  textStyle: TextStyle(
                      color: MyColor().white,
                      fontSize: ScreenUtil.instance.setSp(28)),
                  activeColor: fieldColor || codeError
                      ? MyColor().error
                      : MyColor().white,
                  inactiveColor: fieldColor || codeError
                      ? MyColor().error
                      : MyColor().white,
                  selectedColor: fieldColor || codeError
                      ? MyColor().error
                      : MyColor().white,
                  backgroundColor: Color.fromRGBO(74, 85, 98, 1.0),
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
                      AppLocalizations.of(context).translate('smsCodeLess6'),
                      style: TextStyle(color: MyColor().error),
                    )
                  : codeError
                      ? Text(
                          AppLocalizations.of(context)
                              .translate('youEnteredInvalidCode'),
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
                        AppLocalizations.of(context).translate('noIternent'),
                        context,
                        AppLocalizations.of(context).translate('undo'));
                  }
                },
                child: Text(AppLocalizations.of(context).translate('verifyPin'),
                    style: TextStyle(fontSize: ScreenUtil.instance.setSp(18))),
              ),
            ),
            Container(
                margin:
                    EdgeInsets.only(top: ScreenUtil.instance.setWidth(20.0)),
                child: RichText(
                    text: new TextSpan(children: [
                  new TextSpan(
                      text: AppLocalizations.of(context)
                          .translate('didntRecievePIN'),
                      style: TextStyle(
                          color: MyColor().white,
                          fontSize: ScreenUtil.instance.setSp(15.0),
                          fontWeight: FontWeight.w300),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            CardAnimationTween(
                              widget: RegisterPage(
                                  arguments: DidntRecievePinArguments(
                                      phone: widget.arguments.phone,
                                      username: widget.arguments.username)),
                            ),
                          );
                        })
                ]))),
          ],
        )),
      ),
    );
  }
}

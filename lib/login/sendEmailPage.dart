/// Send Email  class
///
/// This class contains methods and layout for dashboard page.
///
/// Imports:
///   MyColor constant class with all colors
///   Cloud_firestore for connection to the firebase
///   ScreenUtil class for respnsive desing
///   Routes
///   Database methods
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'dart:async';
import 'dart:io';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/components/myValidation.dart';
import 'package:fillproject/firebaseMethods/resetPassword.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_string/random_string.dart';

class EmailResetPage extends StatelessWidget {
  String email;
  int _btnCounter = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor().black,
      appBar: new AppBar(
        title: new Text(""),
        backgroundColor: MyColor().black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(25.0)),
                child: SizedBox(
                    width: 184,
                    height: 28,
                    child: Text(MyText().emailReset,
                        style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LoewNextArabic',
                            fontStyle: FontStyle.normal,
                            fontSize: 23.0),
                        textAlign: TextAlign.center)),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.instance.setWidth(28.0), right: ScreenUtil.instance.setWidth(73.0), left: ScreenUtil.instance.setWidth(72.0), bottom: ScreenUtil.instance.setWidth(163.0)),
                child: SizedBox(
                    width: ScreenUtil.instance.setWidth(269),
                    height: ScreenUtil.instance.setWidth(66),
                    child: Text(MyText().emailSub,
                        style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'LoewNextArabic',
                            fontStyle: FontStyle.normal,
                            fontSize: 16),
                        textAlign: TextAlign.center)),
              ),
              Container(
                width: ScreenUtil.instance.setWidth(316.0),
                height: ScreenUtil.instance.setHeight(92.0),
                margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(49.0), right: ScreenUtil.instance.setWidth(49.0), bottom: ScreenUtil.instance.setWidth(22.0)),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    enableSuggestions: false,
                    controller: emailController,
                    decoration: InputDecoration(
                      // floatingLabelBehavior: FloatingLabelBehavior.never,
                      hasFloatingPlaceholder: false,
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 35.0),
                      labelText: MyText().labelEmail,
                      labelStyle: TextStyle(color: MyColor().white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.5)),
                        borderSide: BorderSide(color: MyColor().white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.5)),
                        borderSide: BorderSide(color: MyColor().white),
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
                    style: TextStyle(color: MyColor().white),
                    validator: (email) =>
                        MyValidation().validateEmailLogin(email, _btnCounter),
                  ),
                ),
              ),
              Container(
                  width: ScreenUtil.instance.setWidth(316.0),
                  height: ScreenUtil.instance.setHeight(67.0),
                  margin: EdgeInsets.only(
                    left: ScreenUtil.instance.setWidth(49.0),
                    right: ScreenUtil.instance.setWidth(49.0),
                  ),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(33.5),
                    ),
                    onPressed: () async {
                      try {
                        final result =
                            await InternetAddress.lookup('google.com');
                        if (result.isNotEmpty &&
                            result[0].rawAddress.isNotEmpty) {
                          onPressed(context);
                        }
                      } on SocketException catch (_) {
                        MySnackbar().showSnackbar(MyText().checkConnection,
                            context, MyText().snackUndo);
                      }
                    },
                    child:
                        Text(MyText().btnEmail, style: TextStyle(fontSize: 18)),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  onPressed(BuildContext context) {
    email = emailController.text;
    final _formState = _formKey.currentState;
    if (_formState.validate()) {
      if (_btnCounter == 0) {
        String emailCode = randomAlphaNumeric(10);
        ResetPassword().sendEmail(emailController.text, emailCode);
        Navigator.of(context).pushNamed(PasswordReset,
            arguments: UpdatePasswordArguments(
                email: emailController.text, emailCode: emailCode));
        _btnCounter = 1;
        Timer(Duration(seconds: 2), () {
          _btnCounter = 0;
        });
      }
    }
  }
}

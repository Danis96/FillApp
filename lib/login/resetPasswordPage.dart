/// Reset Password page class
///
/// This class contains methods and layout for resetPassword page.
///
/// Imports:
///   MyColor constant class with all colors
///   Cloud_firestore for connection to the firebase
///   ScreenUtil class for respnsive desing
///   Routes
///   Database connections
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/components/myValidation.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

int _btnCounter = 0;
String oldPassword, newPassword, repeatPassword;

class ResetPasswordPage extends StatefulWidget {
  final UpdatePasswordArguments arguments;
  ResetPasswordPage({this.arguments});

  @override
  _ResetPasswordPageState createState() =>
      _ResetPasswordPageState(arguments: arguments);
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final UpdatePasswordArguments arguments;
  _ResetPasswordPageState({this.arguments});

  DocumentSnapshot snap;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController oldPasswordController =
      new TextEditingController();

  final TextEditingController newPasswordController =
      new TextEditingController();

  final TextEditingController repeatPasswordController =
      new TextEditingController();

  @override
  void initState() {
    FirebaseCheck().getUser(arguments.email);
    super.initState();
  }

  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(""),
        backgroundColor: MyColor().black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: MyColor().white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: MyColor().black,
      body: Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(35.0)),
                      child: Text(
                        AppLocalizations.of(context).translate('resetYourPassword'),
                        style: TextStyle(
                            color: MyColor().white,
                            fontWeight: FontWeight.w500,
                            fontFamily: arabic,
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil.instance.setSp(23.0)),
                      ),
                    ),
                  ),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: ScreenUtil.instance.setWidth(316.0),
                          height: ScreenUtil.instance.setHeight(92.0),
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil.instance.setWidth(19.0),
                              top: ScreenUtil.instance.setWidth(105.0),
                              left: ScreenUtil.instance.setWidth(40.0),
                              right: ScreenUtil.instance.setWidth(40.0)),
                          child: TextFormField(
                            enableSuggestions: false,
                            style: TextStyle(color: Colors.white),
                            controller: oldPasswordController,
                            decoration: InputDecoration(
                              hasFloatingPlaceholder: false,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 25.0, horizontal: 35.0),
                              labelText: AppLocalizations.of(context).translate('enterCodeFromEmail'),
                              labelStyle: TextStyle(color: MyColor().white, fontSize: ScreenUtil.instance.setWidth(17.0)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33.5)),
                                borderSide: BorderSide(color: MyColor().white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33.5)),
                                borderSide: BorderSide(color: MyColor().white),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33.5)),
                                borderSide: BorderSide(
                                  color: MyColor().error,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33.5)),
                                borderSide: BorderSide(
                                  color: MyColor().error,
                                ),
                              ),
                            ),
                            obscureText: false,
                            validator: (code) => MyValidation()
                                .resetPassword(code, arguments.emailCode, context),
                          ),
                        ),
                        Container(
                          width: ScreenUtil.instance.setWidth(316.0),
                          height: ScreenUtil.instance.setHeight(92.0),
                          margin: EdgeInsets.only(
                            left: ScreenUtil.instance.setWidth(40.0),
                            right: ScreenUtil.instance.setWidth(40.0),
                          ),
                          child: TextFormField(
                            enableSuggestions: false,
                            style: TextStyle(color: MyColor().white),
                            controller: newPasswordController,
                            decoration: InputDecoration(
                              hasFloatingPlaceholder: false,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 25.0, horizontal: 35.0),
                              labelText: AppLocalizations.of(context).translate('enterNewPssword'),
                              labelStyle: TextStyle(color: MyColor().white, fontSize: ScreenUtil.instance.setWidth(17.0)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33.5)),
                                borderSide: BorderSide(color: MyColor().white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33.5)),
                                borderSide: BorderSide(color: MyColor().white),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33.5)),
                                borderSide: BorderSide(
                                  color: MyColor().error,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33.5)),
                                borderSide: BorderSide(
                                  color: MyColor().error,
                                ),
                              ),
                            ),
                            obscureText: true,
                            validator: (password) =>
                                MyValidation().validatePassword(password, context),
                          ),
                        ),
                        Container(
                          width: ScreenUtil.instance.setWidth(316.0),
                          height: ScreenUtil.instance.setHeight(92.0),
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil.instance.setWidth(28.0),
                              top: ScreenUtil.instance.setWidth(19.0),
                              left: ScreenUtil.instance.setWidth(40.0),
                              right: ScreenUtil.instance.setWidth(40.0)),
                          child: TextFormField(
                            enableSuggestions: false,
                            style: TextStyle(color: Colors.white),
                            controller: repeatPasswordController,
                            decoration: InputDecoration(
                              hasFloatingPlaceholder: false,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 25.0, horizontal: 35.0),
                              labelText: AppLocalizations.of(context).translate('reenterPassword'),
                              labelStyle: TextStyle(color: MyColor().white, fontSize: ScreenUtil.instance.setWidth(17.0)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33.5)),
                                borderSide: BorderSide(color: MyColor().white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33.5)),
                                borderSide: BorderSide(color: MyColor().white),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33.5)),
                                borderSide: BorderSide(
                                  color: MyColor().error,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(33.5)),
                                borderSide: BorderSide(
                                  color: MyColor().error,
                                ),
                              ),
                            ),
                            obscureText: true,
                            validator: (repeatPassword) => MyValidation()
                                .resetPassword(
                                    repeatPassword, newPasswordController.text, context),
                          ),
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.instance.setWidth(18.0),
                      left: ScreenUtil.instance.setWidth(40.0),
                      right: ScreenUtil.instance.setWidth(40.0),
                      bottom: ScreenUtil.instance.setWidth(127.0)),
                  width: ScreenUtil.instance.setWidth(316.0),
                  height: ScreenUtil.instance.setHeight(67.0),
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
                          MySnackbar().showSnackbar(AppLocalizations.of(context).translate('noIternent'),
                              context, AppLocalizations.of(context).translate('undo'));
                        }
                      },
                      child: Text(AppLocalizations.of(context).translate('resetPassword'), style: TextStyle(fontSize: ScreenUtil.instance.setWidth(16.0)),)),
                ),

                /// izvlaci podatke za tog usera na osnovu emaila koji smo pruzeli sa prethodnog screen-a
                ///
                /// poziva se metoda [getUser] iz FirebaseCheck klase
                FutureBuilder(
                  future: FirebaseCheck().getUser(arguments.email),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            snap = snapshot.data[index];
                            return EmptyContainer();
                          });
                    }
                    return EmptyContainer();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onPressed(BuildContext context) {
    newPassword = newPasswordController.text;
    repeatPassword = repeatPasswordController.text;
    oldPassword = oldPasswordController.text;
    final _formState = _formKey.currentState;
    if (_formState.validate()) {
      if (_btnCounter == 0) {
        FirebaseCrud().updatePassword(snap, context, newPassword);
        _btnCounter = 1;
        Timer(Duration(seconds: 2), () {
          _btnCounter = 0;
        });
      }
    }
  }
}
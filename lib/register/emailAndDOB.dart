/// Register Page class
///
/// This class contains methods and layout for register page.
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
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/components/myTextComponent.dart';
import 'package:fillproject/components/myValidation.dart';
import 'package:fillproject/components/pageRouteBuilderAnimation.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/home/homePage.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/register/passwordPage.dart';
import 'package:fillproject/register/verifyPinPage.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/utils/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String email;
int _btnCounter = 0;

class NameAndDOB extends StatefulWidget {
  final RegisterArguments arguments;

  NameAndDOB({this.arguments});

  @override
  _NameAndDOBState createState() => _NameAndDOBState(arguments: arguments);
}

class _NameAndDOBState extends State<NameAndDOB> {

  String name, date;
  final RegisterArguments arguments;

  _NameAndDOBState({
    this.arguments,
  });





  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);


    SizeConfig().init(context);

    return Scaffold(
      appBar: new AppBar(
        title: new Text(""),
        elevation: 0,
        backgroundColor: Color.fromRGBO(74, 85, 98, 1.0),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            isFromProfile
                ? Navigator.of(context).pop()
                : Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SignUp()));
          },
        ),
      ),
      backgroundColor: Color.fromRGBO(74, 85, 98, 1.0),
      body: Builder(
        builder: (context) => new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: WillPopScope(
            onWillPop: _onWillPop,
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setWidth(5.0)),
                              child: MyTextComponent(
                                  text: AppLocalizations.of(context)
                                      .translate('registerAndStartMakingMoney')),
                            )),
                        Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setWidth(61.0),
                                  bottom: ScreenUtil.instance.setWidth(20.0)),
                              child: Text(
                                'Enter your name and date of birth',
                                style: TextStyle(
                                    color: MyColor().white,
                                    fontSize: ScreenUtil.instance.setSp(20)),
                                textAlign: TextAlign.center,
                              ),
                            )),
                        Container(
                            margin: EdgeInsets.only(
                                bottom: ScreenUtil.instance.setWidth(20.0),
                                top: ScreenUtil.instance.setWidth(20.0)),
                            child: Container(
                              width: ScreenUtil.instance.setWidth(306.0),
                              height: ScreenUtil.instance.setHeight(92.0),
                              margin: EdgeInsets.only(
                                  top: ScreenUtil.instance.setWidth(20.0)),
                              child: TextFormField(
                                enableSuggestions: false,
                                decoration: InputDecoration(
                                  hasFloatingPlaceholder: false,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical:
                                      ScreenUtil.instance.setWidth(20.0),
                                      horizontal:
                                      ScreenUtil.instance.setWidth(35.0)),
                                  labelText: AppLocalizations.of(context)
                                      .translate('name&surname'),
                                  labelStyle: TextStyle(
                                      color: MyColor().white,
                                      fontSize:
                                      ScreenUtil.instance.setSp(16.0)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(33.5)),
                                    borderSide:
                                    BorderSide(color: MyColor().white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(33.5)),
                                    borderSide:
                                    BorderSide(color: MyColor().white),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(33.5)),
                                    borderSide: BorderSide(
                                      color: MyColor().error,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(33.5)),
                                    borderSide: BorderSide(
                                      color: MyColor().error,
                                    ),
                                  ),
                                ),
                                style: TextStyle(color: MyColor().white),
                                onChanged: (input) {
                                  setState(() {
                                    name = input;
                                  });
                                },
                              ),
                            )),
                        Container(
                          width: ScreenUtil.instance.setWidth(316.0),
                          height: ScreenUtil.instance.setHeight(92.0),
                          margin: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(49.0),
                              right: ScreenUtil.instance.setWidth(49.0),
                              bottom: ScreenUtil.instance.setWidth(19.0)),
                          child: TextFormField(
                            enableSuggestions: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hasFloatingPlaceholder: false,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: ScreenUtil.instance.setWidth(20.0),
                                  horizontal:
                                  ScreenUtil.instance.setWidth(35.0)),
                              labelText: AppLocalizations.of(context)
                                  .translate('dateOfBirth'),
                              labelStyle: TextStyle(
                                  color: MyColor().white,
                                  fontSize: ScreenUtil.instance.setSp(16.0)),
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
                            onChanged: (input) {
                              setState(() {
                                date = input;
                              });
                            },
                            style: TextStyle(color: MyColor().white),
                          ),
                        ),

                        Container(
                            width: ScreenUtil.instance.setWidth(316.0),
                            height: ScreenUtil.instance.setHeight(67.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(33.5),
                              ),
                              onPressed: () async {
                                try {
                                  final result = await InternetAddress.lookup(
                                      'google.com');
                                  if (result.isNotEmpty &&
                                      result[0].rawAddress.isNotEmpty) {
                                    Navigator.of(context).push(
                                      CardAnimationTween(
                                        widget: PasswordPage(
                                            arguments: RegisterArguments(
                                                email: widget.arguments.email,
                                                verId: widget.arguments.verId,
                                                nameAndUsername: name,
                                                dateBirth: date,
                                                username: widget.arguments.username,
                                                usernameSecond: widget.arguments.usernameSecond,
                                                phone: widget.arguments.phone)),
                                      ),
                                    );
                                  }
                                } on SocketException catch (_) {
                                  MySnackbar().showSnackbar(
                                      AppLocalizations.of(context)
                                          .translate('noIternent'),
                                      context,
                                      AppLocalizations.of(context)
                                          .translate('undo'));
                                }
                              },
                              child: Text(
                                  AppLocalizations.of(context)
                                      .translate('sendPin'),
                                  style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(18))),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    isFromProfile
        ? Navigator.of(context).pop()
        : Navigator.of(context).push(CardAnimationTween(
      widget: VerifyPinPage(),
    ));
    return EmptyContainer() ?? true;
  }
}

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
import 'package:fillproject/register/verifyPinPage.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String email;
int _btnCounter = 0;

class RegisterPage extends StatefulWidget {
  final DidntRecievePinArguments arguments;

  RegisterPage({this.arguments});

  @override
  _RegisterPageState createState() => _RegisterPageState(arguments: arguments);
}

class _RegisterPageState extends State<RegisterPage> {
  String phoneNo, smsCode, verificationId, username, name;
  bool emailPostoji = false;

  final DidntRecievePinArguments arguments;

  _RegisterPageState({
    this.arguments,
  });

  populateReg() async {
    usernameController.text = widget.arguments.username;
    phoneController.text = widget.arguments.phone;
  }

  @override
  void initState() {
    super.initState();
    populateReg();
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoggedIn = false, brPostoji = false, usernamePostoji = false;

  TextEditingController phoneController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    Future<void> verifyPhone() async {
      final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
        this.verificationId = verId;
      };

      final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
        this.verificationId = verId;
        Navigator.of(context).push(CardAnimationTween(
            widget: VerifyPinPage(
          arguments: RegisterArguments(
              verId: verificationId,
              username: usernameController.text,
              usernameSecond: widget.arguments.username,
              phone: phoneController.text,
              email: usernameController.text),
        )));
      };

      final PhoneVerificationCompleted verificationSuccess =
          (AuthCredential user) {};

      final PhoneVerificationFailed verificationFailed =
          (AuthException exception) {
        print('${exception.message}');
      };

      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: this.phoneNo,
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationSuccess,
          verificationFailed: verificationFailed,
          codeSent: smsCodeSent,
          codeAutoRetrievalTimeout: autoRetrieve);
    }

    onFieldSubmitted1(BuildContext context) {
      phoneNo = '+' +  phoneController.text;
      //phoneNo = "+966" + phoneController.text;
      final _formState = _formKey.currentState;
      if (_formState.validate()) {
        verifyPhone();
      }
      print(phoneNo);
    }

    return Scaffold(
      appBar: new AppBar(
        title: new Text(""),
        backgroundColor: MyColor().black,
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
      backgroundColor: MyColor().black,
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
                              top: ScreenUtil.instance.setWidth(28.0)),
                          child: MyTextComponent(
                              text: AppLocalizations.of(context)
                                  .translate('registerAndStartMakingMoney')),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.only(
                              top: ScreenUtil.instance.setWidth(61.0),
                              bottom: ScreenUtil.instance.setWidth(59.0)),
                          child: Text(
                            '3 \n SAR',
                            style: TextStyle(
                                color: MyColor().white,
                                fontWeight: FontWeight.w600,
                                fontSize: ScreenUtil.instance.setSp(34)),
                            textAlign: TextAlign.center,
                          ),
                        )),
                        Container(
                            margin: EdgeInsets.only(
                                bottom: ScreenUtil.instance.setWidth(20.0),
                                top: ScreenUtil.instance.setWidth(20.0)),
                            child: Container(
                              width: ScreenUtil.instance.setWidth(316.0),
                              height: ScreenUtil.instance.setHeight(92.0),
                              margin: EdgeInsets.only(
                                  top: ScreenUtil.instance.setWidth(20.0)),
                              child: TextFormField(
                                enableSuggestions: false,
                                controller: usernameController,
                                decoration: InputDecoration(
                                  hasFloatingPlaceholder: false,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical:
                                          ScreenUtil.instance.setWidth(25.0),
                                      horizontal:
                                          ScreenUtil.instance.setWidth(35.0)),
                                  labelText: AppLocalizations.of(context)
                                      .translate('email'),
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
                                validator: (email) => MyValidation()
                                    .validateEmail(email, _btnCounter,
                                        usernamePostoji, context),
                                onChanged: (input) {
                                  setState(() {
                                    email = input;
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
                            controller: phoneController,
                            decoration: InputDecoration(
                              hasFloatingPlaceholder: false,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: ScreenUtil.instance.setWidth(25.0),
                                  horizontal:
                                      ScreenUtil.instance.setWidth(35.0)),
                              prefix: Text('',
                                //"+966",
                                style: TextStyle(color: MyColor().white),
                              ),
                              labelText: AppLocalizations.of(context)
                                  .translate('966phoneNumber'),
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
                                phoneNo = input;
                                //phoneNo = '966' + input;
                              });
                            },
                            validator: (phone) => MyValidation()
                                .validatePhone(phone, brPostoji, context),
                            onFieldSubmitted: (value) async {
                              try {
                                final result =
                                    await InternetAddress.lookup('google.com');
                                if (result.isNotEmpty &&
                                    result[0].rawAddress.isNotEmpty) {
                                  onFieldSubmitted1(context);
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
                                    onFieldSubmitted1(context);
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

                        /// PROVJERA DA LI POSTOJI USERNAME ILI NUMBER
                        Column(
                          children: <Widget>[
                            FutureBuilder(
                              future: FirebaseCheck()
                                  .doesNumberAlreadyExist(phoneController.text),
                              builder: (context, AsyncSnapshot<bool> result) {
                                if (!result.hasData) {
                                  return EmptyContainer();
                                }
                                if (result.data) {
                                  brPostoji = true;
                                  return EmptyContainer();
                                } else {
                                  brPostoji = false;
                                  return EmptyContainer();
                                }
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            FutureBuilder(
                              future: FirebaseCheck().doesNameAlreadyExist(
                                  usernameController.text),
                              builder: (context, AsyncSnapshot<bool> result) {
                                if (!result.hasData) {
                                  return EmptyContainer();
                                }
                                if (result.data) {
                                  usernamePostoji = true;
                                  return EmptyContainer();
                                } else {
                                  usernamePostoji = false;
                                  return EmptyContainer();
                                }
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            FutureBuilder(
                              future:
                                  FirebaseCheck().doesEmailAlreadyExist(usernameController.text),
                              builder: (context, AsyncSnapshot<bool> result) {
                                if (!result.hasData) {
                                  return EmptyContainer();
                                }
                                if (result.data) {
                                  emailPostoji = true;
                                  return EmptyContainer();
                                } else {
                                  emailPostoji = false;
                                  return EmptyContainer();
                                }
                              },
                            ),
                          ],
                        )
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
            widget: SignUp(),
          ));
    return EmptyContainer() ?? true;
  }
}

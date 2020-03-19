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
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/components/myTextComponent.dart';
import 'package:fillproject/components/myValidation.dart';
import 'package:fillproject/components/pageRouteBuilderAnimation.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:fillproject/home/homePage.dart';
import 'package:fillproject/register/verifyPinPage.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../routes/routeArguments.dart';

class RegisterPage extends StatefulWidget {
  final DidntRecievePinArguments arguments;

  RegisterPage({this.arguments});

  @override
  _RegisterPageState createState() => _RegisterPageState(arguments: arguments);
}

class _RegisterPageState extends State<RegisterPage> {
  String phoneNo, smsCode, verificationId, username, name;

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  phone: phoneController.text)),
        ));
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
      phoneNo = "+" + phoneController.text;
      final _formState = _formKey.currentState;
      if (_formState.validate()) {
        verifyPhone();
      }
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
            Navigator.of(context)
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
                          child:
                              MyTextComponent(text: MyText().registerHeadline),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.only(
                              top: ScreenUtil.instance.setWidth(61.0),
                              bottom: ScreenUtil.instance.setWidth(59.0)),
                          child: Text(
                            MyText().registerSubtitle,
                            style: TextStyle(
                                color: MyColor().white,
                                fontSize: ScreenUtil.instance.setSp(40)),
                            textAlign: TextAlign.center,
                          ),
                        )),
                        Container(
                          width: ScreenUtil.instance.setWidth(320.0),
                          height: ScreenUtil.instance.setHeight(92.0),
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil.instance.setWidth(19.0),
                              left: ScreenUtil.instance.setWidth(49.0),
                              right: ScreenUtil.instance.setWidth(49.0)),
                          child: TextFormField(
                            enableSuggestions: false,
                            textCapitalization: TextCapitalization.sentences,
                            controller: usernameController,
                            decoration: InputDecoration(
                              //  floatingLabelBehavior: FloatingLabelBehavior.never,
                              hasFloatingPlaceholder: false,
                              errorStyle: TextStyle(
                                  inherit: true,
                                  textBaseline: TextBaseline.ideographic),
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: ScreenUtil.instance.setWidth(25.0),
                                  horizontal:
                                      ScreenUtil.instance.setWidth(35.0)),
                              labelText: MyText().labelUsername,
                              labelStyle: TextStyle(
                                  color: MyColor().white,
                                  fontSize: ScreenUtil.instance.setSp(18)),
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
                            style: TextStyle(color: MyColor().white),
                            validator: (username) => MyValidation()
                                .validateUsername(username, usernamePostoji),
                            onChanged: (input) {
                              setState(() {
                                username = input;
                              });
                            },
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
                                    MyText().checkConnection,
                                    context,
                                    MyText().snackUndo);
                              }
                            },
                          ),
                        ),
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
                              prefix: Text(
                                "+966",
                                style: TextStyle(color: MyColor().white),
                              ),
                              labelText: MyText().labelPhone,
                              labelStyle: TextStyle(color: MyColor().white),
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
                              });
                            },
                            validator: (phone) =>
                                MyValidation().validatePhone(phone, brPostoji),
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
                                    MyText().checkConnection,
                                    context,
                                    MyText().snackUndo);
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
                                      MyText().checkConnection,
                                      context,
                                      MyText().snackUndo);
                                }
                              },
                              child: Text("Send PIN",
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
     Navigator.of(context).push(CardAnimationTween(
       widget: SignUp(),
     ));
    return EmptyContainer() ?? true;
  }
}

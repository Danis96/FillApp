/// Email class
///
/// This class contains methods and layout for email page.
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
import 'package:fillproject/components/constants/MyText.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/components/myTextComponent.dart';
import 'package:fillproject/components/myValidation.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:fillproject/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String email;
int _btnCounter = 0;

class EmailPage extends StatefulWidget {
  final RegisterArguments arguments;

  EmailPage({this.arguments});

  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  bool emailPostoji = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Constant().responsive(context);
    return Scaffold(
      appBar: new AppBar(
        title: new Text(""),
        backgroundColor: MyColor().black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed(VerifyPin,
                arguments: RegisterArguments(
                    verId: widget.arguments.verId,
                    username: widget.arguments.username,
                    usernameSecond: widget.arguments.usernameSecond,
                    phone: widget.arguments.phone));
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
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(28.0),
                        bottom: ScreenUtil.instance.setWidth(35.0)),
                    child: MyTextComponent(text: MyText().emailHeadline),
                  ),
                  Text(MyText().fiveSar,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(40.0),
                        color: MyColor().white,
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
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            enableSuggestions: false,
                            controller: emailController,
                            decoration: InputDecoration(
                              // floatingLabelBehavior: FloatingLabelBehavior.never,
                              hasFloatingPlaceholder: false,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: ScreenUtil.instance.setWidth(25.0),
                                  horizontal:
                                      ScreenUtil.instance.setWidth(35.0)),
                              labelText: MyText().labelEmail,
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
                            style: TextStyle(color: MyColor().white),
                            validator: (email) => MyValidation().validateEmail(
                                email, _btnCounter, emailPostoji),
                            onChanged: (input) {
                              setState(() {
                                email = input;
                              });
                            },
                          ),
                        ),
                      )),
                  Container(
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
                            MySnackbar().showSnackbar(MyText().checkConnection,
                                context, MyText().snackUndo);
                          }
                        },
                        child: Text(MyText().btnEmail,
                            style: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(18))),
                      )),
                  Column(
                    children: <Widget>[
                      FutureBuilder(
                        future: FirebaseCheck().doesEmailAlreadyExist(email),
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
                  ),
                ],
              ),
            ),
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
        Navigator.of(context).pushNamed(Password,
            arguments: RegisterArguments(
              email: email,
              verId: widget.arguments.verId,
              username: widget.arguments.username,
              usernameSecond: widget.arguments.usernameSecond,
              phone: widget.arguments.phone,
            ));
        _btnCounter = 1;
        Timer(Duration(seconds: 2), () {
          _btnCounter = 0;
        });
      }
    }
  }
}

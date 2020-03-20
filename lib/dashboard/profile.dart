import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/components/profileComponents/languageChoose.dart';
import 'package:fillproject/dashboard/navigationBarController.dart';
import 'package:fillproject/dashboard/survey.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
  final String btnText;
  final bool isReadOnly, showData;
  final Function refreshNavbar;
  final DocumentSnapshot snap2;
  Profile({
    Key key,
    this.arguments,
    this.btnText,
    this.isReadOnly,
    this.showData,
    this.refreshNavbar,
    this.snap2,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

RegExp regexEmail = new RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
RegExp regexSpace = new RegExp(r'\s');

var maskTextInputFormatterCard =
    MaskTextInputFormatter(mask: '####-####-####-####');
var maskTextInputFormatterDate = MaskTextInputFormatter(mask: '##/##');
var maskTextInputFormatterCC = MaskTextInputFormatter(mask: '###');
var maskTextInputFormatterDOB = MaskTextInputFormatter(mask: '##.##.####.');

String name, dateOfBirth, email, creditCard, date, cc;
Key key = UniqueKey();
bool isSar = false,
    onlyOnce = false,
    isEmptyName = false,
    isEmptyBirth = false,
    isEmptyMail = false,
    isEmptyCard = false,
    isEmptyDate = false,
    isEmptyCC = false;
DocumentSnapshot snap;

class _ProfileState extends State<Profile> {
  int usersSarovi, profileAnonym;
  bool isButtonComplete = false;
  DateTime dateOfBirth2 = DateTime.now();
  String usersName, usersEmail, usersDOB, usersCard, usersCardDate, usersCC;

  /// field focus variables
  FocusNode _nameFocus = FocusNode(),
      _dobFocus = FocusNode(),
      _emailFocus = FocusNode(),
      _cardFocus = FocusNode(),
      _dateFocus = FocusNode(),
      _ccFocus = FocusNode();

  @override
  void initState() {
    /// checking if any change happend,
    /// if it is set btn text to complete profile if not, leave it
    isButtonComplete ? btnText = 'Complete profile' : btnText = btnText;
    super.initState();
    checkForInternet();
    FirebaseCheck().getUserUsername(widget.arguments.username);
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
    Widget bigCircle = Container(
      width: ScreenUtil.instance.setWidth(198.0),
      height: ScreenUtil.instance.setHeight(198.0),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(40.0)),
              child: Text(
                usersSarovi.toString(),
                style: TextStyle(
                  color: btnText == 'Complete profile'
                      ? MyColor().black
                      : btnText == 'Transfer'
                          ? MyColor().black
                          : MyColor().white,
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

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: ListView(shrinkWrap: true, children: <Widget>[
          Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FutureBuilder(
                future:
                    FirebaseCheck().getUserUsername(widget.arguments.username),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          snap = snapshot.data[index];
                          usersSarovi = snapshot.data[index].data['sar'];
                          profileAnonym =
                              snapshot.data[index].data['is_anonymous'];

                          return EmptyContainer();
                        });
                  }

                  return EmptyContainer();
                },
              ),
              Container(
                margin:
                    EdgeInsets.only(top: ScreenUtil.instance.setWidth(70.0)),
                child: Text(
                  'Profile',
                  style: TextStyle(fontSize: 23.0),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0)),
                child: bigCircle,
              ),
              Container(
                margin:
                    EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0)),
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
                  focusNode: _nameFocus,
                  readOnly: isReadOnly,
                  maxLength: 200,
                  enableSuggestions: false,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Colors.black),
                  initialValue: widget.snap2.data['name_and_surname'],
                  decoration: InputDecoration(
                    labelText: 'Name and Surname',
                    counterText: '',
                    hasFloatingPlaceholder: false,
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 35.0),
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
                          color:
                              isEmptyName ? MyColor().error : MyColor().black),
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
                  onTap: () {
                    isReadOnly
                        ? MySnackbar().showSnackbar(
                            'You must register first', context, 'Ok')
                        : print('ssss');
                  },
                  onChanged: (input) {
                    setState(() {
                      name = input;
                      isButtonComplete = true;
                    });
                    print(isButtonComplete);
                  },
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
                  readOnly: true,
                  onTap: () => isReadOnly
                      ? MySnackbar().showSnackbar(
                          'You must register first', context, 'Ok')
                      : {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return GestureDetector(
                                    onTap: () {
                                      usersDOB = dateOfBirth;
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      height:
                                          ScreenUtil.instance.setHeight(265.0),
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        initialDateTime: dateOfBirth2,
                                        onDateTimeChanged: (date) {
                                          dateOfBirth2 = date;
                                          dateOfBirth = DateFormat.yMd()
                                              .format(dateOfBirth2);
                                        },
                                      ),
                                    ));
                              }),
                        },
                  focusNode: _dobFocus,
                  maxLength: 200,
                  enableSuggestions: false,
                  style: TextStyle(color: Colors.black),
                  initialValue: widget.snap2.data['date_of_birth'],
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
                  onChanged: (input) {
                    setState(() {
                      dateOfBirth = input;
                      isButtonComplete = true;
                    });
                  },
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
                  focusNode: _emailFocus,
                  readOnly: isReadOnly,
                  maxLength: 200,
                  enableSuggestions: false,
                  style: TextStyle(color: Colors.black),
                  initialValue: widget.snap2.data['email_profile'],
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
                          color:
                              isEmptyMail ? MyColor().error : MyColor().black),
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
                  onChanged: (input) {
                    setState(() {
                      email = input;
                      isButtonComplete = true;
                    });
                  },
                  onTap: () {
                    isReadOnly
                        ? MySnackbar().showSnackbar(
                            'You must register first', context, 'Ok')
                        : print('ssss');
                  },
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
                  focusNode: _cardFocus,
                  readOnly: isReadOnly,
                  inputFormatters: [maskTextInputFormatterCard],
                  keyboardType: TextInputType.number,
                  maxLength: 200,
                  enableSuggestions: false,
                  style: TextStyle(color: Colors.black),
                  initialValue: widget.snap2.data['card_number'],
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
                          color:
                              isEmptyCard ? MyColor().error : MyColor().black),
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
                  onChanged: (input) {
                    setState(() {
                      creditCard = input;
                      isButtonComplete = true;
                    });
                  },
                  onTap: () {
                    isReadOnly
                        ? MySnackbar().showSnackbar(
                            'You must register first', context, 'Ok')
                        : print('ssss');
                  },
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
                      focusNode: _dateFocus,
                      readOnly: isReadOnly,
                      inputFormatters: [maskTextInputFormatterDate],
                      keyboardType: TextInputType.number,
                      maxLength: 200,
                      enableSuggestions: false,
                      initialValue: widget.snap2.data['expire_date'],
                      style: TextStyle(color: Colors.black),
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
                      onChanged: (input) {
                        setState(() {
                          date = input;
                          isButtonComplete = true;
                        });
                      },
                      onTap: () {
                        isReadOnly
                            ? MySnackbar().showSnackbar(
                                'You must register first', context, 'Ok')
                            : print('ssss');
                      },
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
                      focusNode: _ccFocus,
                      readOnly: isReadOnly,
                      keyboardType: TextInputType.number,
                      inputFormatters: [maskTextInputFormatterCC],
                      maxLength: 200,
                      enableSuggestions: false,
                      style: TextStyle(color: Colors.black),
                      initialValue: widget.snap2.data['cc'],
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
                            color:
                                isEmptyCC ? MyColor().error : MyColor().black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
                          borderSide: BorderSide(
                              color: isEmptyCC
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
                      onChanged: (input) {
                        setState(() {
                          cc = input;
                          isButtonComplete = true;
                        });
                      },
                      onTap: () {
                        isReadOnly
                            ? MySnackbar().showSnackbar(
                                'You must register first', context, 'Ok')
                            : print('ssss');
                      },
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
      ),
    );
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
            elevation: 1,
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

  /// Metoda koja se poziva na klik button-a kada na njemu piše 'Complete profile'
  completeProfile() {
    FirebaseCrud().updateUserOnCompletePRofile(
      snap,
      isButtonComplete ? name : usersName,
      isButtonComplete ? dateOfBirth : usersDOB,
      isButtonComplete ? email : usersEmail,
      isButtonComplete ? creditCard : usersCard,
      isButtonComplete ? date : usersCardDate,
      isButtonComplete ? cc : usersCC,
    );
    setState(() {
      btnText = isButtonComplete ? 'Transfer' : 'Complete profile';
    });
    widget.refreshNavbar();
  }

  transferSar() {
    FirebaseCrud().updateUserOnCompletePRofile(
      snap,
      isButtonComplete ? name : usersName,
      isButtonComplete ? dateOfBirth : usersDOB,
      isButtonComplete ? email : usersEmail,
      isButtonComplete ? creditCard : usersCard,
      isButtonComplete ? date : usersCardDate,
      isButtonComplete ? cc : usersCC,
    );
    FirebaseCrud().updateSarOnTransfer(snap, 0, usersSarovi);
    setState(() {
      btnText = 'Transfer after 100 SAR';
    });
    Timer(Duration(seconds: 1), () {
      setState(() {});
    });
  }

  onPressed() {
    if (btnText == 'Register') {
      FirebaseCrud().userRegister(context, widget.arguments.username);
    } else if (btnText == 'Complete profile') {
      if (name == '' || regexSpace.hasMatch(name) == false) {
        setState(() {
          isEmptyName = true;
        });
        Timer(Duration(seconds: 2), () {
          setState(() {
            isEmptyName = false;
          });
        });
      } else if (email == '' || regexEmail.hasMatch(email) == false) {
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
      } else if (creditCard == '' || creditCard.length < 19) {
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
        completeProfile();
      }
    } else if (btnText == 'Transfer') {
      transferSar();
    }
  }

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
}

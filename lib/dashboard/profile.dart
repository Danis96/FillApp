import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/bigCircle.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/components/transferSnackbar.dart';
import 'package:fillproject/components/profileButton.dart';
import 'package:fillproject/components/profileComponents/languageChoose.dart';
import 'package:fillproject/components/transferWithIcon.dart';
import 'package:fillproject/dashboard/navigationBarController.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
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
  final Function refreshNavbar, settingStates;
  final DocumentSnapshot snap2;
  Profile({
    Key key,
    this.settingStates,
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
    isEmptyCC = false,
    emailPostoji = false,
    isClicked = false;
DocumentSnapshot snap;

class _ProfileState extends State<Profile> {
  int usersSarovi, profileAnonym, _btnCounter = 0;
  bool isButtonComplete = false,
      isButtonCompleteName = false,
      isButtonCompleteDOB = false,
      isButtonCompleteEmail = false,
      isButtonCompleteCard = false,
      isButtonCompleteDate = false,
      isButtonCompleteCC = false,
      isDateChanged = false;
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
    isButtonComplete ? btnText = AppLocalizations.of(context).translate('complete') : btnText = btnText;
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

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                          profileAnonym =
                              snapshot.data[index].data['is_anonymous'];
                          usersSarovi = snap.data['sar'];
                          usersName = snap.data['name_and_surname'];
                          usersDOB = snap.data['date_of_birth'];
                          usersEmail = snap.data['email_profile'];
                          usersCard = snap.data['card_number'];
                          usersCardDate = snap.data['expire_date'];
                          usersCC = snap.data['cc'];
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
                  AppLocalizations.of(context).translate('profile'),
                  style: TextStyle(fontSize: 23.0),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0)),
                child: BigCircle(usersSarovi: usersSarovi,),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0)),
                child: TransferWithIcon(),
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
                    labelText: AppLocalizations.of(context).translate('name&surname'),
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
                  onTap: () => onTapFieldAnonymous(),
                  onChanged: (input) {
                    setState(() {
                      name = input;
                      isButtonComplete = true;
                      isButtonCompleteName = true;
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
                child: GestureDetector(
                  onTap: () => onTapFieldAnonymousEmail(),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(33.5),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setWidth(20.0),
                          left: ScreenUtil.instance.setWidth(30.0)),
                      child: isClicked
                          ? Text(
                              isDateChanged
                                  ? dateOfBirth
                                  : widget.snap2.data['date_of_birth'],
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(15.0)),
                            )
                          : Text(
                             AppLocalizations.of(context).translate("dateOfBirth"),
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(15.0)),
                            ),
                    ),
                  ),
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
                    labelText: AppLocalizations.of(context).translate('enterEmail'),
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
                      isButtonCompleteEmail = true;
                      isButtonComplete = true;
                    });
                  },
                  onTap: () => onTapFieldAnonymous(),
                  obscureText: false,
                ),
              ),
              Container(
                child: LanguageChoose(refresh: widget.settingStates),
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
                    labelText: AppLocalizations.of(context).translate('enterCardNumber'),
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
                      isButtonCompleteCard = true;
                      isButtonComplete = true;
                    });
                  },
                  onTap: () => onTapFieldAnonymous(),
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
                        labelText: AppLocalizations.of(context).translate('date'),
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
                          isButtonCompleteDate = true;
                          isButtonComplete = true;
                        });
                      },
                      onTap: () => onTapFieldAnonymous(),
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
                        labelText: AppLocalizations.of(context).translate('cc'),
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
                          isButtonCompleteCC = true;
                          isButtonComplete = true;
                        });
                      },
                      onTap: () => onTapFieldAnonymous(),
                      obscureText: false,
                    ),
                  ),
                ],
              ),
              Container(
                child: ProfileButton(onPressed: onPressed),
              ),
            ],
          )),
        ]),
      ),
    );
  }

  onTapFieldAnonymous() {
    if (_btnCounter == 0) {
      isReadOnly
          ? MySnackbar()
              .showSnackbar(AppLocalizations.of(context).translate('youMustRegisterFirst'), context,  AppLocalizations.of(context).translate('ok'))
          : print('ssss');
      _btnCounter = 1;
      Timer(Duration(seconds: 2), () {
        _btnCounter = 0;
      });
    }
  }

  onTapFieldAnonymousEmail() {
    if (_btnCounter == 0) {
      isReadOnly
          ? MySnackbar()
              .showSnackbar(AppLocalizations.of(context).translate('youMustRegisterFirst'), context, AppLocalizations.of(context).translate('ok'))
          : showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        isButtonComplete = true;
                        isButtonCompleteDOB = true;
                        isClicked = true;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: ScreenUtil.instance.setHeight(265.0),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: dateOfBirth2,
                        onDateTimeChanged: (date) {
                          setState(() {
                            dateOfBirth2 = date;
                            dateOfBirth = DateFormat.yMd().format(dateOfBirth2);
                            isDateChanged = true;
                            isButtonComplete = true;
                            isButtonCompleteDOB = true;
                            isClicked = true;
                          });
                        },
                      ),
                    ));
              });
      _btnCounter = 1;
      Timer(Duration(seconds: 2), () {
        _btnCounter = 0;
      });
    }
  }

  successfullTransfer() {
    return MySnackbarTransfer()
        .showSnackbar('Transfer succesfull', context, 'Congratulations');
  }

  /// Metoda koja se poziva na klik button-a kada na njemu piše 'Complete profile'
  completeProfile() {
    FirebaseCrud().updateUserOnCompletePRofile(
      snap,
      isButtonCompleteName ? name : usersName,
      isButtonCompleteDOB ? dateOfBirth : usersDOB,
      isButtonCompleteEmail ? email : usersEmail,
      isButtonCompleteCard ? creditCard : usersCard,
      isButtonCompleteDate ? date : usersCardDate,
      isButtonCompleteCC ? cc : usersCC,
    );
    setState(() {
      btnText = isButtonComplete ? AppLocalizations.of(context).translate('transfer') : AppLocalizations.of(context).translate('complete');
    });
    widget.refreshNavbar();
  }

  transferSar() {
    /// metoda za kreiranje kolekcije transferi
    FirebaseCrud().createTransfer(
        DateTime.now().toString(),
        isButtonCompleteName ? name : usersName,
        isButtonCompleteDOB ? dateOfBirth : usersDOB,
        isButtonCompleteEmail ? email : usersEmail,
        isButtonCompleteCard ? creditCard : usersCard,
        isButtonCompleteDate ? date : usersCardDate,
        isButtonCompleteCC ? cc : usersCC,
        usersSarovi);
    FirebaseCrud().updateUserOnCompletePRofile(
      snap,
      isButtonCompleteName ? name : usersName,
      isButtonCompleteDOB ? dateOfBirth : usersDOB,
      isButtonCompleteEmail ? email : usersEmail,
      isButtonCompleteCard ? creditCard : usersCard,
      isButtonCompleteDate ? date : usersCardDate,
      isButtonCompleteCC ? cc : usersCC,
    );
    FirebaseCrud().updateSarOnTransfer(snap, 0, usersSarovi);
    setState(() {
      btnText = AppLocalizations.of(context).translate('transferAfter100SAR');
    });
    Timer(Duration(seconds: 1), () {
      setState(() {});
    });
  }

  onPressed() {
    if (btnText == AppLocalizations.of(context).translate('register')) {
      FirebaseCrud().userRegister(context, widget.arguments.username);
    } else if (btnText == AppLocalizations.of(context).translate('complete')) {
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
      } else if (date == '' || date.length < 5) {
        setState(() {
          isEmptyDate = true;
        });
        Timer(Duration(seconds: 2), () {
          setState(() {
            isEmptyDate = false;
          });
        });
      } else if (cc == '' || cc.length < 3) {
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
    } else if (btnText == AppLocalizations.of(context).translate('transfer')) {
      if (isButtonCompleteName
          ? name == '' || regexSpace.hasMatch(name) == false
          : usersName == '' || regexSpace.hasMatch(usersName) == false) {
        setState(() {
          isEmptyName = true;
        });
        Timer(Duration(seconds: 2), () {
          setState(() {
            isEmptyName = false;
          });
        });
      } else if (isButtonCompleteCard
          ? creditCard == '' || creditCard.length < 19
          : usersCard == '' || usersCard.length < 19) {
        setState(() {
          isEmptyCard = true;
        });
        Timer(Duration(seconds: 2), () {
          setState(() {
            isEmptyCard = false;
          });
        });
      } else if (isButtonCompleteDate
          ? date == '' || date.length < 5
          : usersCardDate == '' || usersCardDate.length < 5) {
        setState(() {
          isEmptyDate = true;
        });
        Timer(Duration(seconds: 2), () {
          setState(() {
            isEmptyDate = false;
          });
        });
      } else if (isButtonCompleteCC
          ? cc == '' || cc.length < 3
          : usersCC == '' || usersCC.length < 3) {
        setState(() {
          isEmptyCC = true;
        });
        Timer(Duration(seconds: 2), () {
          setState(() {
            isEmptyCC = false;
          });
        });
      } else {
        transferSar();
        successfullTransfer();
      }
    }
  }
}

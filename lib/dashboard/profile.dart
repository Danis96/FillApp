import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/bigCircle.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/components/transferSnackbar.dart';
import 'package:fillproject/components/profileComponents/profileButton.dart';
import 'package:fillproject/components/profileComponents/registerButton.dart';
import 'package:fillproject/components/profileComponents/languageChoose.dart';
import 'package:fillproject/components/transferWithIcon.dart';
import 'package:fillproject/dashboard/navigationBarController.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:credit_card_validate/credit_card_validate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

FocusNode nameFocus;
FocusNode dateFocus;
FocusNode emailFocus;
FocusNode creditFocus;
FocusNode expireFocus;
FocusNode ccFocus;

class Profile extends StatefulWidget {
  final PasswordArguments arguments;
  final String btnText;
  final bool isReadOnly, showData;
  final Function refreshNavbar, settingStates;
  final DocumentSnapshot snap2;
  final int isAnonymous;
  Profile({
    Key key,
    this.settingStates,
    this.arguments,
    this.btnText,
    this.isReadOnly,
    this.showData,
    this.refreshNavbar,
    this.snap2,
    this.isAnonymous,
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

  /// credit card valdiation
  String creditCardNumber = '';
  IconData brandIcon;

  @override
  void initState() {
    /// checking if any change happend,
    /// if it is set btn text to complete profile if not, leave it
    isButtonComplete
        ? btnText = AppLocalizations.of(context).translate('completeProfile')
        : btnText = btnText;
    super.initState();
    FirebaseCheck().getUserUsername(widget.arguments.username);
    checkForInternet();
    nameFocus = new FocusNode();
    emailFocus = new FocusNode();
    dateFocus = new FocusNode();
    creditFocus = new FocusNode();
    expireFocus = new FocusNode();
    ccFocus = new FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
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
    SizeConfig().init(context);
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
                  style: TextStyle(fontSize: ScreenUtil.instance.setSp(23.0)),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0)),
                child:
                    BigCircle(usersSarovi: isSar ? saroviOffline : usersSarovi),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0)),
                child: TransferWithIcon(),
              ),
              Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: SizeConfig.blockSizeHorizontal * 78,
                      height: SizeConfig.blockSizeVertical * 7,
                      margin: EdgeInsets.only(
                        left: ScreenUtil.instance.setWidth(47.0),
                        top: SizeConfig.blockSizeVertical * 2,
                        right: ScreenUtil.instance.setWidth(47.0),
                      ),
                      child: TextFormField(
                        autofocus: false,
                        focusNode: nameFocus,
                        readOnly: isAnonymous == 1,
                        maxLength: 200,
                        enableSuggestions: false,
                        textCapitalization: TextCapitalization.sentences,
                        style: TextStyle(color: Colors.black),
                        initialValue: widget.snap2.data['name_and_surname'],
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)
                              .translate('name&surname'),
                          counterText: '',
                          hasFloatingPlaceholder: false,
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 35.0),
                          labelStyle: TextStyle(
                              color: MyColor().black,
                              fontSize: ScreenUtil.instance.setSp(16.0)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: isEmptyName
                                  ? MyColor().error
                                  : MyColor().black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                                color: isEmptyName
                                    ? MyColor().error
                                    : MyColor().black),
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
                        onTap: () => onTapFieldAnonymous(),
                        onChanged: (input) {
                          setState(() {
                            name = input;
                            isButtonComplete = true;
                            isButtonCompleteName = true;
                            print('isBTNCOMPLETE: ' + isButtonComplete.toString());
                          });
                          nameFocus.addListener(() {
                            print("Has focus: ${nameFocus.hasFocus}");
                          });
                        },
                        obscureText: false,
                      ),
                    ),
                    Container(
                        width: SizeConfig.blockSizeHorizontal * 78,
                      height:SizeConfig.blockSizeVertical * 7,
                      margin: EdgeInsets.only(
                        left: ScreenUtil.instance.setWidth(47.0),
                        top: SizeConfig.blockSizeVertical * 2.5,
                        right: ScreenUtil.instance.setWidth(47.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          onTapFieldAnonymousDate();
                        },
                        child: Focus(
                          autofocus: false,
                          focusNode: dateFocus,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                  ScreenUtil.instance.setWidth(33.5)),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 1.3,
                                  left: ScreenUtil.instance.setWidth(15.0)),
                              child: isClicked
                                  ? Text(
                                      isDateChanged ? dateOfBirth : dateOfBirth,
                                      style: TextStyle(
                                          fontSize:
                                              ScreenUtil.instance.setSp(14.0)),
                                    )
                                  : widget.snap2.data['date_of_birth'] == ''
                                      ? Text(
                                          AppLocalizations.of(context)
                                              .translate("dateOfBirth"),
                                          style: TextStyle(
                                              fontSize: ScreenUtil.instance
                                                  .setSp(15.0)),
                                        )
                                      : Text(
                                          widget.snap2.data['date_of_birth'],
                                          style: TextStyle(
                                              fontSize: ScreenUtil.instance
                                                  .setSp(15.0)),
                                        ),
                            ),
                          ),
                        ),
                      ),
                    ),
//                    Container(
//                         width: SizeConfig.blockSizeHorizontal * 78,
//                      height:SizeConfig.blockSizeVertical * 8,
//                      margin: EdgeInsets.only(
//                        left: ScreenUtil.instance.setWidth(47.0),
//                        top: ScreenUtil.instance.setWidth(22.0),
//                        right: ScreenUtil.instance.setWidth(47.0),
//                      ),
//                      child: TextFormField(
//                        autofocus: false,
//                        focusNode: emailFocus,
//                        readOnly: isAnonymous == 1,
//                        maxLength: 200,
//                        enableSuggestions: false,
//                        style: TextStyle(color: Colors.black),
//                        initialValue: widget.snap2.data['email_profile'],
//                        decoration: InputDecoration(
//                          counterText: '',
//                          hasFloatingPlaceholder: false,
//                          contentPadding: new EdgeInsets.symmetric(
//                              vertical: 25.0, horizontal: 35.0),
//                          labelText: AppLocalizations.of(context)
//                              .translate('enterEmail'),
//                          labelStyle: TextStyle(
//                              color: MyColor().black,
//                              fontSize: ScreenUtil.instance.setSp(16.0)),
//                          enabledBorder: OutlineInputBorder(
//                            borderRadius:
//                                BorderRadius.all(Radius.circular(33.5)),
//                            borderSide: BorderSide(
//                              color: isEmptyMail
//                                  ? MyColor().error
//                                  : MyColor().black,
//                            ),
//                          ),
//                          focusedBorder: OutlineInputBorder(
//                            borderRadius:
//                                BorderRadius.all(Radius.circular(33.5)),
//                            borderSide: BorderSide(
//                                color: isEmptyMail
//                                    ? MyColor().error
//                                    : MyColor().black),
//                          ),
//                          focusedErrorBorder: OutlineInputBorder(
//                            borderRadius:
//                                BorderRadius.all(Radius.circular(33.5)),
//                            borderSide: BorderSide(
//                              color: MyColor().error,
//                            ),
//                          ),
//                          errorBorder: OutlineInputBorder(
//                            borderRadius:
//                                BorderRadius.all(Radius.circular(33.5)),
//                            borderSide: BorderSide(
//                              color: MyColor().error,
//                            ),
//                          ),
//                        ),
//                        onChanged: (input) {
//                          setState(() {
//                            email = input;
//                            isButtonCompleteEmail = true;
//                            isButtonComplete = true;
//                          });
//                        },
//                        onTap: () => onTapFieldAnonymous(),
//                        obscureText: false,
//                      ),
//                    ),
                    Container(
                      child: LanguageChoose(refresh: widget.settingStates),
                    ),
//                    Container(
//                         width: SizeConfig.blockSizeHorizontal * 78,
//                      height:SizeConfig.blockSizeVertical * 8,
//                      margin: EdgeInsets.only(
//                        left: ScreenUtil.instance.setWidth(47.0),
//                        top: ScreenUtil.instance.setWidth(22.0),
//                        right: ScreenUtil.instance.setWidth(47.0),
//                      ),
//                      child: TextFormField(
//                        focusNode: creditFocus,
//                        autofocus: false,
//                        readOnly: isAnonymous == 1,
//                        keyboardType: TextInputType.number,
//                        maxLength: 200,
//                        enableSuggestions: false,
//                        style: TextStyle(color: Colors.black),
//                        initialValue: widget.snap2.data['card_number'],
//                        decoration: InputDecoration(
//                          counterText: '',
//                          hasFloatingPlaceholder: false,
//                          contentPadding: new EdgeInsets.symmetric(
//                              vertical: 25.0, horizontal: 35.0),
//                          icon: brandIcon != null
//                              ? FaIcon(
//                                  brandIcon,
//                                  color: isEmptyCard
//                                      ? MyColor().error
//                                      : MyColor().greenCircle,
//                                  size: SizeConfig.blockSizeHorizontal * 9,
//                                )
//                              : null,
//                          labelText: AppLocalizations.of(context)
//                              .translate('enterCardNumber'),
//                          labelStyle: TextStyle(
//                              color: MyColor().black,
//                              fontSize: ScreenUtil.instance.setSp(16.0)),
//                          enabledBorder: OutlineInputBorder(
//                            borderRadius:
//                                BorderRadius.all(Radius.circular(33.5)),
//                            borderSide: BorderSide(
//                              color: isEmptyCard
//                                  ? MyColor().error
//                                  : MyColor().black,
//                            ),
//                          ),
//                          focusedBorder: OutlineInputBorder(
//                            borderRadius:
//                                BorderRadius.all(Radius.circular(33.5)),
//                            borderSide: BorderSide(
//                                color: isEmptyCard
//                                    ? MyColor().error
//                                    : MyColor().black),
//                          ),
//                          focusedErrorBorder: OutlineInputBorder(
//                            borderRadius:
//                                BorderRadius.all(Radius.circular(33.5)),
//                            borderSide: BorderSide(
//                              color: MyColor().error,
//                            ),
//                          ),
//                          errorBorder: OutlineInputBorder(
//                            borderRadius:
//                                BorderRadius.all(Radius.circular(33.5)),
//                            borderSide: BorderSide(
//                              color: MyColor().error,
//                            ),
//                          ),
//                        ),
//                        onChanged: (input) {
//                          setState(() {
//                            creditCard = input;
//                            creditCardNumber = input;
//                            isButtonCompleteCard = true;
//                            isButtonComplete = true;
//                          });
//                          String brand =
//                              CreditCardValidator.identifyCardBrand(input);
//                          // var type = detectCCType(input);
//                          IconData ccBrandIcon;
//                          if (brand != null) {
//                            if (brand == 'visa') {
//                              ccBrandIcon = FontAwesomeIcons.ccVisa;
//                            } else if (brand == 'master_card') {
//                              ccBrandIcon = FontAwesomeIcons.ccMastercard;
//                            } else if (brand == 'american_express') {
//                              ccBrandIcon = FontAwesomeIcons.ccAmex;
//                            } else if (brand == 'discover') {
//                              ccBrandIcon = FontAwesomeIcons.ccDiscover;
//                            }
//                          }
//                          setState(() {
//                            brandIcon = ccBrandIcon;
//                          });
//                        },
//                        onTap: () => onTapFieldAnonymous(),
//                        obscureText: false,
//                      ),
//                    ),
//                    isEmptyCard
//                        ? Container(
//                            margin: EdgeInsets.only(
//                                top: ScreenUtil.instance.setWidth(10.0)),
//                            child: Text(
//                              'The credit card number is invalid.',
//                              style: TextStyle(color: Colors.red),
//                            ),
//                          )
//                        : Text(
//                            '',
//                            style: TextStyle(color: Colors.green),
//                          ),
//                    Row(
//                      children: <Widget>[
//                        Container(
//                          width: ScreenUtil.instance.setWidth(156.0),
//                          height: ScreenUtil.instance.setHeight(67.0),
//                          margin: EdgeInsets.only(
//                            left: ScreenUtil.instance.setWidth(47.0),
//                            top: ScreenUtil.instance.setWidth(22.0),
//                            right: ScreenUtil.instance.setWidth(0.0),
//                          ),
//                          child: TextFormField(
//                            focusNode: expireFocus,
//                            autofocus: false,
//                            readOnly: isAnonymous == 1,
//                            inputFormatters: [maskTextInputFormatterDate],
//                            keyboardType: TextInputType.number,
//                            maxLength: 200,
//                            enableSuggestions: false,
//                            initialValue: widget.snap2.data['expire_date'],
//                            style: TextStyle(color: Colors.black),
//                            decoration: InputDecoration(
//                              counterText: '',
//                              hasFloatingPlaceholder: false,
//                              contentPadding: new EdgeInsets.symmetric(
//                                  vertical: 25.0, horizontal: 35.0),
//                              labelText: AppLocalizations.of(context)
//                                  .translate('date'),
//                              labelStyle: TextStyle(
//                                  color: MyColor().black,
//                                  fontSize: ScreenUtil.instance.setSp(16.0)),
//                              enabledBorder: OutlineInputBorder(
//                                borderRadius:
//                                    BorderRadius.all(Radius.circular(33.5)),
//                                borderSide: BorderSide(
//                                  color: isEmptyDate
//                                      ? MyColor().error
//                                      : MyColor().black,
//                                ),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                borderRadius:
//                                    BorderRadius.all(Radius.circular(33.5)),
//                                borderSide: BorderSide(
//                                    color: isEmptyDate
//                                        ? MyColor().error
//                                        : MyColor().black),
//                              ),
//                              focusedErrorBorder: OutlineInputBorder(
//                                borderRadius:
//                                    BorderRadius.all(Radius.circular(33.5)),
//                                borderSide: BorderSide(
//                                  color: MyColor().error,
//                                ),
//                              ),
//                              errorBorder: OutlineInputBorder(
//                                borderRadius:
//                                    BorderRadius.all(Radius.circular(33.5)),
//                                borderSide: BorderSide(
//                                  color: MyColor().error,
//                                ),
//                              ),
//                            ),
//                            onChanged: (input) {
//                              setState(() {
//                                date = input;
//                                isButtonCompleteDate = true;
//                                isButtonComplete = true;
//                              });
//                            },
//                            onTap: () => onTapFieldAnonymous(),
//                            obscureText: false,
//                          ),
//                        ),
//                        Container(
//                          width: ScreenUtil.instance.setWidth(156.0),
//                          height: ScreenUtil.instance.setHeight(67.0),
//                          margin: EdgeInsets.only(
//                            left: ScreenUtil.instance.setWidth(5.0),
//                            top: ScreenUtil.instance.setWidth(22.0),
//                            right: ScreenUtil.instance.setWidth(0.0),
//                          ),
//                          child: TextFormField(
//                            focusNode: ccFocus,
//                            autofocus: false,
//                            readOnly: isAnonymous == 1,
//                            keyboardType: TextInputType.number,
//                            inputFormatters: [maskTextInputFormatterCC],
//                            maxLength: 200,
//                            enableSuggestions: false,
//                            style: TextStyle(color: Colors.black),
//                            initialValue: widget.snap2.data['cc'],
//                            decoration: InputDecoration(
//                              counterText: '',
//                              hasFloatingPlaceholder: false,
//                              contentPadding: new EdgeInsets.symmetric(
//                                  vertical: 25.0, horizontal: 35.0),
//                              labelText:
//                                  AppLocalizations.of(context).translate('cc'),
//                              labelStyle: TextStyle(
//                                  color: MyColor().black,
//                                  fontSize: ScreenUtil.instance.setSp(16.0)),
//                              enabledBorder: OutlineInputBorder(
//                                borderRadius:
//                                    BorderRadius.all(Radius.circular(33.5)),
//                                borderSide: BorderSide(
//                                  color: isEmptyCC
//                                      ? MyColor().error
//                                      : MyColor().black,
//                                ),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                borderRadius:
//                                    BorderRadius.all(Radius.circular(33.5)),
//                                borderSide: BorderSide(
//                                    color: isEmptyCC
//                                        ? MyColor().error
//                                        : MyColor().black),
//                              ),
//                              focusedErrorBorder: OutlineInputBorder(
//                                borderRadius:
//                                    BorderRadius.all(Radius.circular(33.5)),
//                                borderSide: BorderSide(
//                                  color: MyColor().error,
//                                ),
//                              ),
//                              errorBorder: OutlineInputBorder(
//                                borderRadius:
//                                    BorderRadius.all(Radius.circular(33.5)),
//                                borderSide: BorderSide(
//                                  color: MyColor().error,
//                                ),
//                              ),
//                            ),
//                            onChanged: (input) {
//                              setState(() {
//                                cc = input;
//                                isButtonCompleteCC = true;
//                                isButtonComplete = true;
//                              });
//                            },
//                            onTap: () => onTapFieldAnonymous(),
//                            obscureText: false,
//                          ),
//                        ),
//                      ],
//                    ),
                  ],
                ),
              ),
              Container(
                child: isAnonymous == 0
                    ? ProfileButton(onPressed: onPressed)
                    : EmptyContainer(),
              ),
              Container(
                child: isAnonymous == 1
                    ? RegisterButtonProfile(onPressedRegister)
                    : EmptyContainer(),
              ),
            ],
          )),
        ]),
      ),
    );
  }

  onTapFieldAnonymous() {
    if (_btnCounter == 0) {
      isAnonymous == 1
          ? MySnackbar().showSnackbar(
              AppLocalizations.of(context).translate('youMustRegisterFirst'),
              context,
              AppLocalizations.of(context).translate('ok'))
          : print('ssss');
      _btnCounter = 1;
      Timer(Duration(seconds: 2), () {
        _btnCounter = 0;
      });
    }
  }

  onTapFieldAnonymousDate() {
    if (_btnCounter == 0) {
      isAnonymous == 1
          ? MySnackbar().showSnackbar(
              AppLocalizations.of(context).translate('youMustRegisterFirst'),
              context,
              AppLocalizations.of(context).translate('ok'))
          : isAnonymous == 0
              ? () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                isButtonComplete = true;
                                isButtonCompleteDOB = true;
                                isClicked = true;
                              });
                              if (isDateChanged == false) {
                                dateOfBirth =
                                    DateFormat.yMd().format(dateOfBirth2);
                              }
                              Navigator.of(context)
                                  .focusScopeNode
                                  .requestFocus(emailFocus);
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              key: UniqueKey(),
                              height: ScreenUtil.instance.setHeight(265.0),
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime: dateOfBirth2,
                                onDateTimeChanged: (date) {
                                  setState(() {
                                    dateOfBirth2 = date;
                                    dateOfBirth =
                                        DateFormat.yMd().format(dateOfBirth2);
                                    isDateChanged = true;
                                    isButtonComplete = true;
                                    isButtonCompleteDOB = true;
                                    isClicked = true;
                                  });
                                },
                              ),
                            ));
                      });
                }()
              : print('ssss');
      _btnCounter = 1;
      Timer(Duration(seconds: 2), () {
        _btnCounter = 0;
      });
    }
  }

  successfullTransfer() {
    return MySnackbarTransfer().showSnackbar(
        AppLocalizations.of(context).translate('successTransfer'), context, '');
  }

  /// Metoda koja se poziva na klik button-a kada na njemu piše 'Complete profile'
  completeProfile() {
    FirebaseCrud().updateUserOnCompletePRofile(
      snap,
      isButtonCompleteName ? name : usersName,
      isButtonCompleteDOB ? dateOfBirth : usersDOB,
//      isButtonCompleteEmail ? email : usersEmail,
//      isButtonCompleteCard ? creditCard : usersCard,
//      isButtonCompleteDate ? date : usersCardDate,
//      isButtonCompleteCC ? cc : usersCC,
    );
    setState(() {
      btnText = isButtonComplete
          ? AppLocalizations.of(context).translate('transfer')
          : AppLocalizations.of(context).translate('complete');
    });
    widget.refreshNavbar();
    print('COMPLETE PROFILE FN');
  }

  transferSar() {
    /// metoda za kreiranje kolekcije transferi
    FirebaseCrud().createTransfer(
        DateTime.now().toString(),
        isButtonCompleteName ? name : usersName,
        isButtonCompleteDOB ? dateOfBirth : usersDOB,
//        isButtonCompleteEmail ? email : usersEmail,
//        isButtonCompleteCard ? creditCard : usersCard,
//        isButtonCompleteDate ? date : usersCardDate,
//        isButtonCompleteCC ? cc : usersCC,
        usersSarovi);
    FirebaseCrud().updateUserOnCompletePRofile(
      snap,
      isButtonCompleteName ? name : usersName,
      isButtonCompleteDOB ? dateOfBirth : usersDOB,
//      isButtonCompleteEmail ? email : usersEmail,
//      isButtonCompleteCard ? creditCard : usersCard,
//      isButtonCompleteDate ? date : usersCardDate,
//      isButtonCompleteCC ? cc : usersCC,
    );
    FirebaseCrud().updateSarOnTransfer(snap, 0, usersSarovi);
    setState(() {
      btnText = AppLocalizations.of(context).translate('transferAfter100SAR');
    });
    saroviOffline = 0;
    Timer(Duration(seconds: 1), () {
      setState(() {});
    });
  }

  onPressedRegister() {
    isFromProfile = true;
    FirebaseCrud().userRegister(context, widget.arguments.username);
  }

  onPressed() {
    print('BTN TEXT: ' + btnText);
    if (btnText == 'Complete profile' || btnText == 'إكمال الملف الشخصي') {
      if (name == '' || regexSpace.hasMatch(name) == false) {
        setState(() {
          isEmptyName = true;
        });
        Timer(Duration(seconds: 2), () {
          setState(() {
            isEmptyName = false;
          });
        });
      }
//      else if (email == '' || regexEmail.hasMatch(email) == false) {
//        setState(() {
//          isEmptyMail = true;
//        });
//        Timer(Duration(seconds: 2), () {
//          setState(() {
//            isEmptyMail = false;
//          });
//        });
//      }
      else if (dateOfBirth == '') {
        setState(() {
          isEmptyBirth = true;
        });
        Timer(Duration(seconds: 2), () {
          setState(() {
            isEmptyBirth = false;
          });
        });
      }
//      else if (creditCard == '' ||
//              creditCardNumber.length < 13 ||
//              creditCardNumber.startsWith('3')
//          ? creditCardNumber.length < 15
//          : !CreditCardValidator.isCreditCardValid(
//              cardNumber: creditCardNumber)) {
//        setState(() {
//          isEmptyCard = true;
//        });
//        Timer(Duration(seconds: 2), () {
//          setState(() {
//            isEmptyCard = false;
//          });
//        });
//      } else if (date == '' || date.length < 5) {
//        setState(() {
//          isEmptyDate = true;
//        });
//        Timer(Duration(seconds: 2), () {
//          setState(() {
//            isEmptyDate = false;
//          });
//        });
//      } else if (cc == '' || cc.length < 3) {
//        setState(() {
//          isEmptyCC = true;
//        });
//        Timer(Duration(seconds: 2), () {
//          setState(() {
//            isEmptyCC = false;
//          });
//        });
//      }
    else {
        completeProfile();
      }
    } else if (btnText == 'Transfer' || btnText == 'تحويل') {
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
//      }
//      else if (isButtonCompleteCard
//          ? creditCardNumber.length < 13 || creditCardNumber.startsWith('3')
//          ? creditCardNumber.length < 15
//          : !CreditCardValidator.isCreditCardValid(
//              cardNumber: creditCardNumber)
//          : usersCard == '' ||
//              usersCard.length < 13 ||
//              !CreditCardValidator.isCreditCardValid(cardNumber: usersCard)) {
//        setState(() {
//          isEmptyCard = true;
//        });
//        Timer(Duration(seconds: 2), () {
//          setState(() {
//            isEmptyCard = false;
//          });
//        });
//      } else if (isButtonCompleteDate
//          ? date == '' || date.length < 5
//          : usersCardDate == '' || usersCardDate.length < 5) {
//        setState(() {
//          isEmptyDate = true;
//        });
//        Timer(Duration(seconds: 2), () {
//          setState(() {
//            isEmptyDate = false;
//          });
//        });
//      } else if (isButtonCompleteCC
//          ? cc == '' || cc.length < 3
//          : usersCC == '' || usersCC.length < 3) {
//        setState(() {
//          isEmptyCC = true;
//        });
//        Timer(Duration(seconds: 2), () {
//          setState(() {
//            isEmptyCC = false;
//          });
//        });
      } else {
        transferSar();
        successfullTransfer();
      }
    }
  }
}

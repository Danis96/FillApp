/// Yes No Choice class
///
/// This class contains methods that updates users choice.
///
/// Imports:
///   MyColor constant class with all colors
///   Cloud_firestore for connection to the firebase
///   FirebaseCrud class which contains all method for database
///   ScreenUtil class for respnsive desing
///   QuestionSkelet model class for questions.
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/models/FlashQuestion/questionSkelet.dart';
import 'package:fillproject/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyYesChoice extends StatefulWidget {
  final String choice, username;
  final int index, target, sar;
  final Function notifyParent;
  final List<dynamic> snapi;
  final DocumentSnapshot doc, snap;
  final ValueKey key;
  int usersSars;
  final bool isSar;
  final double marginRight;

  MyYesChoice({
    this.choice,
    this.isSar,
    this.snap,
    this.usersSars,
    this.key,
    this.sar,
    this.index,
    this.snapi,
    this.notifyParent,
    this.target,
    this.doc,
    this.username,
    this.marginRight,
  });

  @override
  _MyYesChoiceState createState() => _MyYesChoiceState();
}

class _MyYesChoiceState extends State<MyYesChoice> {
  @override
  void initState() {
    super.initState();
    isTappedYesNoFlash = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Container(
        key: UniqueKey(),
        width:  SizeConfig.blockSizeHorizontal * 28,
        height:  SizeConfig.blockSizeVertical * 8,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(widget.marginRight)),
        child: Container(
          width: ScreenUtil.instance.setWidth(113.0),
          height: ScreenUtil.instance.setHeight(55.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(28.0),
            ),
            hoverColor: isTappedYesNoFlash ? MyColor().white : MyColor().black,
            elevation: 0,
            color: isTappedYesNoFlash ? MyColor().white : MyColor().black,
            onPressed: () {
              if(counterSurvey == 0) {
                setState(() {
                  isTappedYesNoFlash = true;
                });
                Timer(Duration(milliseconds: 500), () {
                  onPressed();
                });
                counterSurvey = 1;
                Timer(Duration(seconds: 2), () {
                  counterSurvey = 0;
                });
              }

            },
            child: Text(widget.choice,
                style: TextStyle(
                    color:
                        isTappedYesNoFlash ? MyColor().black : MyColor().white,
                    fontWeight: FontWeight.w400,
                    fontFamily: arabic,
                    fontStyle: FontStyle.normal,
                    fontSize: ScreenUtil.instance.setSp(15.0))),
          ),
        ),
        decoration: BoxDecoration(
            color: isTappedYesNoFlash ? MyColor().white : MyColor().black,
            border: Border.all(color: MyColor().white),
            borderRadius: BorderRadius.all(Radius.circular(33.5))));
  }

  onPressed() {
    widget.usersSars += widget.sar;
    saroviOffline += widget.sar;
    /// update sarova na osnovu da li je app online ili offlines
    ///
    /// online = [widget.usersSar]
    /// offline = [saroviOffline]
    if (widget.isSar) {
      FirebaseCrud().updateUsersSars(widget.snap, context, saroviOffline);
    } else {
      FirebaseCrud().updateUsersSars(widget.snap, context, widget.usersSars);
    }
    FirebaseCrud().updateListOfUsernameAnswers(
        widget.doc, context, widget.username, widget.choice);
    FirebaseCrud().updateListOfUsernamesThatGaveAnswers(
        widget.doc, context, widget.username);
    isTappedYesNoFlash = false;
    listKey.currentState.removeItem(
      widget.index,
      (context, animation) => EmptyContainer(),
    );
    widget.snapi.removeAt(widget.index);
    widget.snapi.insert(widget.index, QuestionSkelet());
    listKey.currentState.insertItem(widget.index);
    widget.notifyParent();
  }
}

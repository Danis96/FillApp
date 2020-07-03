/// Multiple Choice Question  class
///
/// This class contains methods that updates users choice.
///
/// Imports:
///   MyColor constant class with all colors
///   Cloud_firestore for connection to the firebase
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
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/models/FlashQuestion/questionSkelet.dart';
import 'package:fillproject/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../globals.dart';
import 'emptyCont.dart';

class MyMCQChoice2 extends StatefulWidget {
  final DocumentSnapshot doc;
  final DocumentSnapshot snap;
  final String choice, username;
  int index, target, sar, usersSar;
  final Function() notifyParent;
  final List<dynamic> snapi;
  final bool isSar;
  final bottomMargin;

  MyMCQChoice2(
      {this.choice,
      this.isSar,
      this.snapi,
      this.index,
      this.notifyParent,
      this.target,
      this.doc,
      this.username,
      this.sar,
      this.snap,
      this.usersSar,
      this.bottomMargin});

  @override
  _MyMCQChoiceState2 createState() => _MyMCQChoiceState2();
}

class _MyMCQChoiceState2 extends State<MyMCQChoice2> {
  @override
  void initState() {
    super.initState();
    isTappedMCQFlash2 = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: UniqueKey(),
        width: SizeConfig.blockSizeHorizontal * 65,
        height: SizeConfig.blockSizeVertical * 7,
        margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
        alignment: Alignment.center,
        child: Container(
          width: ScreenUtil.instance.setWidth(257.0),
          height: ScreenUtil.instance.setHeight(55.0),
          child: RaisedButton(
            key: UniqueKey(),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(28.0),
            ),
            hoverColor: isTappedMCQFlash2 ? MyColor().white : Color.fromRGBO(74, 85, 98, 1.0),
            elevation: 0,
            color: isTappedMCQFlash2 ? MyColor().white : Color.fromRGBO(74, 85, 98, 1.0),
            onPressed: () {
              if(counterSurvey == 0) {
                setState(() {
                  isTappedMCQFlash2 = true;
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
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color:
                        isTappedMCQFlash2 ? MyColor().black : MyColor().white,
                    fontWeight: FontWeight.w400,
                    fontFamily: arabic,
                    fontStyle: FontStyle.normal,
                    fontSize: ScreenUtil.instance.setSp(15.0))),
          ),
        ),
        decoration: BoxDecoration(
            color: isTappedMCQFlash2 ? MyColor().white : Color.fromRGBO(74, 85, 98, 1.0),
            border: Border.all(color: MyColor().white),
            borderRadius: BorderRadius.all(Radius.circular(33.5))));
  }

  onPressed() {
    widget.usersSar += widget.sar;
    saroviOffline += widget.sar;

    /// update sarova na osnovu da li je app online ili offline
    ///
    /// online = [widget.usersSar]
    /// offline = [saroviOffline]
    if (widget.isSar) {
      FirebaseCrud().updateUsersSars(widget.snap, context, saroviOffline);
    } else {
      FirebaseCrud().updateUsersSars(widget.snap, context, widget.usersSar);
    }
    FirebaseCrud().updateListOfUsernameAnswers(
        widget.doc, context, widget.username, widget.choice);
    FirebaseCrud().updateListOfUsernamesThatGaveAnswers(
        widget.doc, context, widget.username);

    listKey.currentState.removeItem(
      widget.index,
      (context, animation) => EmptyContainer(),
    );
    widget.snapi.removeAt(widget.index);
    widget.snapi.insert(widget.index, QuestionSkelet());
    listKey.currentState.insertItem(widget.index);
    widget.notifyParent();
    isTappedMCQFlash2 = false;
  }
}

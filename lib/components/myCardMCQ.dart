/// Multiple Choice Question  class
///
/// This class contains model for flash muliple choice question card.
///
/// Imports:
///   MyColor constant class with all colors
///   Cloud_firestore for connection to the firebase
///   ScreenUtil class for respnsive desing
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/myMCQChoice1.dart';
import 'package:fillproject/components/myMCQChoice2.dart';
import 'package:fillproject/components/myMCQChoice3.dart';
import 'package:fillproject/components/myQuestion.dart';
import 'package:fillproject/components/myQuestionSAR.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCardMCQ extends StatefulWidget {
  final String question, username;
  final int sar, target, usersSar;
  final List<dynamic> snapi;
  final int index;
  final List<dynamic> choices;
  final Function() notifyParent;
  final DocumentSnapshot doc;
  final DocumentSnapshot snap;
  final ValueKey key;
  final bool isSar;

  MyCardMCQ(
      {this.sar,
      this.isSar,
      this.usersSar,
      this.snap,
      this.key,
      this.question,
      this.choices,
      this.index,
      this.snapi,
      @required this.notifyParent,
      this.target,
      this.doc,
      this.username});

  @override
  _MyCardMCQState createState() => _MyCardMCQState();
}

class _MyCardMCQState extends State<MyCardMCQ> {
  final List<dynamic> choicesEnd = [];
  String firstQ;
  String secondQ;
  String thirdQ;

  @override
  void initState() {
    getChoices(widget.choices);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);
    return Container(
        key: widget.key,
        width: SizeConfig.blockSizeHorizontal * 85,
        margin: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(12.0),
            right: ScreenUtil.instance.setWidth(12.0)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: MyColor().black),
        child: Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil.instance.setWidth(40.0),
              right: ScreenUtil.instance.setWidth(40.0),
              top: SizeConfig.blockSizeVertical * 3),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(top: ScreenUtil.instance.setWidth(5.0)),
                  child: MyQuestionSAR(
                    text: '${widget.sar} ' +
                        AppLocalizations.of(context).translate('SAR'),
                    isCompleted: false,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: ScreenUtil.instance.setWidth(5.0)),
                  child: MyQuestion(
                      isCompleted: false,
                      question: widget.question,
                      containerHeight: SizeConfig.blockSizeVertical * 8),
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 29,
                  width: ScreenUtil.instance.setWidth(260.0),
                  margin:
                      EdgeInsets.only(top: ScreenUtil.instance.setWidth(1.0)),
                  child: Column(
                     mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                           MyMCQChoice1(
                             choice: firstQ,
                              isSar: widget.isSar,
                              snapi: widget.snapi,
                              index: widget.index,
                              notifyParent: widget.notifyParent,
                              target: widget.target,
                              doc: widget.doc,
                              username: widget.username,
                              sar: widget.sar,
                              usersSar: widget.usersSar,
                              snap: widget.snap
                           ),
                           MyMCQChoice2(
                             choice: secondQ,
                              isSar: widget.isSar,
                              snapi: widget.snapi,
                              index: widget.index,
                              notifyParent: widget.notifyParent,
                              target: widget.target,
                              doc: widget.doc,
                              username: widget.username,
                              sar: widget.sar,
                              usersSar: widget.usersSar,
                              snap: widget.snap
                           ),
                           MyMCQChoice3(
                             choice: thirdQ,
                              isSar: widget.isSar,
                              snapi: widget.snapi,
                              index: widget.index,
                              notifyParent: widget.notifyParent,
                              target: widget.target,
                              doc: widget.doc,
                              username: widget.username,
                              sar: widget.sar,
                              usersSar: widget.usersSar,
                              snap: widget.snap
                           ),
                      ]
                          ),
                ),
              ]),
        ));
  }

  getChoices(List<dynamic> choices) {
    /// get all questions
    firstQ = choices[0]['text'];
    secondQ = choices[1]['text'];
    thirdQ = choices[2]['text'];
  }
}

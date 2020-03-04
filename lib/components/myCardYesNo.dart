/// Yes No Card class
///
/// This class contains model for flash yes and no question card.
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
import 'package:fillproject/components/myQuestion.dart';
import 'package:fillproject/components/myQuestionSAR.dart';
import 'package:fillproject/components/myYesNoChoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCardYesNo extends StatefulWidget {
  final String question, username;
  final int sar, target, usersSar;
  final List<dynamic> snapi;
  final int index;
  final Function() notifyParent;
  final DocumentSnapshot doc, snap;
  final ValueKey key;
  final bool isSar;

  MyCardYesNo(
      {this.question,
      this.key,
      this.sar,
      this.isSar,
      this.usersSar,
      this.index,
      this.snapi,
      this.snap,
      @required this.notifyParent,
      this.target,
      this.doc,
      this.username});

  @override
  _MyCardYesNoState createState() => _MyCardYesNoState();
}

class _MyCardYesNoState extends State<MyCardYesNo> {
  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);
    return Container(
       key: widget.key,
        width: ScreenUtil.instance.setWidth(340.0),
        height: ScreenUtil.instance.setHeight(200.0),
    margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(12.0), top: ScreenUtil.instance.setWidth(160.0), right: ScreenUtil.instance.setWidth(12.0)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: MyColor().black),
        child: Padding(
            padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(40.0), right: ScreenUtil.instance.setWidth(40.0), top: ScreenUtil.instance.setWidth(15.0)),          
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(5.0)),
                child: MyQuestionSAR(text: widget.sar.toString() + ' SAR'),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(5.0)),
                child: MyQuestion(
                  question: widget.question,
                  containerHeight: ScreenUtil.instance.setHeight(90.0)),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(5.0)),
                  child: Row(
                    children: <Widget>[
                      MyYesNoChoice(
                          choice: 'Yes',
                          snapi: widget.snapi,
                          usersSars: widget.usersSar,
                          sar: widget.sar,
                          isSar: widget.isSar,
                          snap: widget.snap,
                          index: widget.index,
                          notifyParent: widget.notifyParent,
                          target: widget.target,
                          doc: widget.doc,
                          marginRight: ScreenUtil.instance.setWidth(0.0),
                          username: widget.username),
                      MyYesNoChoice(
                          choice: 'No',
                          snapi: widget.snapi,
                          usersSars: widget.usersSar,
                          snap: widget.snap,
                          isSar: widget.isSar,
                          sar: widget.sar,
                          index: widget.index,
                          notifyParent: widget.notifyParent,
                          target: widget.target,
                          doc: widget.doc,
                          marginRight: ScreenUtil.instance.setWidth(35.0),
                          username: widget.username)
                    ],
                  ),
                )
              ]),
        ));
  }
}

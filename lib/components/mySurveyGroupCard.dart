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
import 'package:fillproject/components/myProgressNumbers.dart';
import 'package:fillproject/components/myQuestion.dart';
import 'package:fillproject/components/myQuestionSAR.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySurveyGroupCard extends StatefulWidget {
  final String question, username;
  final int sar, target, usersSar;
  final List<dynamic> snapi;
  final int index;
  //final Function() notifyParent;
  final DocumentSnapshot doc, snap;
  final ValueKey key;
  final bool isSar;

  MySurveyGroupCard(
      {this.question,
      this.key,
      this.sar,
      this.isSar,
      this.usersSar,
      this.index,
      this.snapi,
      this.snap,
      //@required this.notifyParent,
      this.target,
      this.doc,
      this.username});

  @override
  _MySurveyGroupCard createState() => _MySurveyGroupCard();
}

class _MySurveyGroupCard extends State<MySurveyGroupCard> {
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
        height: ScreenUtil.instance.setHeight(265.0),
        margin: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(30.0),
            right: ScreenUtil.instance.setWidth(30.0),
            bottom: ScreenUtil.instance.setWidth(25.0)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: MyColor().black),
        child: Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(37.0),
                right: ScreenUtil.instance.setWidth(37.0),
                top: ScreenUtil.instance.setWidth(15.0)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(5.0)),
                        child: MyQuestionSAR(text: '45 SAR'),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(5.0),
                            left: ScreenUtil.instance.setWidth(83.0)),
                        child: MyProgressNumbers(answered: 9, total: 10),
                      ),
                    ],
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: ScreenUtil.instance.setWidth(120.0)),
                    child: MyQuestion(
                        question: 'Survey Name Group',
                        containerHeight: ScreenUtil.instance.setHeight(80.0)),
                  ),
                ])));
  }
}

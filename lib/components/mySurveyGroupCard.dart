import 'dart:async';

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
import 'package:fillproject/components/SurveyCardYesNo/components/statuSurvey.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/summary.dart';
import 'package:fillproject/components/SurveyCardYesNo/surveyCard.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/components/myProgressNumbers.dart';
import 'package:fillproject/components/myQuestion.dart';
import 'package:fillproject/components/myQuestionSAR.dart';
import 'package:fillproject/dashboard/survey.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../firebaseMethods/firebaseJson.dart';
import '../globals.dart';

class MySurveyGroupCard extends StatefulWidget {
  final PasswordArguments arguments;
  final String name, username, usernameSecond;
  final int answered, total, sar, userSar;
  final DocumentSnapshot doc, userDoc;
  final List<dynamic> snapQuestions, usernameFinal, userProgress;
  MySurveyGroupCard({
    this.arguments,
    this.sar,
    this.userSar,
    this.name,
    this.answered,
    this.total,
    this.snapQuestions,
    this.username,
    this.doc,
    this.userDoc,
    this.usernameFinal,
    this.usernameSecond,
    this.userProgress,
  });

  @override
  _MySurveyGroupCard createState() => _MySurveyGroupCard();
}

class _MySurveyGroupCard extends State<MySurveyGroupCard>
    with AutomaticKeepAliveClientMixin<MySurveyGroupCard> {
  bool isCompleted = false, isFirst = false, justToggle = false;
  int number;
  List<dynamic> endProgress;
  var user;

  @override
  void initState() {
    super.initState();
    if (usernameFinal.contains(widget.username) == false &&
        usernameFinal.contains(usernameSecond) == false) {
      isCompleted = false;
    } else {
      isCompleted = true;
    }
    Timer(Duration(seconds: 1), () {
      setState(() {
        justToggle = !justToggle;
      });
      getUserProgress();
    });
    getUserProgress();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);
    return GestureDetector(
      onTap: () {
      //  FirebaseJson().importSurveyJson();
        if (!isCompleted) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => SurveyCard(
                  notifyParent: refreshState,
                  user: user,
                  userDoc: widget.userDoc,
                  sarSurvey: widget.sar,
                  number: number,
                  increaseAnswered: increaseAnswered,
                  userSar: widget.userSar,
                  arguments: widget.arguments,
                  isCompleted: setColor,
                  doc: widget.doc,
                  username: widget.username,
                  snapQuestions: widget.snapQuestions,
                  total: widget.total)));
        }
      },
      child: Container(
          key: widget.key,
          width: ScreenUtil.instance.setWidth(340.0),
          height: ScreenUtil.instance.setHeight(265.0),
          margin: EdgeInsets.only(
              left: ScreenUtil.instance.setWidth(30.0),
              right: ScreenUtil.instance.setWidth(30.0),
              bottom: ScreenUtil.instance.setWidth(25.0)),
          decoration: BoxDecoration(
              border: Border.all(
                  color: isCompleted ? MyColor().black : MyColor().black,
                  width: 3.0),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: isCompleted ? MyColor().white : MyColor().black),
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
                          child: MyQuestionSAR(
                            text: '+' + widget.sar.toString() + ' SAR',
                            isCompleted: isCompleted,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil.instance.setWidth(5.0),
                              left: ScreenUtil.instance.setWidth(83.0)),
                          child: MyProgressNumbers(
                              isCompleted: isCompleted,
                              answered: isCompleted ? widget.total : number,
                              total: widget.total),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setWidth(60.0)),
                      child: MyQuestion(
                          isCompleted: isCompleted,
                          question: widget.name,
                          containerHeight: ScreenUtil.instance.setHeight(80.0)),
                    ),
                    isCompleted ? StatusSurvey() : EmptyContainer(),
                  ]))),
    );
  }

  setColor() {
    setState(() {
      isCompleted = true;
    });
  }

  increaseAnswered() {
    setState(() {
      number++;
    });
    FirebaseCrud().deleteListOfUsernamesThatGaveAnswersProgress(
        widget.doc, context, widget.username + ',' + number.toString());
    FirebaseCrud().updateListOfUsernamesThatGaveAnswersProgress(
        widget.doc, context, widget.username + ',' + number.toString());
  }

  getUserProgress() {
    if (widget.userProgress.length == null || widget.userProgress.length == 0) {
      number = 0;
    } else {
      for (int i = 0; i < widget.userProgress.length; i++) {
        var usernameProgress = widget.userProgress[i].toString();
        user = usernameProgress.split(',');
        var progressNum = user[1];
        if (user[0] == widget.username || user[0] == widget.usernameSecond) {
          number = int.parse(progressNum);
        } else {
          number = 0;
        }
      }
    }
  }

  refreshState() {
    setState(() {
      justToggle = !justToggle;
    });
  }

  @override
  bool get wantKeepAlive => true;
}

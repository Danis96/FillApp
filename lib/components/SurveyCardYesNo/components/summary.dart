/// Summary Page class
///
/// This class contains methods and layout for Home page.
///
/// Imports:
///   MyColor constant class with all colors
///   Cloud_firestore for connection to the firebase
///   ScreenUtil class for respnsive desing
///   Routes
///   Database connections
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/appBar.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/congradulationsContainer.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/summaryContainer.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/summaryTitleContainer.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/totalSar.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/models/Survey/surveyModel.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Summary extends StatefulWidget {
  final List<dynamic> questions, usernameAnswers;
  final int totalSar, userLevel;
  final int totalProgress;
  final Function animateTo;
  final PasswordArguments arguments;
  final DocumentSnapshot doc;
  final Survey surveyDoc;
  final String usernameSecond;
  String surveyName;
  Summary(
      {this.totalSar,
      this.questions,
      this.totalProgress,
      this.animateTo,
      this.arguments,
      this.userLevel,
      this.usernameAnswers,
      this.doc,
      this.usernameSecond,
      this.surveyDoc,
      this.surveyName});

  @override
  _SummaryState createState() => _SummaryState();
}

String title;
bool toggle = true;

class _SummaryState extends State<Summary> {
  int num = 0;
  String userAnswers, usernameThatAnswers;
  bool isSar = false;

  @override
  void initState() {
    super.initState();
    isOnSummary = true;
  }

  @override
  Widget build(BuildContext context) {
    Constant().responsive(context);

    if (offlineAnswers.length > widget.totalProgress) {
      offlineAnswers.removeAt(0);
    }
    print(offlineAnswers);

    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      backgroundColor: MyColor().black,
      body: Builder(
        builder: (context) => WillPopScope(
            onWillPop: _onWillPop,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                SurveyAppBar(
                  percent: 1,
                  arguments: PasswordArguments(
                      email: widget.arguments.email,
                      password: widget.arguments.password,
                      phone: widget.arguments.phone,
                      username: widget.arguments.username),
                  totalProgress: widget.totalProgress,
                  surveyDoc: widget.surveyDoc,
                  answersList: offlineAnswers,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(25.0),
                      right: ScreenUtil.instance.setWidth(25.0)),
                  child: Column(
                    children: <Widget>[
                      CongradulationsContainer(),
                      TotalSar(sars: widget.totalSar.toString()),
                      SummaryTitleContainer(),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: ScreenUtil.instance.setWidth(20.0)),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: widget.questions.length,
                            itemBuilder: (BuildContext context, int index) {
                              title = widget.questions[index]['title'];

                              return SummaryAnswerContainer(
                                surveyDoc: widget.surveyDoc,
                                answersList: offlineAnswers,
                                animateTo: widget.animateTo,
                                index: index,
                                question: title,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    offlineAnswers = [];
    String listName;
    listName = widget.surveyDoc.name;
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('$listName', []);
    setState(() {
      isSummary = false;
      isOnSummary = false;
      isFutureDone = false;
    });
    return Navigator.of(context).pop() ?? true;
  }
}

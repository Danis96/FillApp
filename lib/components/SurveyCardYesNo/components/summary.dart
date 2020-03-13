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
import 'package:fillproject/components/SurveyCardYesNo/components/appBar.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/summaryContainer.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/dashboard/survey.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Summary extends StatefulWidget {
  final List<dynamic> questions;
  final int totalSar, userLevel;
  final int totalProgress;
  final Function animateTo;
  final PasswordArguments arguments;
  Summary({
    this.totalSar,
    this.questions,
    this.totalProgress,
    this.animateTo,
    this.arguments,
    this.userLevel,
  });

  @override
  _SummaryState createState() => _SummaryState();
}

String title;

class _SummaryState extends State<Summary> {
  @override
  void initState() {
    super.initState();
    isOnSummary = true;
    Timer(Duration(seconds: 2), () {
      getUserAnswers();
    });
  }

  List<dynamic> answers = [];

  @override
  Widget build(BuildContext context) {
    Constant().responsive(context);
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
                  arguments: widget.arguments,
                  totalProgress: widget.totalProgress,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(25.0),
                      right: ScreenUtil.instance.setWidth(25.0)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            bottom: ScreenUtil.instance.setWidth(33.0)),
                        child: Center(
                          child: Text('Congratulation\nyou have got',
                              style: TextStyle(
                                color: MyColor().white,
                                fontWeight: FontWeight.w700,
                                fontFamily: "LoewNextArabic",
                                fontStyle: FontStyle.normal,
                                fontSize: ScreenUtil.instance.setSp(25.0),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: ScreenUtil.instance.setWidth(44.0)),
                        child: Center(
                          child: Text(widget.totalSar.toString() + '\nSAR',
                              style: TextStyle(
                                color: MyColor().white,
                                fontWeight: FontWeight.w700,
                                fontFamily: "LoewNextArabic",
                                fontStyle: FontStyle.normal,
                                fontSize: ScreenUtil.instance.setSp(35.0),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: ScreenUtil.instance.setWidth(15.0)),
                        child: Center(
                          child: Text('Summary',
                              style: TextStyle(
                                color: MyColor().white,
                                fontWeight: FontWeight.w700,
                                fontFamily: "LoewNextArabic",
                                fontStyle: FontStyle.normal,
                                fontSize: ScreenUtil.instance.setSp(25.0),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: widget.questions.length,
                          itemBuilder: (BuildContext context, int index) {
                            title = widget.questions[index]['title'];
                            return SummaryAnswerContainer(
                              animateTo: widget.animateTo,
                              index: index,
                              question: title,
                            );
                          }),
                    ],
                  ),
                ),
                futu(),
              ],
            )),
      ),
    );
  }

  getUserAnswers() {}

  Widget futu() {
    return Container(
      child: FutureBuilder(
        future: FirebaseCheck().getSurveyGroups(userLevel),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int indexx) {
                answers =
                    snapshot.data[indexx].data['list_of_username_answers'];
                // print(answers.toString());
                var userAnswers;
                var userAnswersSplitted;
                var usernameThatAnswers;
                print('u metodi sam');
                List<dynamic> answersList = [];
                for (var i = 0; i < answers.length; i++) {
                  userAnswers = answers[i].toString();
                  // print(userAnswers);
                  userAnswersSplitted = userAnswers.split(' : ');
                  // print(userAnswersSplitted);
                  usernameThatAnswers = userAnswersSplitted[2];
                  // print(usernameThatAnswers);
                  // /// usernameSecond treba

                  if (userAnswersSplitted[2] == widget.arguments.username) {
                    print('USAO SAM' + userAnswersSplitted[1]);
                    answersList.add(userAnswersSplitted[1]);
                    print(answersList.toString());
                  }
                }
                return EmptyContainer();
              },
            );
          }
          return EmptyContainer();
        },
      ),
    );
  }

  Future<bool> _onWillPop() async {
    isSummary = false;
    return Navigator.of(context).pop() ?? true;
  }
}

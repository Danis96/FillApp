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
import 'package:fillproject/models/Survey/usernameAnswerModel.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Summary extends StatefulWidget {
  final List<dynamic> questions, usernameAnswers;
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
    this.usernameAnswers,

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
  }

  List<dynamic> answers = [];
  List<dynamic> usernameAns = [];
  List<dynamic> answersList = [];
  int num = 0;

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
                Container(
                  child: FutureBuilder(
                    future: FirebaseCheck().getSurveyGroups(userLevel),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        answers = snapshot.data
                            .map((doc) => UsernameAnswers.fromDocument(doc))
                            .toList();

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: answers.length,
                          itemBuilder: (BuildContext context, int indexx) {
                            usernameAns = answers[indexx].usernameAnswers;

                            var userAnswers;
                            var userAnswersSplitted;
                            var usernameThatAnswers;

                              for (var i = 0; i < usernameAns.length; i++) {
                                userAnswers = usernameAns[i].toString();
                                userAnswersSplitted = userAnswers.split(' : ');
                                usernameThatAnswers = userAnswersSplitted[2];
                                // /// usernameSecond treba

                                if (userAnswersSplitted[2] ==
                                    widget.arguments.username) {
                                  answersList.add(userAnswersSplitted[1]);
                                  print('OVO SU ODGOVORI ' + answersList.toString());
                                }
                              }
                            

                            return EmptyContainer();
                          },
                        );
                      }
                      return EmptyContainer();
                    },
                  ),
                ),
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
                              answersList: answersList,
                              animateTo: widget.animateTo,
                              index: index,
                              question: title,
                            );
                          }),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    isSummary = false;
    return Navigator.of(context).pop() ?? true;
  }
}

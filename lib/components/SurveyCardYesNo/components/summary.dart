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
import 'package:fillproject/globals.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Summary extends StatefulWidget {
  final List<dynamic> questions;
  final int totalSar;
  final int totalProgress;
  final Function animateTo;
  final PasswordArguments arguments;
  Summary(
      {this.totalSar,
      this.questions,
      this.totalProgress,
      this.animateTo,
      this.arguments});

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
                )
              ],
            )),
      ),
    );
  }

  Future<bool> _onWillPop() async {
      isSummary = false;
    return  Navigator.of(context).pop() ?? true;
  }
}

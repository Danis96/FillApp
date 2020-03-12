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
import 'dart:io';
import 'package:fillproject/components/SurveyCardYesNo/components/appBar.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/summaryContainer.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Summary extends StatefulWidget {
  final List<dynamic> questions;
  final int totalSar;
  final int totalProgress;
  Summary({this.totalSar, this.questions, this.totalProgress});

  @override
  _SummaryState createState() => _SummaryState();
}

String title;

class _SummaryState extends State<Summary> {
  @override
  void initState() {
    super.initState();
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
                SurveyAppBar(percent: 1),
                Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(25.0),
                      right: ScreenUtil.instance.setWidth(25.0)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(12.0),
                            bottom: ScreenUtil.instance.setWidth(54.0)),
                        child: Center(
                          child: Text(widget.totalProgress.toString()+'/'+widget.totalProgress.toString(),
                              style: TextStyle(
                                  //color: isTapped ? MyColor().black : MyColor().white,
                                  color: MyColor().white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "LoewNextArabic",
                                  fontStyle: FontStyle.normal,
                                  fontSize: ScreenUtil.instance.setSp(20.0))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: ScreenUtil.instance.setWidth(33.0)),
                        child: Center(
                          child: Text('Congratulation\nyou have got',
                              style: TextStyle(
                                //color: isTapped ? MyColor().black : MyColor().white,
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
                                //color: isTapped ? MyColor().black : MyColor().white,
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
                          child: Text('Summery',
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
                          itemCount: widget.questions.length,
                          itemBuilder: (BuildContext context, int index) {
                            title = widget.questions[index]['title'];

                            return SummaryAnswerContainer(
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
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(MyText().willQuestion),
            content: new Text(MyText().willQuestion1),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(MyText().willNo),
              ),
              new FlatButton(
                onPressed: () => exit(0),
                child: new Text(MyText().willYes),
              ),
            ],
          ),
        ) ??
        true;
  }
}

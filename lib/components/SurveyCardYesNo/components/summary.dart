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
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

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
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setWidth(12.0),
                          bottom: ScreenUtil.instance.setWidth(54.0)),
                      child: Center(
                        child: Text('10/10',
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
                        child: Text('Congradulation\nyou have got',
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
                        child: Text('34\nSAR',
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
                          top: ScreenUtil.instance.setWidth(18.0)),
                      width: ScreenUtil.instance.setWidth(303.0),
                      height: ScreenUtil.instance.setWidth(58.0),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.0, color: MyColor().white),
                          borderRadius: BorderRadius.all(Radius.circular(29)),
                          color: MyColor().white),
                      child: RaisedButton(
                        //hoverColor: isTapped ? MyColor().white : MyColor().black,
                        //color: isTapped ? MyColor().white : MyColor().black,
                        hoverColor: MyColor().black,
                        color: MyColor().black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(28.0),
                        ),
                        child: Text('Q1: first question',
                            style: TextStyle(
                                //color: isTapped ? MyColor().black : MyColor().white,
                                color: MyColor().white,
                                fontWeight: FontWeight.w700,
                                fontFamily: "LoewNextArabic",
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0),
                            textAlign: TextAlign.left),
                        onPressed: () {},
                      ),
                    ),
                  ],
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

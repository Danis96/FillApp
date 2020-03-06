import 'package:fillproject/components/SurveyCardYesNo/myYesNoSurveyCard.dart';
import 'dart:io';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/customScroll.dart';
import 'package:fillproject/components/mySurveyGroupCard.dart';

/// Survey class
///
/// This class contains methods and layout for survey page.
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var controller = PageController(viewportFraction: 1 / 2, initialPage: 1);

class Survey extends StatefulWidget {
  Survey({Key key}) : super(key: key);

  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: WillPopScope(
      onWillPop: _onWillPop,
      child: Column(
        children: <Widget>[
          Center(
              child: Container(
            margin: EdgeInsets.only(
                top: ScreenUtil.instance.setWidth(45.0),
                bottom: ScreenUtil.instance.setWidth(15.0)),
            child: Text('Survey List',
                style: TextStyle(
                    color: MyColor().black,
                    fontWeight: FontWeight.w700,
                    fontFamily: "LoewNextArabic",
                    fontStyle: FontStyle.normal,
                    fontSize: ScreenUtil.instance.setSp(24.0))),
          )),
          Container(
            height: ScreenUtil.instance.setHeight(height),
            child: PageView(
                pageSnapping: true,
                controller: controller,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  MySurveyGroupCard(),
                  MySurveyGroupCard(),
                  MySurveyGroupCard(),
                  MySurveyGroupCard(),
                  MySurveyGroupCard(),
                  MySurveyGroupCard()
                ]),
          ),
        ],
      ),
    ));
  }

  /// [_onWillPop]
  ///
  /// async funstion that creates an exit dialog for our screen
  /// YES / NO
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

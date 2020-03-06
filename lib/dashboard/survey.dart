

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


  ScrollPhysics _physics;
  ScrollController _controller = new ScrollController();
  var dimension = 5.7809523809524;

class Survey extends StatefulWidget {
  Survey({Key key}) : super(key: key);

  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
            onWillPop: _onWillPop,
            child: ListView(
              controller: _controller,
              shrinkWrap: true,
              physics: _physics,
              scrollDirection: Axis.vertical,
              children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.instance.setWidth(35),
                      bottom: ScreenUtil.instance.setWidth(29)),
                  child: Text('Survey List',
                      style: TextStyle(
                          color: MyColor().black,
                          fontWeight: FontWeight.w700,
                          fontFamily: "LoewNextArabic",
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil.instance.setSp(24.0))),
                ),
              ),
              // PageView(
              //   scrollDirection: Axis.vertical,
              //   children: <Widget>[
                  MySurveyGroupCard(),
                  MySurveyGroupCard(),
                  MySurveyGroupCard(),
                  MySurveyGroupCard(),
                  MySurveyGroupCard(),
                  MySurveyGroupCard()
              //   ],
              // )
            ])));
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

  /// [addPhysicsListenerController]
  ///
  /// function that creates a listener for out scroll controller
  /// and checks for controller position
  /// then add physics that recieve dimension
  /// [dimension] =  361.7809523809524;
  addPhysicsListenerController() {
    _controller.addListener(() {
      if (_controller.position.haveDimensions && _physics == null) {
        setState(() {
          _physics = CustomScrollPhysics(
            itemDimension: ScreenUtil.instance.setWidth(dimension),
          );
          print(dimension);
        });
      }
    });
  }
}

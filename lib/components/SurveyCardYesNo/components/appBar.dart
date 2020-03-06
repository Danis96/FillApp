import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
 
 
class SurveyAppBar extends StatelessWidget {

  final double percent;
  SurveyAppBar({this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: new BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                /// top elements
                ///
                /// backbtn and indicator
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.instance.setWidth(60.0),
                      left: ScreenUtil.instance.setWidth(40.0)),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(60.0),
                        left: ScreenUtil.instance.setWidth(30.0)),
                    child: LinearPercentIndicator(
                      width: 170.0,
                      lineHeight: 6.0,
                      percent: percent,
                      progressColor: Colors.white,
                    )),
              ],
            ),
          );
  }
}
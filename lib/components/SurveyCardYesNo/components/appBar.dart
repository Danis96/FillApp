import 'package:fillproject/components/SurveyCardYesNo/components/summary.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../routes/routeArguments.dart';
import '../../../routes/routeConstants.dart';


class SurveyAppBar extends StatelessWidget {
  final PasswordArguments arguments;
  final double percent;
  final Function notifyParent, animateTo;
  final List<dynamic> questions;
  final int totalSar, totalProgress;

  SurveyAppBar(
      {this.arguments,
      this.percent,
      this.notifyParent,
      this.animateTo,
      this.totalProgress,
      this.questions,
      this.totalSar});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          color: Colors.black,
        ),
        child: ListTile(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                isOnSummary
                    ? Navigator.of(context).pushNamed(NavBar,
                        arguments: PasswordArguments(
                            email: arguments.email,
                            password: arguments.password,
                            phone: arguments.phone,
                            username: arguments.username))
                    : isSummary
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Summary(
                                  animateTo: animateTo,
                                  questions: questions,
                                  totalProgress: totalProgress,
                                  totalSar: totalSar,
                                )))
                        : showDialog(
                            context: context,
                            builder: (context) => new AlertDialog(
                              title: Text('Are you sure?'),
                              content: new Text(
                                  'Do you really want to exit the survey?'),
                              actions: <Widget>[
                                new FlatButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: new Text(MyText().registerNo),
                                ),
                                new FlatButton(
                                  onPressed: () => {
                                    notifyParent(),
                                    Navigator.of(context).pop(),
                                    Navigator.of(context).pop(),
                                  },
                                  child: new Text(MyText().willYes),
                                ),
                              ],
                            ),
                          );
              }),
          title: Container(
            margin: isOnSummary ? EdgeInsets.only(top: ScreenUtil.instance.setWidth(35.0)) : EdgeInsets.only(top: ScreenUtil.instance.setWidth(0.0)),
            padding: isOnSummary ? EdgeInsets.only(top: ScreenUtil.instance.setWidth(0.0)) : EdgeInsets.only(top: ScreenUtil.instance.setWidth(5.0)),
            child: LinearPercentIndicator(
              width: 170.0,
              lineHeight: 6.0,
              percent: percent,
              progressColor: Colors.white,
              alignment: MainAxisAlignment.center,
            ),
          ),
          subtitle: isOnSummary
              ? Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.instance.setWidth(12.0),
                      bottom: ScreenUtil.instance.setWidth(54.0)),
                  child: Center(
                    child: Text(
                        totalProgress.toString() +
                            '/' +
                            totalProgress.toString(),
                        style: TextStyle(
                            color: MyColor().white,
                            fontWeight: FontWeight.w700,
                            fontFamily: "LoewNextArabic",
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil.instance.setSp(20.0))),
                  ),
                )
              : null,
          trailing: Container(
            width: ScreenUtil.instance.setWidth(40.0),
          ),
        ),
        );
  }
}

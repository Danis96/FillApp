import 'package:fillproject/components/answerLabelContainer.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleMcqAnswer extends StatelessWidget {
  const SingleMcqAnswer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnswerLabel(),
        Container(
            width: ScreenUtil.instance.setWidth(350.0),
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
            child: ListTile(
                leading: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: MyColor().black),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: MyColor().black),
                  height: ScreenUtil.instance.setHeight(58.0),
                  width: ScreenUtil.instance.setWidth(58.0),
                  child: Text(MyText().indexA,
                      style: TextStyle(
                          color: MyColor().white,
                          fontWeight: FontWeight.w500,
                          fontFamily: arabic,
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil.instance.setSp(18.0))),
                ),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(answersFromSummary,
                      style: TextStyle(
                          color: MyColor().black,
                          fontWeight: FontWeight.w700,
                          fontFamily: arabic,
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil.instance.setSp(18.0))),
                ),
                onTap: () => null)),
      ],
    );
  }
}

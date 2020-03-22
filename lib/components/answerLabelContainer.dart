import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerLabel extends StatelessWidget {
  AnswerLabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
      child: Text(
        MyText().label,
        style: TextStyle(
            color: MyColor().black,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: arabic,
            fontSize: ScreenUtil.instance.setSp(18.0)),
      ),
    );
  }
}

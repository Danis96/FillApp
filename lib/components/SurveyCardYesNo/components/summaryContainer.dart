import 'package:fillproject/components/SurveyCardYesNo/components/summary.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryAnswerContainer extends StatelessWidget {
  
  final String question;
  final int index;
  SummaryAnswerContainer({this.question, this.index});

  int indexReal;

  @override
  Widget build(BuildContext context) {
    indexReal = index + 1;
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(18.0)),
      width: ScreenUtil.instance.setWidth(303.0),
      height: ScreenUtil.instance.setWidth(58.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: MyColor().white),
          borderRadius: BorderRadius.all(Radius.circular(29)),
          color: MyColor().white),
      child: RaisedButton(
        hoverColor: MyColor().black,
        color: MyColor().black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(28.0),
        ),
        child: Text('Q'+indexReal.toString()+": " +title,
            style: TextStyle(
                color: MyColor().white,
                fontWeight: FontWeight.w500,
                fontFamily: "LoewNextArabic",
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
            textAlign: TextAlign.left),
        onPressed: () {},
      ),
    );
  }
}

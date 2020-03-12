import 'package:fillproject/components/SurveyCardYesNo/components/summary.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryAnswerContainer extends StatefulWidget {
  final String question;
  final int index;
  final Function animateTo;
  SummaryAnswerContainer({this.question, this.index, this.animateTo});

  @override
  _SummaryAnswerContainerState createState() => _SummaryAnswerContainerState();
}

class _SummaryAnswerContainerState extends State<SummaryAnswerContainer> {
  int indexReal;

  @override
  Widget build(BuildContext context) {
    indexReal = widget.index + 1;
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
        child: Text('Q' + indexReal.toString() + ": " + title,
            style: TextStyle(
                color: MyColor().white,
                fontWeight: FontWeight.w500,
                fontFamily: "LoewNextArabic",
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
            textAlign: TextAlign.left),
        onPressed: () {
          setState(() {
            isSummary = true;
            isOnSummary = false;
          });
          Navigator.of(context).pop();
          widget.animateTo(widget.index);
        },
      ),
    );
  }
}

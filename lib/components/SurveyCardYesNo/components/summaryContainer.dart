import 'package:fillproject/components/SurveyCardYesNo/components/summary.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/models/Survey/surveyModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryAnswerContainer extends StatefulWidget {
  final String question;
  final int index;
  final Function animateTo;
  List<dynamic> answersList;
  final Survey surveyDoc;
  SummaryAnswerContainer(
      {this.question,
      this.index,
      this.animateTo,
      this.answersList,
      this.surveyDoc});

  @override
  _SummaryAnswerContainerState createState() => _SummaryAnswerContainerState();
}

class _SummaryAnswerContainerState extends State<SummaryAnswerContainer> {
  int indexReal;

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);
    indexReal = widget.index + 1;
    String question = 'Q' + indexReal.toString() + ": " + title;

    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
          alignment: Alignment.centerLeft,
          width: ScreenUtil.instance.setWidth(327.0),
          height: ScreenUtil.instance.setHeight(69.0),
          margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(18.0)),
          padding: EdgeInsets.only(
              left: ScreenUtil.instance.setWidth(20.0),
              right: ScreenUtil.instance.setWidth(20.0),
              top: ScreenUtil.instance.setWidth(10.0),
              bottom: ScreenUtil.instance.setWidth(10.0)),
          decoration: BoxDecoration(
            color: MyColor().black,
            borderRadius: BorderRadius.all(Radius.circular(33.5)),
            border: Border.all(
              width: 1.0,
              color: MyColor().white,
            ),
          ),
          child: Text(
            question,
            style: TextStyle(
              color: MyColor().white,
              fontWeight: FontWeight.w900,
              fontFamily: arabic,
              fontSize: ScreenUtil.instance.setSp(16.0),
            ),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )),
    );
  }

  onPressed() {
    answersFromSummary = widget.answersList[widget.index].toString();
    isSummary = true;
    isOnSummary = false;
    widget.animateTo(widget.index);
    Navigator.of(context).pop();
  }
}

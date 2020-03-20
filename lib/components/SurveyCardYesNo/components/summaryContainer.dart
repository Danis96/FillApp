import 'package:fillproject/components/SurveyCardYesNo/components/summary.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/models/Survey/surveyModel.dart';
import 'package:fillproject/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryAnswerContainer extends StatefulWidget {
  final String question;
  final int index;
  final Function animateTo;
  List<dynamic> answersList;
  final Survey surveyDoc;
  SummaryAnswerContainer({this.question, this.index, this.animateTo, this.answersList, this.surveyDoc});

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
    TextEditingController questionController =
        TextEditingController(text: 'Q' + indexReal.toString() + ": " + title,);
    return Container(
      color: MyColor().black,
      width: ScreenUtil.instance.setWidth(327.0),
      height: ScreenUtil.instance.setHeight(69.0),
      margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(18.0)),
      child: TextFormField(
         maxLength: 100,
         enableSuggestions: false,
        onTap: () => onPressed(),
        readOnly: true,
        style: TextStyle(
            color: MyColor().white,
            fontWeight: FontWeight.w900,
            fontFamily: "LoewNextArabic",
            fontSize: ScreenUtil.instance.setSp(14.5), 
            ),
        controller: questionController,
        decoration: InputDecoration(
           counterText: '',
          contentPadding:
              new EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(33.5)),
            borderSide: BorderSide(
              color: MyColor().white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(33.5)),
            borderSide: BorderSide(color: MyColor().white),
          ),
        ),
      ),
    );
  }

  onPressed() {
    //print(widget.answersList[widget.index]);
    answersFromSummary = widget.answersList[widget.index].toString();
    //answersFromSummary = answersFromSummaryString.split(', ');
    print(answersFromSummary);
    isSummary = true;
    isOnSummary = false;
    widget.animateTo(widget.index);
    Navigator.of(context).pop();
  }
}

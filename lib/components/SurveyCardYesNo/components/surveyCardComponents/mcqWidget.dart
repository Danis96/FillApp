import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/mcqComponents/MultipleMcqList.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/mcqComponents/listMcqChoicesThree.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/mcqComponents/multipleMcqAnswers.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/mcqComponents/previewSingleMcqAnswer.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/mcqComponents/singleMcqAnswer.dart';
import 'package:fillproject/components/answerLabelContainer.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class McqWidget extends StatelessWidget {
  final widget;
  final int index, isSingle;
  final Function refresh;
  McqWidget({Key key, this.widget, this.index, this.isSingle, this.refresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> choicesList = widget.snapQuestions[index]['choices'];
    int numberOfChoices = choicesList.length;
    if (numberOfChoices == 3) {
      return isSummary
          ? isSingle == 1
              ? PreviewSingleMcqAnswer()
              : Column(
                  children: <Widget>[
                    AnswerLabel(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(20.0),
                          right: ScreenUtil.instance.setWidth(20.0)),
                      child: MultipleMcqList(),
                    )
                  ],
                )
          : ListMcqChoicesThree(
              numberOfChoices: numberOfChoices,
              index: index,
              isSingle: isSingle,
              widget: widget,
              refresh: refresh);
    } else {
      return isSummary
          ? isSingle == 1
              ? SingleMcqAnswer()
              : Column(
                  children: <Widget>[
                    AnswerLabel(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(20.0),
                          right: ScreenUtil.instance.setWidth(20.0)),
                      child: MultipleMcqList(),
                    )
                  ],
                )
          : MultipleMcqAnswers(
              numberOfChoices: numberOfChoices,
              widget: widget,
              index: index,
              isSingle: isSingle,
              refresh: refresh);
    }
  }
}

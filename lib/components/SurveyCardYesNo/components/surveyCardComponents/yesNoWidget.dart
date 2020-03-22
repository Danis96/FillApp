import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/yesNoComponents/listYesNoChoices.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/yesNoComponents/previewYesNoAnswer.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';

class YesNoWidget extends StatelessWidget {
  final widget;
  final int index;
  final Function refresh;
  final String branching;
  final String branchingChoice;
  final Function isCompleted;
  final List<dynamic> answers;
  YesNoWidget(
      {Key key,
      this.widget,
      this.index,
      this.refresh,
      this.branching,
      this.branchingChoice,
      this.isCompleted,
      this.answers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSummary
        ? PreviewYesNoAnswer()
        : ListYesNoChoices(
            widget: widget,
            index: index,
            refresh: refresh,
            branching: branching,
            branchingChoice: branchingChoice,
            isCompleted: isCompleted,
            answers: answers);
  }
}

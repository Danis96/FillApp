import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/dateWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/imageWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/inputWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/mcqWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/orderWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/yesNoWidget.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:flutter/material.dart';

class ContainerTypes extends StatelessWidget {
  final widget;
  final int index, number, isSingle, numberOfQuestions;
  final Function refresh, isCompleted;
  final String type, branching, branchingChoice;
  var user;
  final List<dynamic> answers;
  ContainerTypes(
      {Key key,
      this.isCompleted,
      this.isSingle,
      this.numberOfQuestions,
      this.refresh,
      this.index,
      this.widget,
      this.answers,
      this.number,
      this.type,
      this.user,
      this.branchingChoice,
      this.branching})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'yesno':
        return YesNoWidget(
            widget: widget,
            index: index,
            refresh: refresh,
            branching: branching,
            branchingChoice: branchingChoice,
            isCompleted: isCompleted,
            answers: answers);
      case 'input':
        return InputWidget(
            widget: widget,
            index: index,
            refresh: refresh,
            numberOfQuestions: numberOfQuestions,
            number: number);
      case 'mcq':
        return McqWidget(
            widget: widget,
            index: index,
            refresh: refresh,
            isSingle: isSingle,
            numberOfQuestions: numberOfQuestions,
            number: number);
      case 'date':
        return DateWidget(
            widget: widget,
            index: index,
            refresh: refresh,
            numberOfQuestions: numberOfQuestions,
            number: number);
      case 'image':
        return ImageWidget(
            widget: widget, index: index, refresh: refresh, isSingle: isSingle, numberOfQuestions: numberOfQuestions,
            number: number);
      case 'order':
        return OrderWidget(
            widget: widget,
            index: index,
            refresh: refresh,
            numberOfQuestions: numberOfQuestions,
            number: number);
      default:
        return EmptyContainer();
    }
  }
}

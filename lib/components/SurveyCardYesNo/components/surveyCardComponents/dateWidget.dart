import 'package:fillproject/components/SurveyCardYesNo/components/dateSurveyChoice.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/dateComponents/dayDateField.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/dateComponents/monthDateField.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/dateComponents/yearDateField.dart';
import 'package:fillproject/components/answerLabelContainer.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final widget;
  final int index, numberOfQuestions, number;
  final Function refresh;
  DateWidget({Key key, this.widget, this.number, this.numberOfQuestions , this.index, this.refresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (widget.snapQuestions[index]['subtype']) {
      case 'all':
        return Column(
          children: <Widget>[
            isSummary ? AnswerLabel() : EmptyContainer(),
            DateChoice(
              number: number,
              numberOfQuestions: numberOfQuestions,
              day: '',
              month: '',
              year: '',
              notifyParent: refresh,
              username: widget.username,
              title: widget.snapQuestions[index]['title'],
              doc: widget.doc,
            ),
          ],
        );
      case 'day':
        return Column(
          children: <Widget>[
            isSummary ? AnswerLabel() : EmptyContainer(),
            DayDateField(
              number: number,
              numberOfQuestions: numberOfQuestions,
              day: '',
              notifyParent: refresh,
              username: widget.username,
              title: widget.snapQuestions[index]['title'],
              doc: widget.doc,
            ),
          ],
        );
      case 'month':
        return Column(
          children: <Widget>[
            isSummary ? AnswerLabel() : EmptyContainer(),
            MonthDateField(
              number: number,
              numberOfQuestions: numberOfQuestions,
              month: '',
              notifyParent: refresh,
              username: widget.username,
              title: widget.snapQuestions[index]['title'],
              doc: widget.doc,
            ),
          ],
        );
      case 'year':
        return Column(
          children: <Widget>[
            isSummary ? AnswerLabel() : EmptyContainer(),
            YearDateField(
              number: number,
              numberOfQuestions: numberOfQuestions,
              year: '',
              notifyParent: refresh,
              username: widget.username,
              title: widget.snapQuestions[index]['title'],
              doc: widget.doc,
            ),
          ],
        );
      default:
        return EmptyContainer();
    }
  }
}

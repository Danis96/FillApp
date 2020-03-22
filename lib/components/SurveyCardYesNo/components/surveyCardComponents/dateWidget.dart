import 'package:fillproject/components/SurveyCardYesNo/components/dateSurveyChoice.dart';
import 'package:fillproject/components/answerLabelContainer.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final widget;
  final int index;
  final Function refresh;
  DateWidget({Key key, this.widget, this.index, this.refresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        isSummary ? AnswerLabel() : EmptyContainer(),
        DateChoice(
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
  }
}

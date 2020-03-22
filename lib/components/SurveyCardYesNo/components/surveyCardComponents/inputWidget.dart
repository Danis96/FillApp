import 'package:fillproject/components/SurveyCardYesNo/components/inputSurveyChoice.dart';
import 'package:fillproject/components/answerLabelContainer.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final widget;
  final int index;
  final Function refresh;
  InputWidget({Key key, this.widget, this.index, this.refresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget>[
      isSummary ? AnswerLabel() : EmptyContainer(),
      InputChoice(
        notifyParent: refresh,
        username: widget.username,
        title: widget.snapQuestions[index]['title'],
        doc: widget.doc,
      ),
    ],
  );
  }
}
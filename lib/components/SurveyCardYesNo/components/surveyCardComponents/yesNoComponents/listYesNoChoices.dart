import 'package:fillproject/components/SurveyCardYesNo/components/yesNoSurveyChoices.dart';
import 'package:flutter/material.dart';

class ListYesNoChoices extends StatelessWidget {
  final widget;
  final int index;
  final Function refresh;
  final String branching;
  final String branchingChoice;
  final Function isCompleted;
  final List<dynamic> answers;
  ListYesNoChoices(
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
    return Column(
      children: <Widget>[
        SurveyChoices(
          complete: isCompleted,
          arguments: widget.arguments,
          branching: branching,
          branchingChoice: branchingChoice,
          choice1: widget.snapQuestions[index]['choices'][0]['text'],
          notifyParent: refresh,
          username: widget.username,
          title: widget.snapQuestions[index]['title'],
          doc: widget.doc,
        ),
        SurveyChoices(
          complete: isCompleted,
          arguments: widget.arguments,
          branching: branching,
          branchingChoice: branchingChoice,
          choice1: widget.snapQuestions[index]['choices'][1]['text'],
          notifyParent: refresh,
          username: widget.username,
          title: widget.snapQuestions[index]['title'],
          doc: widget.doc,
        ),
      ],
    );
  }
}

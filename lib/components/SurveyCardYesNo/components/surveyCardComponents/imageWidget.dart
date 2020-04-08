import 'package:fillproject/components/SurveyCardYesNo/components/imageChoice.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/imageComponents/multipleImagesList.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/imageComponents/previewSingleImageAnswer.dart';
import 'package:fillproject/components/answerLabelContainer.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final widget;
  final int index, isSingle, number, numberOfQuestions;
  final Function refresh;
  ImageWidget(
      {Key key,
      this.widget,
      this.index,
      this.isSingle,
      this.refresh,
      this.numberOfQuestions,
      this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSummary
        ? isSingle == 0
            ? PreviewSingleImageAnswer()
            : Column(
                children: <Widget>[AnswerLabel(), MultipleImagesList()],
              )
        : Column(
            children: <Widget>[
              ImageChoice(
                numberOfQuestions: numberOfQuestions,
                number: number,
                notifyParent: refresh,
                isSingle: isSingle,
                title: widget.snapQuestions[index]['title'],
                username: widget.username,
                choice1: widget.snapQuestions[index]['choices'][0]['text'],
                choice2: widget.snapQuestions[index]['choices'][1]['text'],
                choice3: widget.snapQuestions[index]['choices'][2]['text'],
                choice4: widget.snapQuestions[index]['choices'][3]['text'],
                text1: widget.snapQuestions[index]['choices'][0]['value'],
                text2: widget.snapQuestions[index]['choices'][1]['value'],
                text3: widget.snapQuestions[index]['choices'][2]['value'],
                text4: widget.snapQuestions[index]['choices'][3]['value'],
                doc: widget.doc,
              ),
            ],
          );
  }
}

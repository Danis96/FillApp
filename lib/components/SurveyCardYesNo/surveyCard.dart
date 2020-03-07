import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/appBar.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/dateSurveyChoice.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/inputSurveyChoice.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/multipleChoiceSurveyChoices.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/yesNoSurveyChoices.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/yesNoSurveySarQuestionProgress.dart';
import 'package:fillproject/dashboard/survey.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../emptyCont.dart';

String type;
int isSingle;

class SurveyCard extends StatefulWidget {
  final List<dynamic> snapQuestions;
  final int total;
  final String username;
  final DocumentSnapshot doc;
  final Function isCompleted;
  SurveyCard({this.snapQuestions, this.total, this.username, this.doc, this.isCompleted});

  @override
  _YesNoSurveyState createState() => _YesNoSurveyState();
}

class _YesNoSurveyState extends State<SurveyCard> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Container(
              height: ScreenUtil.instance.setHeight(800.0),
              child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  itemCount: widget.snapQuestions.length,
                  itemBuilder: (BuildContext context, int index) {
                    type = widget.snapQuestions[index]['type'];
                    if(type == 'mcq') {
                      isSingle = widget.snapQuestions[index]['is_single'];
                    }
                    return Column(
                      children: <Widget>[
                        SurveyAppBar(
                          percent: (index + 1.0) / widget.total,
                        ),
                        YesNoSurveySQP(
                          type: type,
                          answered: index + 1,
                          answeredFrom: widget.total,
                          sar: widget.snapQuestions[index]['sar'],
                          question: widget.snapQuestions[index]['title'],
                        ),
                        typeContainerAnwers(
                            widget, index, refresh, type),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  refresh() {
      questionNumber--;
    print(questionNumber);
    if (questionNumber == 0) {
      widget.isCompleted();
      print('NA PRVI');
      FirebaseCrud().updateListOfUsernamesThatGaveAnswersSurvey(
          widget.doc, context, widget.username);
      Navigator.of(context).pop();
    } else {
      _controller.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    }
  }


}

/// widget koji provjerava tip i na osnovu toga vraca odgovarajuci widget
///
Widget typeContainerAnwers(
  widget,
  int index,
  Function refresh,
  String type,

) {
  /// provjeriti tip
  switch (type) {
    case 'yesno':
      return yesnoWidget(widget, index, refresh, );
    case 'input':
      return inputWidget(widget, index, refresh);
    case 'mcq':
      return mcqWidget(widget, index, refresh, isSingle);
    case 'date':
      return dateWidget(widget, index, refresh);
    default:
      return EmptyContainer();
  }
}

/// yes no widget choices
Widget yesnoWidget(
  widget,
  int index,
  Function refresh,

) {
  return Column(
    children: <Widget>[
      SurveyChoices(
        choice1: widget.snapQuestions[index]['choices'][0]['text'],
        notifyParent: refresh,
        username: widget.username,
        title: widget.snapQuestions[index]['title'],
        doc: widget.doc,
      ),
      SurveyChoices(
        choice1: widget.snapQuestions[index]['choices'][1]['text'],
        notifyParent: refresh,
        username: widget.username,
        title: widget.snapQuestions[index]['title'],
        doc: widget.doc,
      ),
    ],
  );
}

/// mcq widget choices
Widget mcqWidget(widget, int index, Function refresh, int isSingle) {
  List<dynamic> choicesList = widget.snapQuestions[index]['choices'];
  int numberOfChoices = choicesList.length;
  if (numberOfChoices == 3) {
    return Column(
      children: <Widget>[
        MultipleChoiceSurveyChoices(
          length: numberOfChoices,
          isSingle: isSingle,
          index: 'A',
          choice1: widget.snapQuestions[index]['choices'][0]['text'],
          notifyParent: refresh,
          username: widget.username,
          title: widget.snapQuestions[index]['title'],
          doc: widget.doc,
        ),
        MultipleChoiceSurveyChoices(
          length: numberOfChoices,
          isSingle: isSingle,
          index: 'B',
          choice1: widget.snapQuestions[index]['choices'][1]['text'],
          notifyParent: refresh,
          username: widget.username,
          title: widget.snapQuestions[index]['title'],
          doc: widget.doc,
        ),
        MultipleChoiceSurveyChoices(
          length: numberOfChoices,
          isSingle: isSingle,
          index: 'C',
          choice1: widget.snapQuestions[index]['choices'][2]['text'],
          notifyParent: refresh,
          username: widget.username,
          title: widget.snapQuestions[index]['title'],
          doc: widget.doc,
        ),
      ],
    );
  } else {
    return Column(
      children: <Widget>[
        MultipleChoiceSurveyChoices(
          length: numberOfChoices,
          isSingle: isSingle,
          index: 'A',
          choice1: widget.snapQuestions[index]['choices'][0]['text'],
          notifyParent: refresh,
          username: widget.username,
          title: widget.snapQuestions[index]['title'],
          doc: widget.doc,
        ),
        MultipleChoiceSurveyChoices(
          length: numberOfChoices,
          isSingle: isSingle,
          index: 'B',
          choice1: widget.snapQuestions[index]['choices'][1]['text'],
          notifyParent: refresh,
          username: widget.username,
          title: widget.snapQuestions[index]['title'],
          doc: widget.doc,
        ),
        MultipleChoiceSurveyChoices(
          length: numberOfChoices,
          isSingle: isSingle,
          index: 'C',
          choice1: widget.snapQuestions[index]['choices'][2]['text'],
          notifyParent: refresh,
          username: widget.username,
          title: widget.snapQuestions[index]['title'],
          doc: widget.doc,
        ),
        MultipleChoiceSurveyChoices(
          length: numberOfChoices,
          isSingle: isSingle,
          index: 'D',
          choice1: widget.snapQuestions[index]['choices'][3]['text'],
          notifyParent: refresh,
          username: widget.username,
          title: widget.snapQuestions[index]['title'],
          doc: widget.doc,
        ),
      ],
    );
  }
}

/// input widget
Widget inputWidget(widget, int index, Function refresh) {
  return Column(
    children: <Widget>[
      InputChoice(
        notifyParent: refresh,
        username: widget.username,
        title: widget.snapQuestions[index]['title'],
        doc: widget.doc,
      ),
    ],
  );
}

/// input widget
Widget dateWidget(widget, int index, Function refresh) {
  return Column(
    children: <Widget>[
      DateChoice(
        notifyParent: refresh,
        username: widget.username,
        title: widget.snapQuestions[index]['title'],
        doc: widget.doc,
      ),
    ],
  );
}
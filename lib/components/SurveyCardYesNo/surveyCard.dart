import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/appBar.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/dateSurveyChoice.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/imageChoice.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/inputSurveyChoice.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/multipleChoiceSurveyChoices.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/summary.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/yesNoSurveyChoices.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/yesNoSurveySarQuestionProgress.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/pageRouteBuilderAnimation.dart';
import 'package:fillproject/dashboard/survey.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../emptyCont.dart';

String type;
int isSingle;
String branching, branchingChoice;
String img;

class SurveyCard extends StatefulWidget {
  final PasswordArguments arguments;
  final List<dynamic> snapQuestions, usernameAnswers;
  final int total, sarSurvey;
  int userSar;
  int number, userLevel;
  final String username;
  final DocumentSnapshot doc, userDoc;
  final Function isCompleted;
  final Function increaseAnswered;
  final Function notifyParent;
  final String summaryCtrl;
  var user;
  SurveyCard({
    this.arguments,
    this.snapQuestions,
    this.total,
    this.sarSurvey,
    this.username,
    this.doc,
    this.isCompleted,
    this.increaseAnswered,
    this.number,
    this.userDoc,
    this.userSar,
    this.user,
    this.notifyParent,
    this.summaryCtrl,
    this.userLevel,
    this.usernameAnswers,
  });

  @override
  _YesNoSurveyState createState() => _YesNoSurveyState();
}

class _YesNoSurveyState extends State<SurveyCard>
    with AutomaticKeepAliveClientMixin<SurveyCard> {
  bool isSar = false;
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _controller = PageController(keepPage: true, initialPage: widget.number);
  }

  List<dynamic> answers;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: GestureDetector(
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
                      if (type == 'mcq') {
                        isSingle = widget.snapQuestions[index]['is_single'];
                      }
                      if (type == 'image') {
                        isSingle = widget.snapQuestions[index]['is_single'];
                      }
                      branching = widget.snapQuestions[index]['is_branching'];
                      branchingChoice =
                          widget.snapQuestions[index]['choice_to_exit'];
                      return Column(
                        children: <Widget>[
                          SurveyAppBar(
                            arguments: widget.arguments,
                            percent: (index + 1.0) / widget.total,
                            notifyParent: widget.notifyParent,
                            questions: widget.snapQuestions,
                            totalSar: widget.sarSurvey,
                            totalProgress: widget.total,
                            animateTo: summaryAnimateToPpage,
                          ),
                          YesNoSurveySQP(
                            type: type,
                            answered: index + 1,
                            answeredFrom: widget.total,
                            sar: widget.snapQuestions[index]['sar'],
                            question: widget.snapQuestions[index]['title'],
                          ),
                          typeContainerAnwers(
                            widget,
                            index,
                            refresh,
                            type,
                            widget.number,
                            widget.user,
                            widget.isCompleted,
                            answers,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  refresh() {
    checkForInternet();
    widget.number++;
    widget.increaseAnswered();
    if (widget.number == snapQuestions.length) {
      Navigator.of(context).push(
        DanisAnimationTween(widget:
          Summary(
                  animateTo: summaryAnimateToPpage,
                  questions: widget.snapQuestions,
                  totalProgress: widget.total,
                  totalSar: widget.sarSurvey,
                )
        ),


        // MaterialPageRoute(
        //     builder: (_) => Summary(
        //           animateTo: summaryAnimateToPpage,
        //           questions: widget.snapQuestions,
        //           totalProgress: widget.total,
        //           totalSar: widget.sarSurvey,
        //         )),
      );

      widget.userSar = widget.userSar + widget.sarSurvey;
      saroviOffline = saroviOffline + widget.sarSurvey;
      if (isSar) {
        FirebaseCrud().updateUsersSars(widget.userDoc, context, saroviOffline);
      } else {
        FirebaseCrud().updateUsersSars(widget.userDoc, context, widget.userSar);
      }
      widget.isCompleted();
      FirebaseCrud().updateListOfUsernamesThatGaveAnswersSurvey(
          widget.doc, context, widget.username);
      print('PROSO SVE');
    } else {
      _controller.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
    }
  }

  /// [checkForInternet]
  ///
  /// function that checks for internet connection
  checkForInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isSar = false;
      }
    } on SocketException catch (_) {
      isSar = true;
    }
  }

  /// [_onWillPop]
  ///
  /// async funstion that creates an exit dialog for our screen
  /// YES / NO
  Future<bool> _onWillPop() async {
    return isSummary
        ? Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => Summary(
                  animateTo: summaryAnimateToPpage,
                  questions: widget.snapQuestions,
                  totalProgress: widget.total,
                  totalSar: widget.sarSurvey,
                )))
        : showDialog(
              context: context,
              builder: (context) => new AlertDialog(
                title: Text('Are you sure?'),
                content: new Text('Do you really want to exit the survey?'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text(MyText().willNo),
                  ),
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: new Text(MyText().willYes),
                  ),
                ],
              ),
            ) ??
            true;
  }

  summaryAnimateToPpage(int index) {
    _controller.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  bool get wantKeepAlive => true;
}

/// widget koji provjerava tip i na osnovu toga vraca odgovarajuci widget
///
Widget typeContainerAnwers(widget, int index, Function refresh, String type,
    int number, var user, Function isCompleted, List<dynamic> answers) {
  /// provjeriti tip
  switch (type) {
    case 'yesno':
      return yesnoWidget(widget, index, refresh, branching, branchingChoice,
          isCompleted, answers);
    case 'input':
      return inputWidget(
        widget,
        index,
        refresh,
      );
    case 'mcq':
      return mcqWidget(
        widget,
        index,
        refresh,
        isSingle,
      );
    case 'date':
      return dateWidget(
        widget,
        index,
        refresh,
      );
    case 'image':
      return imageWidget(
        widget,
        index,
        refresh,
        isSingle,
      );

    default:
      return EmptyContainer();
  }
}

/// yes no widget choices
Widget yesnoWidget(
  widget,
  int index,
  Function refresh,
  String branching,
  String branchingChoice,
  Function isCompleted,
  List<dynamic> answers,
) {
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

/// mcq widget choices
Widget mcqWidget(
  widget,
  int index,
  Function refresh,
  int isSingle,
) {
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
Widget inputWidget(
  widget,
  int index,
  Function refresh,
) {
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
Widget dateWidget(
  widget,
  int index,
  Function refresh,
) {
  return Column(
    children: <Widget>[
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

Widget imageWidget(
  widget,
  int index,
  Function refresh,
  int isSingle,
) {
  return Column(
    children: <Widget>[
      ImageChoice(
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

import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/appBar.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/dateSurveyChoice.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/imageChoice.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/inputSurveyChoice.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/multipleChoiceSurveyChoices.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/summary.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/dateWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/imageWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/inputWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/mcqWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/yesNoWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/yesNoSurveyChoices.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/yesNoSurveySarQuestionProgress.dart';
import 'package:fillproject/components/answerLabelContainer.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/pageRouteBuilderAnimation.dart';
import 'package:fillproject/dashboard/survey.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/models/Survey/surveyModel.dart';
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
  final String username, usernameSecond;
  final DocumentSnapshot doc, userDoc;
  final Function isCompleted;
  final Function increaseAnswered;
  final Function notifyParent;
  final String summaryCtrl;
  final Survey surveyDoc;
  var user;
  SurveyCard(
      {this.arguments,
      this.snapQuestions,
      this.total,
      this.sarSurvey,
      this.username,
      this.usernameSecond,
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
      this.surveyDoc});

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
        DanisAnimationTween(
            widget: Summary(
          usernameSecond: widget.usernameSecond,
          animateTo: summaryAnimateToPpage,
          questions: widget.snapQuestions,
          totalProgress: widget.total,
          totalSar: widget.sarSurvey,
          surveyDoc: widget.surveyDoc,
        )),
      );
      widget.userSar = widget.userSar + widget.sarSurvey;
      saroviOffline = saroviOffline + widget.sarSurvey;
      if (isSar) {
        FirebaseCrud().updateUsersSars(widget.userDoc, context, saroviOffline);
      } else {
        FirebaseCrud().updateUsersSars(widget.userDoc, context, widget.userSar);
      }
      widget.isCompleted();
      surveyGroupName = widget.surveyDoc.name;
      currentUsername = widget.arguments.username;
      FirebaseCrud().updateListOfUsernamesThatGaveAnswersSurvey(
          widget.doc, context, widget.username);
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
                  userLevel: widget.userLevel,
                  surveyDoc: widget.surveyDoc,
                  animateTo: summaryAnimateToPpage,
                  questions: widget.snapQuestions,
                  totalProgress: widget.total,
                  totalSar: widget.sarSurvey,
                )))
        : showDialog(
              context: context,
              builder: (context) => new AlertDialog(
                title: Text(MyText().areYouSure),
                content: new Text(MyText().askToExitSurvey),
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
      return InputWidget(widget: widget, index: index, refresh: refresh);
    case 'mcq':
      return McqWidget(
          widget: widget, index: index, refresh: refresh, isSingle: isSingle);
    case 'date':
      return DateWidget(widget: widget, index: index, refresh: refresh);
    case 'image':
      return ImageWidget(
          widget: widget, index: index, refresh: refresh, isSingle: isSingle);
    default:
      return EmptyContainer();
  }
}

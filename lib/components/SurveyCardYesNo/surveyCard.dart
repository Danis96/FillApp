import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/appBar.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/summary.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/containerTypes.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/yesNoSurveySarQuestionProgress.dart';
import 'package:fillproject/components/myAlertDialog.dart';
import 'package:fillproject/components/pageRouteBuilderAnimation.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/models/Survey/surveyModel.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  saveAnswersToLocalStorage() async {
    String listName;
    listName = widget.surveyDoc.name;
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('$listName', offlineAnswers);
    offlineAnswers = [];
  }

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
                    itemCount: widget.surveyDoc.questions.length,
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
                            arguments: PasswordArguments(
                              email: widget.arguments.email,
                              password: widget.arguments.password,
                              phone: widget.arguments.phone,
                              username: widget.arguments.username,
                            ),
                            percent: ((index + 1.0) /
                                    widget.surveyDoc.numberOfQuestions)
                                .toDouble(),
                            notifyParent: widget.notifyParent,
                            questions: widget.snapQuestions,
                            totalSar: widget.sarSurvey,
                            totalProgress: widget.surveyDoc.numberOfQuestions,
                            animateTo: summaryAnimateToPpage,
                            surveyDoc: widget.surveyDoc,
                          ),
                          YesNoSurveySQP(
                            type: type,
                            answered: index + 1,
                            answeredFrom: widget.surveyDoc.numberOfQuestions,
                            sar: widget.snapQuestions[index]['sar'],
                            question: widget.snapQuestions[index]['title'],
                          ),
                          ContainerTypes(
                              widget: widget,
                              numberOfQuestions:
                                  widget.surveyDoc.numberOfQuestions,
                              index: index,
                              refresh: refresh,
                              type: type,
                              number: widget.number,
                              user: widget.user,
                              isCompleted: widget.isCompleted,
                              answers: answers,
                              isSingle: isSingle,
                              branching: branching,
                              branchingChoice: branchingChoice),
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

    if (widget.number == widget.surveyDoc.numberOfQuestions) {
      Navigator.of(context).push(
        CardAnimationTween(
            widget: Summary(
           arguments: PasswordArguments(
            email: widget.arguments.email,
            password: widget.arguments.password,
            phone: widget.arguments.phone,
            username: widget.arguments.username,
          ),
          usernameSecond: widget.usernameSecond,
          animateTo: summaryAnimateToPpage,
          questions: widget.surveyDoc.questions,
          totalProgress: widget.surveyDoc.numberOfQuestions,
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
          duration: Duration(milliseconds: 350), curve: Curves.easeIn);
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
        ? () {
            clickedAnswer = '';
            Navigator.of(context).push(CardAnimationTween(
                widget: Summary(
                      arguments: PasswordArguments(
                        email: widget.arguments.email,
                        password: widget.arguments.password,
                        phone: widget.arguments.phone,
                        username: widget.arguments.username,
                      ),
                      userLevel: widget.userLevel,
                      surveyDoc: widget.surveyDoc,
                      animateTo: summaryAnimateToPpage,
                      questions: widget.snapQuestions,
                      totalProgress: widget.surveyDoc.numberOfQuestions,
                      totalSar: widget.sarSurvey,
                    )));
          }()
        : () {
            showDialog(
              context: context,
              builder: (context) => MyAlertDialog(
                  emptyAnswers: saveAnswersToLocalStorage,
                  notifyParent: widget.notifyParent,
                  title: AppLocalizations.of(context).translate('areYouSure'),
                  content: AppLocalizations.of(context)
                      .translate('doYouReallyWantToExitTheSurvey'),
                  yes: AppLocalizations.of(context).translate('yes'),
                  no: AppLocalizations.of(context).translate('no')),
            );
          }();
  }

  summaryAnimateToPpage(int index) {
    _controller.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  bool get wantKeepAlive => true;
}

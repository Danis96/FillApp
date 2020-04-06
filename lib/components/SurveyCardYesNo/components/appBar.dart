import 'package:fillproject/components/SurveyCardYesNo/components/summary.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/myAlertDialog.dart';
import 'package:fillproject/components/pageRouteBuilderAnimation.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/models/Survey/surveyModel.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurveyAppBar extends StatelessWidget {
  final PasswordArguments arguments;
  final double percent;
  final Function notifyParent, animateTo;
  final List<dynamic> questions;
  final int totalSar, totalProgress;
  final Survey surveyDoc;
  List<dynamic> answersList;

  SurveyAppBar(
      {this.arguments,
      this.percent,
      this.notifyParent,
      this.animateTo,
      this.totalProgress,
      this.questions,
      this.answersList,
      this.totalSar,
      this.surveyDoc});

  saveAnswersToLocalStorage() async {
    String listName;
    listName = surveyDoc.name;
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('$listName', offlineAnswers);
    offlineAnswers = [];
  }

  emptyListFromLocalStorage() async {
    String listName;
    listName = surveyDoc.name;
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('$listName', []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.black,
      ),
      child: ListTile(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              isOnSummary
                  ? () {
                      isSummary = false;
                      isOnSummary = false;
                      isFutureDone = false;
                      answersList.removeRange(0, answersList.length);
                      offlineAnswers = [];
                      emptyListFromLocalStorage();
                      Navigator.of(context).pushNamed(NavBar,
                          arguments: PasswordArguments(
                              email: arguments.email,
                              password: arguments.password,
                              phone: arguments.phone,
                              username: arguments.username));
                    }()
                  : isSummary
                      ? () {
                          clickedAnswer = '';
                          Navigator.of(context).push(CardAnimationTween(
                              widget: Summary(
                                    surveyDoc: surveyDoc,
                                    animateTo: animateTo,
                                    questions: questions,
                                    totalProgress: totalProgress,
                                    totalSar: totalSar,
                                    arguments: PasswordArguments(
                                        email: arguments.email,
                                        password: arguments.password,
                                        phone: arguments.phone,
                                        username: arguments.username),
                                  )));
                        }()
                      : () {
                          showDialog(
                            context: context,
                            builder: (context) => MyAlertDialog(
                              emptyAnswers: saveAnswersToLocalStorage,
                                title: AppLocalizations.of(context)
                                    .translate('areYouSure'),
                                content: AppLocalizations.of(context).translate(
                                    'doYouReallyWantToExitTheSurvey'),
                                no: AppLocalizations.of(context)
                                    .translate('no'),
                                yes: AppLocalizations.of(context)
                                    .translate('yes'),
                                notifyParent: notifyParent),
                          );
                        }();
            }),
        title: Container(
          margin: isOnSummary
              ? EdgeInsets.only(top: ScreenUtil.instance.setWidth(35.0))
              : EdgeInsets.only(top: ScreenUtil.instance.setWidth(0.0)),
          padding: isOnSummary
              ? EdgeInsets.only(top: ScreenUtil.instance.setWidth(0.0))
              : EdgeInsets.only(top: ScreenUtil.instance.setWidth(5.0)),
          child: LinearPercentIndicator(
            width: ScreenUtil.instance.setWidth(170.0),
            lineHeight: 6.0,
            percent: percent,
            progressColor: MyColor().white,
            alignment: MainAxisAlignment.center,
          ),
        ),
        subtitle: isOnSummary
            ? Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.instance.setWidth(12.0),
                    bottom: ScreenUtil.instance.setWidth(30.0)),
                child: Center(
                  child: Text(
                      totalProgress.toString() + '/' + totalProgress.toString(),
                      style: TextStyle(
                          color: MyColor().white,
                          fontWeight: FontWeight.w700,
                          fontFamily: arabic,
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil.instance.setSp(20.0))),
                ),
              )
            : null,
        trailing: Container(
          width: ScreenUtil.instance.setWidth(40.0),
        ),
      ),
    );
  }
}

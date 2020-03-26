import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/submitButton.dart';
import 'package:fillproject/components/SurveyCardYesNo/surveyCard.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/dashboard/survey.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool tap = true;

class MultipleChoiceSurveyChoices extends StatefulWidget {
  final String choice1, username;
  final Function notifyParent;
  final String title;
  final DocumentSnapshot doc;
  final String index;
  final int isSingle, length;
  MultipleChoiceSurveyChoices(
      {this.choice1,
      this.notifyParent,
      this.username,
      this.title,
      this.doc,
      this.index,
      this.isSingle,
      this.length});

  @override
  _MultipleChoiceSurveyChoices createState() => _MultipleChoiceSurveyChoices();
}

List<dynamic> multipleAnswers = [];

class _MultipleChoiceSurveyChoices extends State<MultipleChoiceSurveyChoices> {
  int btnCounter;

  @override
  void initState() {
    super.initState();
    isTappedMCQ1 = false;
    isTappedMCQ2 = false;
    isTappedMCQ3 = false;
    isTappedMCQ4 = false;
    btnCounter = 0;
  }

  @override
  Widget build(BuildContext context) {
    String index = widget.index;
    return Column(
      children: <Widget>[
        Container(
            key: ValueKey(widget.choice1),
            width: ScreenUtil.instance.setWidth(350.0),
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
            child: ListTile(
                leading: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: MyColor().black),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: index == MyText().indexA
                          ? isTappedMCQ1 ? MyColor().white : MyColor().black
                          : index == MyText().indexB
                              ? isTappedMCQ2 ? MyColor().white : MyColor().black
                              : index == MyText().indexC
                                  ? isTappedMCQ3
                                      ? MyColor().white
                                      : MyColor().black
                                  : index == MyText().indexD
                                      ? isTappedMCQ4
                                          ? MyColor().white
                                          : MyColor().black
                                      : null),
                  height: ScreenUtil.instance.setHeight(58.0),
                  width: ScreenUtil.instance.setWidth(58.0),
                  child: Text(widget.index,
                      style: TextStyle(
                          color: index == MyText().indexA
                              ? isTappedMCQ1 ? MyColor().black : MyColor().white
                              : index == MyText().indexB
                                  ? isTappedMCQ2
                                      ? MyColor().black
                                      : MyColor().white
                                  : index == MyText().indexC
                                      ? isTappedMCQ3
                                          ? MyColor().black
                                          : MyColor().white
                                      : index == MyText().indexD
                                          ? isTappedMCQ4
                                              ? MyColor().black
                                              : MyColor().white
                                          : null,
                          fontWeight: FontWeight.w500,
                          fontFamily: arabic,
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil.instance.setSp(18.0))),
                ),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.choice1,
                      style: TextStyle(
                          color: MyColor().black,
                          fontWeight: FontWeight.w700,
                          fontFamily: arabic,
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil.instance.setSp(18.0))),
                ),
                onTap: () => isSummary
                    ? null
                    : {
                        if (isSingle == 1)
                          {
                            onSwitchSingle(),
                          }
                        else if (isSingle == 0)
                          {
                            onSwitchMultiple(),
                          }
                        else
                          null
                      })),
        isSummary
            ? EmptyContainer()
            : widget.isSingle == 1
                ? EmptyContainer()
                : widget.length == 3 && widget.index == MyText().indexC
                    ? Container(
                      margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
                      child: SubmitButton(onPressedFunction: submit, isImage: true))
                    : widget.length == 4 && widget.index == MyText().indexD
                        ? Container(
                          margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
                          child: SubmitButton(onPressedFunction: submit, isImage: true))
                        : EmptyContainer()
      ],
    );
  }

  onSwitchSingle() {
    switch (widget.index) {
      case 'A':
        return onTapSingle1();
        break;
      case 'B':
        return onTapSingle2();

        break;
      case 'C':
        return onTapSingle3();

        break;
      case 'D':
        return onTapSingle4();

        break;
      default:
        return null;
    }
  }

  onSwitchMultiple() {
    switch (widget.index) {
      case 'A':
        return saveMultiple1(widget.choice1);
        break;
      case 'B':
        return saveMultiple2(widget.choice1);

        break;
      case 'C':
        return saveMultiple3(widget.choice1);

        break;
      case 'D':
        return saveMultiple4(widget.choice1);

        break;
      default:
        return null;
    }
  }

  submit() {
    onPressed(multipleAnswers.toString());
  }

  onTapSingle1() {
    if (counterSurvey == 0) {
      setState(() {
        isTappedMCQ1 = true;
      });
      counterSurvey = 1;
      Timer(Duration(milliseconds: 200), () {
        saveMCQ1();
      });
      Timer(Duration(milliseconds: 600), () {
        counterSurvey = 0;
      });
    }
  }

  saveMCQ1() {
    setState(() {
      isSingle == 1 ? isTappedMCQ1 = false : isTappedMCQ1 = true;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.choice1, widget.title);

    widget.notifyParent();
  }

  onTapSingle2() {
     if (counterSurvey == 0) {
      setState(() {
        isTappedMCQ2 = true;
      });
      counterSurvey = 1;
      Timer(Duration(milliseconds: 200), () {
        saveMCQ2();
      });
      Timer(Duration(milliseconds: 600), () {
        counterSurvey = 0;
      });
    }
  }

  saveMCQ2() {
    setState(() {
      isSingle == 1 ? isTappedMCQ2 = false : isTappedMCQ2 = true;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.choice1, widget.title);

    widget.notifyParent();
  }

  onTapSingle3() {
     if (counterSurvey == 0) {
      setState(() {
        isTappedMCQ3 = true;
      });
      counterSurvey = 1;
      Timer(Duration(milliseconds: 200), () {
        saveMCQ3();
      });
      Timer(Duration(milliseconds: 600), () {
        counterSurvey = 0;
      });
    }
  }

  saveMCQ3() {
    setState(() {
      isSingle == 1 ? isTappedMCQ3 = false : isTappedMCQ3 = true;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.choice1, widget.title);

    widget.notifyParent();
  }

  onTapSingle4() {
     if (counterSurvey == 0) {
      setState(() {
        isTappedMCQ4 = true;
      });
      counterSurvey = 1;
      Timer(Duration(milliseconds: 200), () {
        saveMCQ4();
      });
      Timer(Duration(milliseconds: 600), () {
        counterSurvey = 0;
      });
    }
  }

  saveMCQ4() {
    setState(() {
      isSingle == 1 ? isTappedMCQ4 = false : isTappedMCQ4 = true;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.choice1, widget.title);

    widget.notifyParent();
  }

  saveMultiple1(String choice) {
    setState(() {
      isTappedMCQ1 = true;
    });
    if (!multipleAnswers.contains(choice)) {
      multipleAnswers.add(choice);
    }
  }

  saveMultiple2(String choice) {
    setState(() {
      isTappedMCQ2 = true;
    });
    if (!multipleAnswers.contains(choice)) {
      multipleAnswers.add(choice);
    }
  }

  saveMultiple3(String choice) {
    setState(() {
      isTappedMCQ3 = true;
    });
    if (!multipleAnswers.contains(choice)) {
      multipleAnswers.add(choice);
    }
  }

  saveMultiple4(String choice) {
    setState(() {
      isTappedMCQ4 = true;
    });
    if (!multipleAnswers.contains(choice)) {
      multipleAnswers.add(choice);
    }
  }

  onPressed(String answer) {
    setState(() {
      isTappedMCQ = false;
    });
    if (answer != '' && answer != '[]') {
      FirebaseCrud().updateListOfUsernamesAnswersSurvey(
          widget.doc, context, widget.username, answer, widget.title);
      widget.notifyParent();
      multipleAnswers.removeRange(0, multipleAnswers.length);
    }
  }
}

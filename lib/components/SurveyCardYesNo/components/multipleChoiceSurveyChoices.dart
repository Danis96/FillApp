import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/surveyCard.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool tap = true;

class MultipleChoiceSurveyChoices extends StatefulWidget {
  final String choice1, username;
  final Function() notifyParent;
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
  @override
  void initState() {
    super.initState();
    isTappedMCQ1 = false;
    isTappedMCQ2 = false;
    isTappedMCQ3 = false;
    isTappedMCQ4 = false;
  }

  @override
  Widget build(BuildContext context) {
    String index = widget.index;
    return Column(
      children: <Widget>[
        Container(
            width: ScreenUtil.instance.setWidth(350.0),
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
            child: ListTile(
                leading: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: MyColor().black),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      //color: isTappedMCQ1 || isTappedMCQ2 || isTappedMCQ3 || isTappedMCQ4 ? MyColor().white : MyColor().black),
                      color: index == 'A'
                          ? isTappedMCQ1 ? MyColor().white : MyColor().black
                          : index == 'B'
                              ? isTappedMCQ2 ? MyColor().white : MyColor().black
                              : index == 'C'
                                  ? isTappedMCQ3
                                      ? MyColor().white
                                      : MyColor().black
                                  : index == 'D'
                                      ? isTappedMCQ4
                                          ? MyColor().white
                                          : MyColor().black
                                      : null),
                  height: ScreenUtil.instance.setHeight(58.0),
                  width: ScreenUtil.instance.setWidth(58.0),
                  child: Text(widget.index,
                      style: TextStyle(
                          color: index == 'A'
                          ? isTappedMCQ1 ? MyColor().black : MyColor().white
                          : index == 'B'
                              ? isTappedMCQ2 ?  MyColor().black : MyColor().white
                              : index == 'C'
                                  ? isTappedMCQ3
                                      ? MyColor().black : MyColor().white
                                  : index == 'D'
                                      ? isTappedMCQ4
                                          ? MyColor().black : MyColor().white
                                      : null,
                          fontWeight: FontWeight.w500,
                          fontFamily: "LoewNextArabic",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0)),
                ),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.choice1,
                      style: TextStyle(
                          color: MyColor().black,
                          fontWeight: FontWeight.w700,
                          fontFamily: "LoewNextArabic",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0)),
                ),
                onTap: () => isSummary
                    ? null
                    :
                    {
                        if (isSingle == 1)
                          {
                            onSwitchSingle(),
                          }
                        else
                          {
                            onSwitchMultiple(),
                          }
                      }
                )),
        isSummary
            ? EmptyContainer()
            : widget.isSingle == 1
                ? EmptyContainer()
                : widget.length == 3 && widget.index == 'C'
                    ? Container(
                        width: ScreenUtil.instance.setWidth(316.0),
                        height: ScreenUtil.instance.setHeight(55.0),
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(20.0),
                            left: ScreenUtil.instance.setWidth(54.0),
                            right: ScreenUtil.instance.setWidth(55.0)),
                        child: RaisedButton(
                          color: MyColor().black,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(33.5),
                          ),
                          onPressed: () => submit(),
                          child: Text(MyText().btnSubmit,
                              style: TextStyle(
                                  fontSize: 18, color: MyColor().white)),
                        ))
                    : widget.length == 4 && widget.index == 'D'
                        ? Container(
                            width: ScreenUtil.instance.setWidth(316.0),
                            height: ScreenUtil.instance.setHeight(55.0),
                            margin: EdgeInsets.only(
                                top: ScreenUtil.instance.setWidth(20.0),
                                left: ScreenUtil.instance.setWidth(54.0),
                                right: ScreenUtil.instance.setWidth(55.0)),
                            child: RaisedButton(
                              color: MyColor().black,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(33.5),
                              ),
                              onPressed: () => submit(),
                              child: Text(MyText().btnSubmit,
                                  style: TextStyle(
                                      fontSize: 18, color: MyColor().white)),
                            ))
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
        return print('');
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
        return print('');
    }
  }

  submit() {
    onPressed(multipleAnswers.toString());
  }

  ////
  onTapSingle1() {
    setState(() {
      isTappedMCQ1 = true;
    });
    Timer(Duration(milliseconds: 200), () {
      saveMCQ1();
    });
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
    setState(() {
      isTappedMCQ2 = true;
    });
    Timer(Duration(milliseconds: 200), () {
      saveMCQ2();
    });
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
    setState(() {
      isTappedMCQ3 = true;
    });
    Timer(Duration(milliseconds: 200), () {
      saveMCQ3();
    });
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
    setState(() {
      isTappedMCQ4 = true;
    });
    Timer(Duration(milliseconds: 200), () {
      saveMCQ4();
    });
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



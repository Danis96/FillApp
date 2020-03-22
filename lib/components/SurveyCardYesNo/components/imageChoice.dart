import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/imageComponents/singleImageContainer.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/submitButton.dart';
import 'package:fillproject/components/SurveyCardYesNo/surveyCard.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageChoice extends StatefulWidget {
  final String username, title;
  final Function() notifyParent;
  final DocumentSnapshot doc;
  final int isSingle;
  final String choice1, choice2, choice3, choice4, text1, text2, text3, text4;
  ImageChoice({
    this.doc,
    this.isSingle,
    this.title,
    this.notifyParent,
    this.username,
    this.choice1,
    this.choice2,
    this.choice3,
    this.choice4,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
  });

  List<dynamic> multipleChoices = [];

  @override
  _ImageChoiceState createState() => _ImageChoiceState();
}

class _ImageChoiceState extends State<ImageChoice> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    isTapped1 = false;
    isTapped2 = false;
    isTapped3 = false;
    isTapped4 = false;
    Timer(Duration(milliseconds: 800), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(widget.title),
      margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(15.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SingleImageContainer(
                    isTappedSpec: isTapped1,
                    isSingle: isSingle,
                    onTapSingle: onTapSingle,
                    saveMultiple1: saveMultiple1,
                    text: widget.text1,
                    choice: widget.choice1),
                SingleImageContainer(
                    isTappedSpec: isTapped2,
                    isSingle: isSingle,
                    onTapSingle: onTapSingle1,
                    saveMultiple1: saveMultiple2,
                    text: widget.text2,
                    choice: widget.choice2),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SingleImageContainer(
                    isTappedSpec: isTapped3,
                    isSingle: isSingle,
                    onTapSingle: onTapSingle2,
                    saveMultiple1: saveMultiple3,
                    text: widget.text3,
                    choice: widget.choice3),
                SingleImageContainer(
                    isTappedSpec: isTapped4,
                    isSingle: isSingle,
                    onTapSingle: onTapSingle3,
                    saveMultiple1: saveMultiple4,
                    text: widget.text4,
                    choice: widget.choice4),
              ],
            ),
          ),
          isSummary
              ? EmptyContainer()
              : widget.isSingle == 0
                  ? EmptyContainer()
                  : SubmitButton(onPressedFunction: multipleSubmit)
        ],
      ),
    );
  }

  onTapSingle() {
    setState(() {
      isTapped1 = true;
    });
    Timer(Duration(milliseconds: 200), () {
      saveImage1();
    });
  }

  onTapSingle1() {
    setState(() {
      isTapped2 = true;
    });
    Timer(Duration(milliseconds: 200), () {
      saveImage2();
    });
  }

  onTapSingle2() {
    setState(() {
      isTapped3 = true;
    });
    Timer(Duration(milliseconds: 200), () {
      saveImage3();
    });
  }

  onTapSingle3() {
    setState(() {
      isTapped4 = true;
    });
    Timer(Duration(milliseconds: 200), () {
      saveImage4();
    });
  }

  multipleSubmit() {
    onPressed(widget.multipleChoices.toString());
  }

  saveMultiple1(String choice) {
    setState(() {
      isTapped1 = true;
    });
    if (!widget.multipleChoices.contains(choice)) {
      widget.multipleChoices.add(choice);
      print(widget.multipleChoices);
    }
  }

  saveMultiple2(String choice) {
    setState(() {
      isTapped2 = true;
    });
    if (!widget.multipleChoices.contains(choice)) {
      widget.multipleChoices.add(choice);
      print(widget.multipleChoices);
    }
  }

  saveMultiple3(String choice) {
    setState(() {
      isTapped3 = true;
    });
    if (!widget.multipleChoices.contains(choice)) {
      widget.multipleChoices.add(choice);
      print(widget.multipleChoices);
    }
  }

  saveMultiple4(String choice) {
    setState(() {
      isTapped4 = true;
    });
    if (!widget.multipleChoices.contains(choice)) {
      widget.multipleChoices.add(choice);
      print(widget.multipleChoices);
    }
  }

  onPressed(String answer) {
    setState(() {
      isTapped = false;
    });
    if (answer != '' && answer != '[]') {
      FirebaseCrud().updateListOfUsernamesAnswersSurvey(
          widget.doc, context, widget.username, answer, widget.title);
      widget.notifyParent();
      widget.multipleChoices.removeRange(0, widget.multipleChoices.length);
    }
  }

  saveImage1() {
    setState(() {
      isSingle == 0 ? isTapped1 = false : isTapped1 = true;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.text1, widget.title);
    widget.notifyParent();
  }

  saveImage2() {
    setState(() {
      isSingle == 0 ? isTapped2 = false : isTapped2 = true;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.text2, widget.title);

    widget.notifyParent();
  }

  saveImage3() {
    setState(() {
      isSingle == 0 ? isTapped3 = false : isTapped3 = true;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.text3, widget.title);

    widget.notifyParent();
  }

  saveImage4() {
    setState(() {
      isSingle == 0 ? isTapped4 = false : isTapped4 = true;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.text4, widget.title);

    widget.notifyParent();
  }
}
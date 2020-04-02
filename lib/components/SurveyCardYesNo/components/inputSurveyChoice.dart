import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/inputComponents/inputField.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/submitButton.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String userAnswer;
bool fieldColor = false;
int total;

class InputChoice extends StatefulWidget {
  final String username;
  final Function notifyParent;
  final DocumentSnapshot doc;
  final String title;
  final int number, numberOfQuestions;
  InputChoice({
    this.doc,
    this.number,
    this.numberOfQuestions,
    this.notifyParent,
    this.username,
    this.title,
  });

  @override
  _InputChoiceState createState() => _InputChoiceState();
}

class _InputChoiceState extends State<InputChoice> {
  TextEditingController answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey(widget.title),
      children: <Widget>[
        InputField(fieldColor: fieldColor, answerController: answerController),
        Container(
          margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(3.0)),
          child: fieldColor
              ? Text(
                  AppLocalizations.of(context)
                      .translate('thisFiledCantBeEmpty'),
                  style: TextStyle(color: MyColor().error, fontSize: ScreenUtil.instance.setSp(17.0)),
                )
              : Text(''),
        ),
        isSummary
            ? EmptyContainer()
            : SubmitButton(
                onPressedFunction: onPressed,
                isImage: false,
                text: (widget.number + 1) == widget.numberOfQuestions
                    ? AppLocalizations.of(context).translate('submitLast')
                    : AppLocalizations.of(context).translate('submit')),
      ],
    );
  }

  onPressed(BuildContext context) {
    userAnswer = answerController.text;
    if (userAnswer.length == 0) {
      setState(() {
        fieldColor = true;
      });
      Timer(Duration(seconds: 3), () {
        setState(() {
          fieldColor = false;
        });
      });
    } else {
      setState(() {
        fieldColor = false;
      });
      FirebaseCrud().updateListOfUsernamesAnswersSurvey(
          widget.doc, context, widget.username, userAnswer, widget.title);
      FocusScope.of(context).requestFocus(new FocusNode());
      widget.notifyParent();
    }
  }
}

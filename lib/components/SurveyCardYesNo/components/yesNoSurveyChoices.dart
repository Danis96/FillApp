import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../firebaseMethods/firebaseCrud.dart';

class SurveyChoices extends StatefulWidget {
  final PasswordArguments arguments;
  final String choice1, username, branching, branchingChoice;
  final Function() notifyParent, complete;
  final String title;
  final DocumentSnapshot doc;

  SurveyChoices({
    this.arguments,
    this.branching,
    this.branchingChoice,
    this.choice1,
    this.notifyParent,
    this.complete,
    this.username,
    this.title,
    this.doc,
  });

  @override
  _YesNoSurveyChoicesState createState() => _YesNoSurveyChoicesState();
}

class _YesNoSurveyChoicesState extends State<SurveyChoices> {
  @override
  void initState() {
    super.initState();
    isTapped = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              Container(
                key: ValueKey(widget.title),
                margin:
                    EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0)),
                width: ScreenUtil.instance.setWidth(303.0),
                height: ScreenUtil.instance.setWidth(58.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(29)),
                    color: MyColor().white),
                child: RaisedButton(
                    hoverColor: isTapped ? MyColor().white : MyColor().black,
                    color: isTapped ? MyColor().white : MyColor().black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(28.0),
                    ),
                    child: Text(widget.choice1,
                        style: TextStyle(
                            color: isTapped ? MyColor().black : MyColor().white,
                            fontWeight: FontWeight.w700,
                            fontFamily: arabic,
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil.instance.setSp(18.0)),
                        textAlign: TextAlign.center),
                    onPressed: () => isSummary
                        ? null
                        : {
                            setState(() {
                              isTapped = true;
                            }),
                            Timer(Duration(milliseconds: 200), () {
                              onPressed();
                            }),
                          }),
              ),
            ],
          );
  }

  onPressed() {
    setState(() {
      isTapped = false;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.choice1, widget.title);

    if (widget.branching == 'yes') {
      if (widget.choice1.toLowerCase() == widget.branchingChoice) {
        FirebaseCrud().updateListOfUsernamesThatGaveAnswersSurvey(
            widget.doc, context, widget.username);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(MyText().branching1),
              content: Text(MyText().branching2),
              actions: [
                FlatButton(
                  child: Text(MyText().branchingOK),
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    Navigator.of(context).pop(),
                    widget.complete()
                  },
                )
              ],
            );
          },
        );
      } else {
        widget.notifyParent();
      }
    } else {
      widget.notifyParent();
    }
  }
}

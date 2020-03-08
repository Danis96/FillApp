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
  _MultipleChoiceSurveyChoices createState() =>
      _MultipleChoiceSurveyChoices();
}

List<dynamic> multipleAnswers = [];

class _MultipleChoiceSurveyChoices
    extends State<MultipleChoiceSurveyChoices> {
  @override
  Widget build(BuildContext context) {
    print(widget.isSingle.toString() + ' ' + widget.length.toString() + ' ');
    return Column(
      children: <Widget>[
        Container(
          width: ScreenUtil.instance.setWidth(300),
          margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
          child: ListTile(
              leading: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: MyColor().black),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: isTapped ? MyColor().white : MyColor().black),
                height: ScreenUtil.instance.setHeight(58.0),
                width: ScreenUtil.instance.setWidth(58.0),
                child: Text(widget.index,
                    style: TextStyle(
                        color: isTapped ? MyColor().black : MyColor().white,
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
                        fontSize: 20.0),
                    textAlign: TextAlign.center),
              ),
              onTap: () {
                if(isSingle == 1) {
                  singleOnTap();
                } else {
                  singleOnTap2();
                }
              },
          )
        ),
        widget.isSingle == 1 ? EmptyContainer() : widget.length == 3 && widget.index == 'C'
         ?
        Container(
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
          child: Text(MyText().btnSubmit, style: TextStyle(fontSize: 18, color: MyColor().white)),
        ))  
        :
         widget.length == 4 && widget.index == 'D' ? Container(
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
          child: Text(MyText().btnSubmit, style: TextStyle(fontSize: 18, color: MyColor().white)),
        )) : EmptyContainer()
      ],
    );
  }

  submit() {
    onPressed(multipleAnswers.toString());
  }

  singleOnTap() {
    setState(() {
      isTapped = true;
    });
    Timer(Duration(milliseconds: 200), () {
      onPressed(widget.choice1);
    });
  }

  singleOnTap2() {
    setState(() {
      isTapped = true;
    });
    Timer(Duration(milliseconds: 200), () {
      onPressed2();
    });
  }

  onPressed(String answer) {
    setState(() {
      isTapped = false;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, answer, widget.title);
    widget.notifyParent();
    multipleAnswers.removeRange(0, multipleAnswers.length);
  }

  onPressed2() {
    multipleAnswers.add(widget.choice1);
    print(multipleAnswers);
  }
}

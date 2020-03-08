import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageChoice extends StatefulWidget {
  final String username, title;
  final Function() notifyParent;
  final DocumentSnapshot doc;
  final String choice1, choice2, choice3, choice4, text1, text2, text3, text4;
  ImageChoice(
      {this.doc,
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
      this.text4});

  @override
  _ImageChoiceState createState() => _ImageChoiceState();
}

class _ImageChoiceState extends State<ImageChoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(80.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(30.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isTapped1 = true;
                    });
                    Timer(Duration(milliseconds: 200), () {
                      saveImage1();
                    });
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: MyColor().black, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        width: ScreenUtil.instance.setWidth(145.0),
                        height: ScreenUtil.instance.setWidth(145.0),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.transparent, width: 5.0),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                        ),
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(10.0)),
                        width: ScreenUtil.instance.setWidth(140.0),
                        child: Image.network(
                          widget.choice1,
                          height: ScreenUtil.instance.setHeight(90.0),
                          alignment: Alignment.center,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: isTapped1 ? MyColor().white : MyColor().black,
                          border:
                              Border.all(color: MyColor().black, width: 1.0),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)),
                        ),
                        height: 31.0,
                        width: ScreenUtil.instance.setWidth(141.5),
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(113.0),
                            left: ScreenUtil.instance.setWidth(2.0)),
                        child: Center(
                            child: Text(widget.text1,
                                style: TextStyle(
                                  color: isTapped1
                                      ? MyColor().black
                                      : MyColor().white,
                                ))),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isTapped2 = true;
                    });
                    Timer(Duration(milliseconds: 200), () {
                      saveImage2();
                    });
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: MyColor().black, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        width: ScreenUtil.instance.setWidth(145.0),
                        height: ScreenUtil.instance.setWidth(145.0),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.transparent, width: 5.0),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                        ),
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(10.0)),
                        width: ScreenUtil.instance.setWidth(140.0),
                        child: Image.network(
                          widget.choice2,
                          height: ScreenUtil.instance.setHeight(90.0),
                          alignment: Alignment.center,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: isTapped2 ? MyColor().white : MyColor().black,
                          border:
                              Border.all(color: MyColor().black, width: 1.0),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)),
                        ),
                        height: 31.0,
                        width: ScreenUtil.instance.setWidth(141.5),
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(113.0),
                            left: ScreenUtil.instance.setWidth(2.0)),
                        child: Center(
                            child: Text(widget.text2,
                                style: TextStyle(
                                  color: isTapped2
                                      ? MyColor().black
                                      : MyColor().white,
                                ))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isTapped3 = true;
                    });
                    Timer(Duration(milliseconds: 200), () {
                      saveImage3();
                    });
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: MyColor().black, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        width: ScreenUtil.instance.setWidth(145.0),
                        height: ScreenUtil.instance.setWidth(145.0),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.transparent, width: 5.0),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                        ),
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(10.0)),
                        width: ScreenUtil.instance.setWidth(140.0),
                        child: Image.network(
                          widget.choice3,
                          height: ScreenUtil.instance.setHeight(90.0),
                          alignment: Alignment.center,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: isTapped3 ? MyColor().white : MyColor().black,
                          border:
                              Border.all(color: MyColor().black, width: 1.0),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)),
                        ),
                        height: 31.0,
                        width: ScreenUtil.instance.setWidth(141.5),
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(113.0),
                            left: ScreenUtil.instance.setWidth(2.0)),
                        child: Center(
                            child: Text(widget.text3,
                                style: TextStyle(
                                  color: isTapped3
                                      ? MyColor().black
                                      : MyColor().white,
                                ))),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isTapped4 = true;
                    });
                    Timer(Duration(milliseconds: 200), () {
                      saveImage4();
                    });
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: MyColor().black, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        width: ScreenUtil.instance.setWidth(145.0),
                        height: ScreenUtil.instance.setWidth(145.0),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.transparent, width: 5.0),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                        ),
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(10.0)),
                        width: ScreenUtil.instance.setWidth(140.0),
                        child: Image.network(
                          widget.choice4,
                          height: ScreenUtil.instance.setHeight(90.0),
                          alignment: Alignment.center,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: isTapped4 ? MyColor().white : MyColor().black,
                          border:
                              Border.all(color: MyColor().black, width: 1.0),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)),
                        ),
                        height: 31.0,
                        width: ScreenUtil.instance.setWidth(141.5),
                        margin: EdgeInsets.only(
                            top: ScreenUtil.instance.setWidth(113.0),
                            left: ScreenUtil.instance.setWidth(2.0)),
                        child: Center(
                            child: Text(widget.text4,
                                style: TextStyle(
                                  color: isTapped4
                                      ? MyColor().black
                                      : MyColor().white,
                                ))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  saveImage1() {
    setState(() {
       isTapped1 = false;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.choice1, widget.title);
    widget.notifyParent();
  }
  saveImage2() {
    setState(() {
      isTapped2 = false;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.choice1, widget.title);
    widget.notifyParent();
  }
  saveImage3() {
    setState(() {
      isTapped1 = false;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.choice1, widget.title);
    widget.notifyParent();
  }
  saveImage4() {
    setState(() {
      isTapped1 = false;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.choice1, widget.title);
    widget.notifyParent();
  }
}

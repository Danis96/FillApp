import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceContainer extends StatelessWidget {
  final int number, numberOfQuestions, length;
  final String index, choice1, username, title;
  final Function notifyParent;
  final DocumentSnapshot doc;
  const ChoiceContainer(
      {Key key,
      this.doc,
      this.index,
      this.notifyParent,
      this.number,
      this.numberOfQuestions,
      this.title,
      this.username,
      this.choice1,
      this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: ScreenUtil.instance.setWidth(20.0), left: ScreenUtil.instance.setWidth(20.0)),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: MyColor().black),
              borderRadius: BorderRadius.all(Radius.circular(33.5)),
              color: MyColor().white),
          width: ScreenUtil.instance.setWidth(350.0),
          height: ScreenUtil.instance.setWidth(53.0),
          margin: EdgeInsets.only(
              top: ScreenUtil.instance.setWidth(5.0),
              bottom: ScreenUtil.instance.setWidth(5.0)),
          child: Row(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(right: ScreenUtil.instance.setWidth(40.0)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: MyColor().black),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: MyColor().black),
                height: ScreenUtil.instance.setHeight(58.0),
                width: ScreenUtil.instance.setWidth(58.0),
                child: Text(index,
                    style: TextStyle(
                        color: MyColor().white,
                        fontWeight: FontWeight.w500,
                        fontFamily: arabic,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil.instance.setSp(18.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(choice1,
                    style: TextStyle(
                        color: MyColor().black,
                        fontWeight: FontWeight.w700,
                        fontFamily: arabic,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil.instance.setSp(18.0))),
              ),
            ],
          )),
    );
  }
}

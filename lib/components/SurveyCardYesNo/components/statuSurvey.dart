import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusSurvey extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
       height: ScreenUtil.instance.setHeight(30.0),
       margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(child: Text('Status')),
          Container(child: completedStatus('COMPLETED', arabic, true),),
        ],
      ),
    );
  }
}



Widget completedStatus(String text, String arabic, bool isCompleted) {
  return Container(
      width:  ScreenUtil.instance.setWidth(116.0) ,
      height: ScreenUtil.instance.setHeight(38.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: isCompleted ? MyColor().black : MyColor().white),
      child: Text(text,
          style: TextStyle(
              color: isCompleted ? MyColor().white : MyColor().black,
              fontWeight: isCompleted ? FontWeight.w400 : FontWeight.w700,
              fontFamily: arabic,
              fontStyle: FontStyle.normal,
              fontSize: isCompleted ? ScreenUtil.instance.setSp(12.0) : ScreenUtil.instance.setSp(22.0)),
          textAlign: TextAlign.center),
    );
}
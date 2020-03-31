import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletedStatus extends StatelessWidget {
  final String text, arabic;
  final bool isCompleted;
  int number, total;
  CompletedStatus({Key key, this.text, this.arabic, this.isCompleted, this.number, this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.instance.setWidth(116.0),
      height: ScreenUtil.instance.setHeight(38.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: isCompleted ? MyColor().black : number == 0
                      ? MyColor().white
                      : number > 0 && number <= total ? MyColor().white : MyColor().white,),
      child: Text(text,
          style: TextStyle(
              color: isCompleted ? MyColor().white :  MyColor().black,
              fontWeight: isCompleted ? FontWeight.w400 : FontWeight.w700,
              fontFamily: arabic,
              fontStyle: FontStyle.normal,
              fontSize: isCompleted
                  ? ScreenUtil.instance.setSp(12.0)
                  : ScreenUtil.instance.setSp(22.0)),
          textAlign: TextAlign.center),
    );
  }
}

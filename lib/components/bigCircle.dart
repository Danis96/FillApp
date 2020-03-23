import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigCircle extends StatelessWidget {
  final int usersSarovi;
  BigCircle({Key key, this.usersSarovi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.instance.setWidth(198.0),
      height: ScreenUtil.instance.setHeight(198.0),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(40.0)),
              child: Text(
                usersSarovi.toString(),
                style: TextStyle(
                  color: btnText == MyText().completeProfile
                      ? MyColor().black
                      : btnText == MyText().transfer
                          ? MyColor().black
                          : MyColor().white,
                  fontSize: ScreenUtil.instance.setSp(35.0),
                  fontFamily: arabic,
                ),
              )),
          Container(
              child: Text(
            MyText().singleSar,
            style: TextStyle(
              color: btnText == MyText().completeProfile
                  ? MyColor().black
                  : btnText == MyText().transfer
                      ? MyColor().black
                      : MyColor().white,
              fontSize: ScreenUtil.instance.setSp(35.0),
              fontFamily: arabic,
            ),
          )),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: btnText == MyText().completeProfile
                ? Colors.red
                : btnText == MyText().transfer
                    ? MyColor().greenCircle
                    : MyColor().white),
        color: btnText == MyText().completeProfile
            ? MyColor().white
            : btnText == MyText().transfer ? MyColor().white : MyColor().black,
        shape: BoxShape.circle,
      ),
    );
  }
}
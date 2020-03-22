import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelContainer extends StatelessWidget {
  final String text;
  final double leftMargin, containerWidth;
  const LabelContainer({Key key, this.text, this.leftMargin, this.containerWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: ScreenUtil.instance.setWidth(containerWidth),
      margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(20.0), left: ScreenUtil.instance.setWidth(leftMargin)),
      child: Text(
        text,
        style: TextStyle(
            color: MyColor().black,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: arabic,
            fontSize: ScreenUtil.instance.setSp(18.0)),
      ),
    );
  }
}

/// Question SAR class
///
/// This class contains layout for question SAR.
///
/// Imports:
///   MyColor constant class with all colors
///   ScreenUtil class for respnsive desing
///   FontsConstants for fonts
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyQuestionSAR extends StatelessWidget {
  final String text;
  final bool isCompleted;
  MyQuestionSAR({this.text, this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:ScreenUtil.instance.setWidth(130.0),
      height: ScreenUtil.instance.setHeight(38.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: isCompleted ? MyColor().black : MyColor().white),
      child: Text(text,
          style: TextStyle(
              color: isCompleted ? MyColor().white : MyColor().black,
              fontWeight: FontWeight.w700,
              fontFamily: arabic,
              fontStyle: FontStyle.normal,
              fontSize: ScreenUtil.instance.setSp(22.0)),
          textAlign: TextAlign.center),
    );
  }
}

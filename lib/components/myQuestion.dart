/// Question class
///
/// This class contains layout for question.
///
/// Imports:
///   MyColor constant class with all colors
///   ScreenUtil class for respnsive desing
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyQuestion extends StatelessWidget {
  final String question;
  final double containerHeight;
  MyQuestion({this.question, this.containerHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        width: ScreenUtil.instance.setWidth(245.0),
        height: ScreenUtil.instance.setHeight(containerHeight),
        child: Text(question,
            style: TextStyle(
                color: MyColor().white,
                fontWeight: FontWeight.w400,
                fontFamily: "LoewNextArabic",
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil.instance.setSp(20.0))));
  }
}

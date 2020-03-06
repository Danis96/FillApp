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

class MyProgressNumbers extends StatelessWidget {
  final int total;
  final int answered;
  MyProgressNumbers({this.total, this.answered});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(answered.toString() + '/' + total.toString(),
            style: TextStyle(
                color: MyColor().white,
                fontWeight: FontWeight.w500,
                fontFamily: "LoewNextArabic",
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil.instance.setSp(18.0))));
  }
}
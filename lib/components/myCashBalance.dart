/// Cash Balance class
///
/// This class contains layout for cash balance.
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

class MyCashBalance extends StatelessWidget {
  final String text;
  MyCashBalance({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(40.0), bottom: ScreenUtil.instance.setWidth(15.0)),
        width: ScreenUtil.instance.setWidth(120),
        child: Text(text,
            style: TextStyle(
                color: MyColor().black,
                fontWeight: FontWeight.w700,
                fontFamily: "LoewNextArabic",
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil.instance.setSp(23.0)),
            textAlign: TextAlign.center));
  }
}

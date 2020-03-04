/// SAR class
///
/// This class contains layout for SAR.
///
/// Imports:
///   MyColor constant class with all colors
///   ScreenUtil class for respnsive desing
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySAR extends StatefulWidget {
  final String text;
  MySAR({this.text});

  @override
  _MySARState createState() => _MySARState();
}

class _MySARState extends State<MySAR> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(25.0)),
        width: ScreenUtil.instance.setWidth(92),
        child: Text(widget.text,
            style: TextStyle(
                color: MyColor().black,
                fontWeight: FontWeight.w700,
                fontFamily: arabic,
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil.instance.setSp(40.0)),
            textAlign: TextAlign.center));
  }
}

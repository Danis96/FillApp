import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String language = 'Arabic';

class LanguageChoose extends StatelessWidget {
  final Function refresh;
  LanguageChoose({this.refresh});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              language = 'Arabic';
              print(language);
              refresh();
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(22.0)),
              width: ScreenUtil.instance.setWidth(156.0),
              height: ScreenUtil.instance.setWidth(58.0),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: MyColor().black),
                borderRadius: BorderRadius.all(Radius.circular(29)),
                color: language == 'Arabic' ? MyColor().white : MyColor().black,
              ),
              child: Text('Arabic',
                  style: TextStyle(
                      color: language == 'Arabic'
                          ? MyColor().black
                          : MyColor().white,
                      fontWeight: FontWeight.w700,
                      fontFamily: "LoewNextArabic",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                  textAlign: TextAlign.center),
            ),
          ),
          GestureDetector(
            onTap: () {
              language = 'English';
              print(language);
              refresh();
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: ScreenUtil.instance.setWidth(22.0),
                  left: ScreenUtil.instance.setWidth(5.0)),
              width: ScreenUtil.instance.setWidth(156.0),
              height: ScreenUtil.instance.setWidth(58.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: MyColor().black),
                  borderRadius: BorderRadius.all(Radius.circular(29)),
                  color: language == 'English'
                      ? MyColor().white
                      : MyColor().black),
              child: Text('English',
                  style: TextStyle(
                      color: language == 'English'
                          ? MyColor().black
                          : MyColor().white,
                      fontWeight: FontWeight.w700,
                      fontFamily: "LoewNextArabic",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                  textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }
}

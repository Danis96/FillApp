import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String language = MyText().languageArabic;

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
              language = MyText().languageArabic;
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
                color: language == MyText().languageArabic ? MyColor().white : MyColor().black,
              ),
              child: Text(MyText().languageArabic,
                  style: TextStyle(
                      color: language == MyText().languageArabic
                          ? MyColor().black
                          : MyColor().white,
                      fontWeight: FontWeight.w700,
                      fontFamily: arabic,
                      fontStyle: FontStyle.normal,
                      fontSize: ScreenUtil.instance.setSp(18.0)),
                  textAlign: TextAlign.center),
            ),
          ),
          GestureDetector(
            onTap: () {
              language = MyText().languageEnglish;
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
                  color: language == MyText().languageEnglish
                      ? MyColor().white
                      : MyColor().black),
              child: Text(MyText().languageArabic,
                  style: TextStyle(
                      color: language == MyText().languageEnglish
                          ? MyColor().black
                          : MyColor().white,
                      fontWeight: FontWeight.w700,
                      fontFamily: arabic,
                      fontStyle: FontStyle.normal,
                      fontSize: ScreenUtil.instance.setSp(18.0)),
                  textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String language = 'Arabic';

class LanguageChoose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(22.0)),
            width: ScreenUtil.instance.setWidth(156.0),
            height: ScreenUtil.instance.setWidth(58.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(29)),
                color: MyColor().black),
            child: RaisedButton(
                color: language == 'Arabic' ? MyColor().white : MyColor().black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(28.0),
                ),
                child: Text('Arabic',
                    style: TextStyle(
                        color: language == 'Arabic' ? MyColor().black : MyColor().white,
                        fontWeight: FontWeight.w700,
                        fontFamily: "LoewNextArabic",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center),
                onPressed: () => language = 'Arabic'),
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil.instance.setWidth(22.0),
                left: ScreenUtil.instance.setWidth(5.0)),
            width: ScreenUtil.instance.setWidth(156.0),
            height: ScreenUtil.instance.setWidth(58.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(29)),
                color: MyColor().white),
            child: RaisedButton(
                color: language == 'English' ? MyColor().white : MyColor().black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(28.0),
                ),
                child: Text('English',
                    style: TextStyle(
                        color: language == 'English' ? MyColor().black : MyColor().white,
                        fontWeight: FontWeight.w700,
                        fontFamily: "LoewNextArabic",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center),
                onPressed: () => language = 'English'),
          ),
        ],
      ),
    );
  }
}

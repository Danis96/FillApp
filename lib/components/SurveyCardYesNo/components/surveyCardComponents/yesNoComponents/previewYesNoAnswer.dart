import 'package:fillproject/components/answerLabelContainer.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewYesNoAnswer extends StatelessWidget {
  const PreviewYesNoAnswer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnswerLabel(),
        Container(
          margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0)),
          width: ScreenUtil.instance.setWidth(303.0),
          height: ScreenUtil.instance.setWidth(58.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(29)),
              color: MyColor().white),
          child: RaisedButton(
              hoverColor: MyColor().black,
              color: MyColor().black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(28.0),
              ),
              child: Text(answersFromSummary.toString(),
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w700,
                      fontFamily: arabic,
                      fontStyle: FontStyle.normal,
                      fontSize: ScreenUtil.instance.setSp(18.0)),
                  textAlign: TextAlign.center),
              onPressed: () => null),
        ),
      ],
    );
  }
}

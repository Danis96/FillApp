import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileButton extends StatelessWidget {
  final Function onPressed;
  ProfileButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(
            top: ScreenUtil.instance.setWidth(30.0),
            bottom: ScreenUtil.instance.setWidth(30.0)),
        width: ScreenUtil.instance.setWidth(303.0),
        height: ScreenUtil.instance.setWidth(58.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(29)),
            color: MyColor().white),
        child: RaisedButton(
            color: MyColor().black,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(28.0),
            ),
            child: btnText == MyText().register
                ? Text(MyText().register,
                    style: TextStyle(
                        color: MyColor().white,
                        fontFamily: arabic,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil.instance.setSp(18.0)),
                    textAlign: TextAlign.center)
                : btnText == MyText().transfer
                    ? Text(MyText().transfer,
                        style: TextStyle(
                            color: MyColor().white,
                            fontFamily: arabic,
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil.instance.setSp(18.0)),
                        textAlign: TextAlign.center)
                    : btnText == MyText().completeProfile
                        ? Text(MyText().completeProfile,
                            style: TextStyle(
                                color: MyColor().white,
                                fontFamily: arabic,
                                fontStyle: FontStyle.normal,
                                fontSize: ScreenUtil.instance.setSp(18.0)),
                            textAlign: TextAlign.center)
                        : Text(MyText().transferAfter,
                            style: TextStyle(
                                color: MyColor().white,
                                fontFamily: arabic,
                                fontStyle: FontStyle.normal,
                                fontSize: ScreenUtil.instance.setSp(18.0)),
                            textAlign: TextAlign.center),
            onPressed: () => onPressed()),
      ),
    );
  }
}

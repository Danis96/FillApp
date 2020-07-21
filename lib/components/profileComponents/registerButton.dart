import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 

class RegisterButtonProfile extends StatelessWidget {
  final Function onPressedRegister;
  RegisterButtonProfile(this.onPressedRegister);

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.only(bottom: 20.0, top: 30.0),
                width: ScreenUtil.instance.setWidth(303.0),
                height: ScreenUtil.instance.setWidth(58.0),
                child: RaisedButton(
                        color: MyColor().black,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(28.0),
                        ),
                        onPressed: () => onPressedRegister(),
                        child: Text(
                          AppLocalizations.of(context).translate('register'),
                          style: TextStyle(color: MyColor().white,
                            fontFamily: arabic,
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil.instance.setSp(18.0)),
                        ),
                      )
              );
  }
}
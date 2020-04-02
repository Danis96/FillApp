import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CongradulationsContainer extends StatelessWidget {
  const CongradulationsContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(33.0)),
      child: Center(
        child: Text(AppLocalizations.of(context).translate('congrats'),
            style: TextStyle(
              color: MyColor().white,
              fontWeight: FontWeight.w700,
              fontFamily: arabic,
              fontStyle: FontStyle.normal,
              fontSize: ScreenUtil.instance.setSp(25.0),
            ),
            textAlign: TextAlign.center),
      ),
    );
  }
}

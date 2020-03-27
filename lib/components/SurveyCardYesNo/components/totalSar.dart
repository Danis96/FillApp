import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalSar extends StatelessWidget {
  final String sars;
  TotalSar({Key key, this.sars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(44.0)),
      child: Center(
        child: Text(sars + AppLocalizations.of(context).translate('sar'),
            style: TextStyle(
              color: MyColor().white,
              fontWeight: FontWeight.w700,
              fontFamily: arabic,
              fontStyle: FontStyle.normal,
              fontSize: ScreenUtil.instance.setSp(35.0),
            ),
            textAlign: TextAlign.center),
      ),
    );
  }
}

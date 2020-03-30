import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigCircle extends StatelessWidget {
  final int usersSarovi;
  BigCircle({Key key, this.usersSarovi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          width: ScreenUtil.instance.setWidth(198.0),
          height: ScreenUtil.instance.setHeight(198.0),
          decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: btnText == AppLocalizations.of(context).translate('completeProfile')
                    ? Colors.red
                    : btnText == AppLocalizations.of(context).translate('transfer')
                        ? MyColor().greenCircle
                        : MyColor().white),
            color: btnText == AppLocalizations.of(context).translate('completeProfile') 
                ? MyColor().white
                : btnText == AppLocalizations.of(context).translate('transfer')
                    ? MyColor().white
                    : MyColor().black,
            shape: BoxShape.circle,
          ),
        ),
        Text(
          usersSarovi.toString() + '\n' + AppLocalizations.of(context).translate("SAR"),
          style: TextStyle(
            color: btnText == AppLocalizations.of(context).translate('completeProfile')
                ? MyColor().black
                : btnText == AppLocalizations.of(context).translate('transfer')
                    ? MyColor().black
                    : MyColor().white,
            fontSize: ScreenUtil.instance.setSp(35.0),
            fontFamily: arabic,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

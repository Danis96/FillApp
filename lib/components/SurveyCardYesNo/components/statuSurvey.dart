import 'package:fillproject/components/completedStatus.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusSurvey extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
       height: ScreenUtil.instance.setHeight(30.0),
       margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(child: Text(AppLocalizations.of(context).translate('status'))),
          CompletedStatus(text: AppLocalizations.of(context).translate('statusCompleted'), arabic: arabic, isCompleted: true)
        ],
      ),
    );
  }
}
import 'package:fillproject/components/completedStatus.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusSurvey extends StatelessWidget {
  final bool isCompleted;
  int number;
  int total;
  StatusSurvey({this.isCompleted, this.number, this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.instance.setHeight(30.0),
      margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              child: Text(
            AppLocalizations.of(context).translate('status'),
            style: TextStyle(
                color: isCompleted ? MyColor().black : MyColor().white),
          )),
          CompletedStatus(
              number:number,
              total: total,
              text: isCompleted
                  ? AppLocalizations.of(context).translate('statusCompleted')
                  : number == 0
                      ? AppLocalizations.of(context).translate('statusOpen')
                      : number > 0 && number <= total ? AppLocalizations.of(context).translate('statusClosed') : '',
              arabic: arabic,
              isCompleted: true)
        ],
      ),
    );
  }
}

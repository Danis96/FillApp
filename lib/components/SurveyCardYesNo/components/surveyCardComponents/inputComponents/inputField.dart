import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final bool fieldColor;
  final TextEditingController answerController;
  InputField({Key key, this.fieldColor, this.answerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.instance.setWidth(327.0),
      height: ScreenUtil.instance.setWidth(65.0),
      margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(20.0)),
      child: TextFormField(
        readOnly: isSummary ? true : false,
        maxLength: 60,
        enableSuggestions: false,
        style: TextStyle(color: Colors.black),
        controller: answerController,
        decoration: InputDecoration(
          counterText: '',
          hasFloatingPlaceholder: false,
          contentPadding:
              new EdgeInsets.symmetric(vertical: 25.0, horizontal: 35.0),
          labelText: AppLocalizations.of(context).translate('typeTheAnswer'),
          labelStyle: TextStyle(color: MyColor().black, fontSize: ScreenUtil.instance.setWidth(17.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(33.5)),
            borderSide: BorderSide(
              color: fieldColor ? MyColor().error : MyColor().black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(33.5)),
            borderSide: BorderSide(
                color: fieldColor ? MyColor().error : MyColor().black),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(33.5)),
            borderSide: BorderSide(
              color: MyColor().error,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(33.5)),
            borderSide: BorderSide(
              color: MyColor().error,
            ),
          ),
        ),
        obscureText: false,
      ),
    );
  }
}

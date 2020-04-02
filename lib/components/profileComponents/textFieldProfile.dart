import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldProfile extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText; // to see what user is typing
  final int maxTextLength; // max charachters in field
  final double widthh;
  final double leftMargin;
  final double rightMargin;

  TextFieldProfile(
      {this.controller,
      this.label,
      this.maxTextLength,
      this.obscureText,
      this.widthh,
      this.leftMargin,
      this.rightMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.instance.setWidth(widthh),
      height: ScreenUtil.instance.setHeight(67.0),
      margin: EdgeInsets.only(
        left: ScreenUtil.instance.setWidth(leftMargin),
        top: ScreenUtil.instance.setWidth(22.0),
        right: ScreenUtil.instance.setWidth(rightMargin),
      ),
      child: TextFormField(
        maxLength: maxTextLength,
        enableSuggestions: false,
        style: TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
          counterText: '',
          hasFloatingPlaceholder: false,
          contentPadding:
              new EdgeInsets.symmetric(vertical: 25.0, horizontal: 35.0),
          labelText: label,
          labelStyle: TextStyle(color: MyColor().black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(33.5)),
            borderSide: BorderSide(
                // color: fieldColor ? MyColor().error : MyColor().black,
                ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(33.5)),
            borderSide: BorderSide(
                // color: fieldColor ? MyColor().error : MyColor().black
                ),
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
        obscureText: obscureText,
      ),
    );
  }
}

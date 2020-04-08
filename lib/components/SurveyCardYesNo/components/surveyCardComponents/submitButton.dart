import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButton extends StatelessWidget {
  final Function onPressedFunction;
  final bool isImage;
  final String text;
  SubmitButton({Key key, this.text, this.onPressedFunction, this.isImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width: ScreenUtil.instance.setWidth(316.0),
        height: ScreenUtil.instance.setHeight(50.0),
        margin: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(54.0),
            right: ScreenUtil.instance.setWidth(55.0),
            top: SizeConfig.blockSizeVertical * 1
            ),
        child: RaisedButton(
          color: MyColor().black,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(33.5),
          ),
          onPressed: () {
            if(isImage) {
              onPressedFunction();
            } else {
              onPressedFunction(context);
            }
          },
          child: Text(text,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(18.0),
                  color: MyColor().white)),
        ));
  }
}

import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/dashboard/navigationBarController.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleImageContainer extends StatelessWidget {
  final Function onTapSingle, saveMultiple1;
  final String text, choice;
  final int isSingle;
  final isTappedSpec;
  SingleImageContainer(
      {Key key,
      this.isSingle,
      this.text,
      this.choice,
      this.onTapSingle,
      this.saveMultiple1,
      this.isTappedSpec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isSummary
          ? null
          : isSingle == 0 ? onTapSingle() : saveMultiple1(text),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: MyColor().black, width: 3.0),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            width: ScreenUtil.instance.setWidth(145.0),
            height: ScreenUtil.instance.setWidth(145.0),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 5.0),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
            width: ScreenUtil.instance.setWidth(140.0),
            child: isLoading
                ? Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(30.0)),
                    child: Center(child: CircularProgressIndicator()))
                : Image.network(
                    choice,
                    height: ScreenUtil.instance.setHeight(90.0),
                    alignment: Alignment.center,
                  ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isTappedSpec ? MyColor().white : MyColor().black,
              border: Border.all(color: MyColor().black, width: 1.0),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
            ),
            height: 31.0,
            width: ScreenUtil.instance.setWidth(141.5),
            margin: EdgeInsets.only(
                top: ScreenUtil.instance.setWidth(113.0),
                left: ScreenUtil.instance.setWidth(2.0)),
            child: Center(
                child: Text(text,
                    style: TextStyle(
                      color: isTappedSpec ? MyColor().black : MyColor().white,
                    ))),
          ),
        ],
      ),
    );
  }
}

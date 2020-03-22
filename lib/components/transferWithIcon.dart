import 'package:fillproject/components/constants/imageConstants.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransferWithIcon extends StatelessWidget {
  const TransferWithIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(MyText().transferWith),
          ),
          Container(
            height: ScreenUtil.instance.setHeight(27.0),
            width: ScreenUtil.instance.setWidth(81.0),
            margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
            child: Image.asset(transferImage),
          ),
        ],
      ),
    );
  }
}

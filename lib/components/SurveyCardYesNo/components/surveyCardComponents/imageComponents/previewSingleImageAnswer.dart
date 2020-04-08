import 'package:fillproject/components/answerLabelContainer.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewSingleImageAnswer extends StatelessWidget {
  const PreviewSingleImageAnswer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = clickedAnswer.split('(+)');
    String text = list[0];
    String url = list[1];

    return Column(
      children: <Widget>[
        AnswerLabel(),
        Container(
          margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
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
                margin:
                    EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
                width: ScreenUtil.instance.setWidth(140.0),
                child: Image.network(
                                url,
                                height: ScreenUtil.instance.setHeight(90.0),
                                alignment: Alignment.center,
                              ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: MyColor().black,
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
                          color: MyColor().white,
                        ))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

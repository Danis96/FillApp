import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/myQuestion.dart';
import 'package:fillproject/components/myQuestionSAR.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
 
class YesNoSurveySQP extends StatelessWidget {
  final int sar;
  final int answered;
  final int answeredFrom;
  final String question;
  YesNoSurveySQP({this.sar,this.answered, this.answeredFrom, this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: ScreenUtil.instance.setHeight(500.0),
              width: ScreenUtil.instance.setWidth(414.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(57.0),
                              top: ScreenUtil.instance.setWidth(320.0)),
                          child: MyQuestionSAR(
                            text: '+' + sar.toString() +  ' SAR',
                          )),
                      Container(
                        child: Text(
                          answered.toString() +  '/' + answeredFrom.toString(),
                          style: TextStyle(
                              color: MyColor().white,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'LoewNextArabic',
                              fontSize: 16.0),
                        ),
                        margin: EdgeInsets.only(
                            left: ScreenUtil.instance.setWidth(106.0),
                            top: ScreenUtil.instance.setWidth(320.0)),
                      ),
                    ],
                  ),
                  Container(
                    child: MyQuestion(
                      question: question,
                      containerHeight: ScreenUtil.instance.setHeight(126.0),
                    ),
                  ),
                ],
              ),
              decoration: new BoxDecoration(
                color: Colors.black,
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(51.0),
                  bottomRight: const Radius.circular(51.0),
                ),
              ));
  }
}
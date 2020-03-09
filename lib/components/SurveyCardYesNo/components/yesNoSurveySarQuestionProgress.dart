import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/myQuestion.dart';
import 'package:fillproject/components/myQuestionSAR.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YesNoSurveySQP extends StatefulWidget {
  final int sar, answered, answeredFrom;
  final String question;
  final String type;
  YesNoSurveySQP(
      {this.sar, this.answered, this.answeredFrom, this.question, this.type});

  @override
  _YesNoSurveySQPState createState() => _YesNoSurveySQPState();
}

class _YesNoSurveySQPState extends State<YesNoSurveySQP> {
  double height;
  double heightContainer;

  @override
  void initState() {
    super.initState();
    typeHeight(widget.type);
  }

  typeHeight(String type) {
    switch (type) {
      case 'yesno':
        return {
          height = 240.0,
          heightContainer = 420.0,
        };
      case 'input':
        return {
          height = 30.0, 
          heightContainer = 210.0};
      case 'mcq':
        return {
          height = 30.0, 
          heightContainer = 210.0};
      case 'date':
        return {
          height = 30.0, 
          heightContainer = 210.0};
      case 'image':
        return {
          height = 30.0, 
          heightContainer = 210.0};    
      default:
        return {
          height = 260.0,
          heightContainer = 300.0,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil.instance.setHeight(heightContainer),
        width: ScreenUtil.instance.setWidth(414.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil.instance.setWidth(57.0),
                        top: ScreenUtil.instance.setWidth(height)),
                    child: MyQuestionSAR(
                      isCompleted: false,
                      text: '+' + widget.sar.toString() + ' SAR',
                    )),
                Container(
                  child: Text(
                    widget.answered.toString() +
                        '/' +
                        widget.answeredFrom.toString(),
                    style: TextStyle(
                        color: MyColor().white,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'LoewNextArabic',
                        fontSize: 16.0),
                  ),
                  margin: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(106.0),
                      top: ScreenUtil.instance.setWidth(height)),
                ),
              ],
            ),
            Container(
              child: MyQuestion(
                isCompleted: false,
                question: widget.question,
                containerHeight: ScreenUtil.instance.setHeight(126.0),
              ),
            ),
          ],
        ),
        decoration: new BoxDecoration(
          color: Colors.black,
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(30.0),
            bottomRight: const Radius.circular(30.0),
          ),
        ));
  }
}

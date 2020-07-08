import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/myQuestion.dart';
import 'package:fillproject/components/myQuestionSAR.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/utils/size_config.dart';
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
          height = 100.0,
          heightContainer = 47,
        };
      case 'input':
        return {
          height = 13, 
          heightContainer = 38};
      case 'mcq':
        return {
          height = 10, 
          heightContainer = 38};
      case 'date':
        return {
          height = 10, 
          heightContainer = 40};
      case 'image':
        return {
          height = 10, 
          heightContainer = 37};
      case 'order':
        return {
          height = 10, 
          heightContainer = 38};
      case 'dropdown':
        return {
          height = 10,
          heightContainer = 38};
      default:
        return {
          height = 260.0,
          heightContainer = 300.0,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        height: SizeConfig.blockSizeVertical * heightContainer,
        width: ScreenUtil.instance.setWidth(416.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil.instance.setWidth(57.0),
                        bottom: ScreenUtil.instance.setWidth(7.0),
                        top: SizeConfig.blockSizeVertical * 10), 
                    child: MyQuestionSAR(
                      isCompleted: false,
                      text: '+' + widget.sar.toString() + ' ' + AppLocalizations.of(context).translate('SAR'),
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
                        fontFamily: arabic,
                        fontSize: ScreenUtil.instance.setSp(16.0)),
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
                containerHeight: 20,
              ),
            ),
          ],
        ),
        decoration: new BoxDecoration(
          color: Color.fromRGBO(74, 85, 98, 1.0),
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(30.0),
            bottomRight: const Radius.circular(30.0),
          ),
        ));
  }
}

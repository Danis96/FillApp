import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultipleMcqList extends StatelessWidget {
  const MultipleMcqList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (answersFromSummary.substring(0, 1) == '[' &&
        answersFromSummary.substring(
                answersFromSummary.length - 1, answersFromSummary.length) ==
            ']') {
      answersFromSummary =
          answersFromSummary.substring(1, answersFromSummary.length - 1);
    }
    List<dynamic> listOfAnswers = answersFromSummary.split(', ');
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listOfAnswers.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(20.0),
                right: ScreenUtil.instance.setWidth(20.0)),
            child: Container(
                width: ScreenUtil.instance.setWidth(350.0),
                margin:
                    EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
                child: ListTile(
                    leading: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.0, color: MyColor().black),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: MyColor().black),
                      height: ScreenUtil.instance.setHeight(58.0),
                      width: ScreenUtil.instance.setWidth(58.0),
                      child: Text(
                          index == 0
                              ? MyText().indexA
                              : index == 1
                                  ? MyText().indexB
                                  : index == 2
                                      ? MyText().indexC
                                      : index == 3 ? MyText().indexD : null,
                          style: TextStyle(
                              color: MyColor().white,
                              fontWeight: FontWeight.w500,
                              fontFamily: arabic,
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil.instance.setSp(18.0))),
                    ),
                    title: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(listOfAnswers[index],
                          style: TextStyle(
                              color: MyColor().black,
                              fontWeight: FontWeight.w700,
                              fontFamily: arabic,
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil.instance.setSp(18.0))),
                    ),
                    onTap: () => null)),
          );
        });
  }
}

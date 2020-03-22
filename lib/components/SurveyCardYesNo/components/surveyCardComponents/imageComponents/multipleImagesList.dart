import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultipleImagesList extends StatelessWidget {
  MultipleImagesList({Key key}) : super(key: key);

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
    List<dynamic> listOfAnswers1 = [];
    List<dynamic> listOfAnswers2 = [];
    if (listOfAnswers.length > 2) {
      listOfAnswers1 = listOfAnswers.sublist(0, 2);
      listOfAnswers2 = listOfAnswers.sublist(2, listOfAnswers.length);
    }

    return Padding(
      padding: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(20.0),
          right: ScreenUtil.instance.setWidth(20.0)),
      child: Container(
        height: ScreenUtil.instance.setHeight(460.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
              height: ScreenUtil.instance.setHeight(160.0),
              child: Row(
                children: <Widget>[
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: listOfAnswers.length > 2
                          ? listOfAnswers1.length
                          : listOfAnswers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil.instance.setWidth(20.0)),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: MyColor().black, width: 3.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                              ),
                              width: ScreenUtil.instance.setWidth(145.0),
                              height: ScreenUtil.instance.setWidth(145.0),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.transparent, width: 5.0),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0)),
                              ),
                              margin: EdgeInsets.only(
                                  top: ScreenUtil.instance.setWidth(10.0),
                                  left: ScreenUtil.instance.setWidth(20.0)),
                              width: ScreenUtil.instance.setWidth(140.0),
                              child: EmptyContainer(),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: MyColor().black,
                                border: Border.all(
                                    color: MyColor().black, width: 1.0),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0)),
                              ),
                              height: ScreenUtil.instance.setHeight(31.0),
                              width: ScreenUtil.instance.setWidth(141.5),
                              margin: EdgeInsets.only(
                                  top: ScreenUtil.instance.setWidth(113.0),
                                  left: ScreenUtil.instance.setWidth(22.0)),
                              child: Center(
                                  child: Text(listOfAnswers[index],
                                      style: TextStyle(
                                        color: MyColor().white,
                                      ))),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
              height: ScreenUtil.instance.setHeight(160.0),
              child: Row(
                children: <Widget>[
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount:
                          listOfAnswers.length > 2 ? listOfAnswers2.length : 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil.instance.setWidth(20.0)),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: MyColor().black, width: 3.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                              ),
                              width: ScreenUtil.instance.setWidth(145.0),
                              height: ScreenUtil.instance.setWidth(145.0),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.transparent, width: 5.0),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0)),
                              ),
                              margin: EdgeInsets.only(
                                  top: ScreenUtil.instance.setWidth(10.0),
                                  left: ScreenUtil.instance.setWidth(20.0)),
                              width: ScreenUtil.instance.setWidth(140.0),
                              child: EmptyContainer(),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: MyColor().black,
                                border: Border.all(
                                    color: MyColor().black, width: 1.0),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0)),
                              ),
                              height: ScreenUtil.instance.setHeight(31.0),
                              width: ScreenUtil.instance.setWidth(141.5),
                              margin: EdgeInsets.only(
                                  top: ScreenUtil.instance.setWidth(113.0),
                                  left: ScreenUtil.instance.setWidth(22.0)),
                              child: Center(
                                  child: Text(listOfAnswers2[index],
                                      style: TextStyle(
                                        color: MyColor().white,
                                      ))),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

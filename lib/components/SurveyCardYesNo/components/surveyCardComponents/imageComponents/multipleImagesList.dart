import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultipleImagesList extends StatelessWidget {
  MultipleImagesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (clickedAnswer.substring(0, 1) == '[' &&
        clickedAnswer.substring(
                clickedAnswer.length - 1, clickedAnswer.length) ==
            ']') {
      clickedAnswer =
          clickedAnswer.substring(1, clickedAnswer.length - 1);
    }
    //print(clickedAnswer);
    List<dynamic> listOfAnswers = clickedAnswer.split(', ');
    //print(listOfAnswers);
    List<dynamic> listOfAnswersURL = listOfAnswers.toString().split('(+)');
    //print(listOfAnswersURL);
    String listOfAnswersURLString = listOfAnswersURL.toString();
    listOfAnswersURLString = listOfAnswersURLString.substring(2, listOfAnswersURLString.length - 2);
    //print(listOfAnswersURLString);
    listOfAnswersURL = listOfAnswersURLString.split(', ');
    //print(listOfAnswersURL);
    List<dynamic> texts = [];
    List<dynamic> urls = [];
    for(int i = 0; i < listOfAnswersURL.length; i = i + 2) {
      texts.add(listOfAnswersURL[i]);
    }
    for(int i = 1; i < listOfAnswersURL.length; i = i + 2) {
      urls.add(listOfAnswersURL[i]);
    }
    print('AAAAAAAAAAAAAAAAA\n' + texts.toString());
    print('BBBBBBBBBBBBBBBBB\n' + urls.toString());
    List<dynamic> listOfAnswers1 = [];
    List<dynamic> listOfAnswers2 = [];
    List<dynamic> listOfAnswersURL1 = [];
    List<dynamic> listOfAnswersURL2 = [];
    if (listOfAnswers.length > 2) {
      listOfAnswers1 = texts.sublist(0, 2);
      listOfAnswers2 = texts.sublist(2, texts.length);
      listOfAnswersURL1 = urls.sublist(0, 2);
      listOfAnswersURL2 = urls.sublist(2, urls.length);
    }

    return Padding(
      padding: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(20.0),
          right: ScreenUtil.instance.setWidth(20.0)),
      child: Container(
        height: ScreenUtil.instance.setHeight(440.0),
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
                      itemCount: texts.length > 2
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
                              child: Image.network(
                                urls[index],
                                height: ScreenUtil.instance.setHeight(90.0),
                                alignment: Alignment.center,
                              ),
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
                                  child: Text(texts[index],
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
                              child: Image.network(
                                listOfAnswersURL2[index],
                                height: ScreenUtil.instance.setHeight(90.0),
                                alignment: Alignment.center,
                              ),
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

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/dropdownComponents/previewDropdown.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/models/Survey/surveyModel.dart';
import 'package:fillproject/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_expanded_tile/tileController.dart';

String textDropdown = 'Drop Down List';
ExpandedTileController _controller;

class DropdownWidget extends StatefulWidget {
  final widget;
  final int index, numberOfQuestions, number;
  final Function refresh;
  final Survey surveyDoc;
  DropdownWidget({
    this.widget,
    this.index,
    this.refresh,
    this.number,
    this.numberOfQuestions,
    this.surveyDoc,
  });

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  bool isDropTapped1 = false,
      isDropTapped2 = false,
      isDropTapped3 = false,
      isDropTapped4 = false,
      isDropTapped5 = false,
      isDropTapped6 = false,
      isDropTapped7 = false,
      isDropTapped8 = false,
      isDropTapped9 = false,
      isDropTapped10 = false,
      isDropTapped11 = false,
      isDropTapped12 = false,
      isDropTapped13 = false,
      isDropTapped14 = false,
      isDropTapped15 = false;

  @override
  void initState() {
    _controller = ExpandedTileController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//                            ),
    SizeConfig().init(context);
    print(widget.index);
    return Container(
      child: Stack(
        children: <Widget>[
          isSummary
              ? PreviewDropdown()
              : Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  width: SizeConfig.blockSizeHorizontal * 100,
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    width: SizeConfig.blockSizeHorizontal * 72,
                    child: ExpandedTile(
                      expandIcon: Icon(Icons.keyboard_arrow_up),
                      rotateExpandIcon: true,
                      controller: _controller,
                      checkable: false, // check box enabled or not
                      centerHeaderTitle: false,
                      title: Text(
                        textDropdown,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.safeBlockHorizontal * 4.5),
                      ),
                      content: Container(
                        height: SizeConfig.blockSizeVertical * 25,
                        child: Stack(
                          children: <Widget>[
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    widget.widget.snapQuestions[widget.index]
                                        ['numOfAnswers'],
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () => onTap1(index),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(color: Colors.black),
                                        right: BorderSide(color: Colors.black),
                                        left: BorderSide(color: Colors.black),
                                      )),
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3.7,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  3.7),
                                      height: SizeConfig.blockSizeVertical * 6,
                                      width:
                                          SizeConfig.blockSizeHorizontal * 100,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              2,
                                        ),
                                        child: Text(
                                          widget.widget
                                                  .snapQuestions[widget.index]
                                              ['choices'][index]['text'],
                                          style: TextStyle(
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  5,
                                              color: isDropTapped1
                                                  ? Color.fromRGBO(
                                                      42, 92, 157, 1.0)
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                      contentBackgroundColor: Colors.white,
                      contentPadding: EdgeInsets.all(0),
                    ),
                  ),
                ),
          isSummary ? EmptyContainer() : expansionButton(submitDropdown),
        ],
      ),
    );
  }

  onTap1(int index) {
    print('index' + index.toString());
    if(index == 0) {
      setState(() {
        isDropTapped1 = true;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 1) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = true;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 2) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = true;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 3) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = true;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 4) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = true;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 5) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = true;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 6) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = true;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 7) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = true;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 8) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = true;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 9) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = true;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 10) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = true;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 11) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = true;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 12) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = true;
        isDropTapped14 = false;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 13) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = true;
        isDropTapped15 = false;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }
    if(index == 14) {
      setState(() {
        isDropTapped1 = false;
        isDropTapped2 = false;
        isDropTapped3 = false;
        isDropTapped4 = false;
        isDropTapped5 = false;
        isDropTapped6 = false;
        isDropTapped7 = false;
        isDropTapped8 = false;
        isDropTapped9 = false;
        isDropTapped10 = false;
        isDropTapped11 = false;
        isDropTapped12 = false;
        isDropTapped13 = false;
        isDropTapped14 = false;
        isDropTapped15 = true;
        textDropdown =
        widget.widget.snapQuestions[widget.index]['choices'][index]['text'];
      });
    }



    Timer(Duration(milliseconds: 200), () {
      _controller.collapse();
    });
  }


  submitDropdown() {
    textDropdown = 'Drop Down List';
    isDropTapped1
        ? saveDrop1()
        : isDropTapped2
            ? saveDrop2()
            : isDropTapped3
                ? saveDrop3()
                : isDropTapped4
                    ? saveDrop4()
                    : isDropTapped5
                        ? saveDrop5()
                        : isDropTapped6
                            ? saveDrop6()
                            : isDropTapped7
                                ? saveDrop7()
                                : isDropTapped8
                                    ? saveDrop8()
                                    : isDropTapped9
                                        ? saveDrop9()
                                        : isDropTapped10
                                            ? saveDrop10()
                                            : isDropTapped11
                                                ? saveDrop11()
                                                : isDropTapped12
                                                    ? saveDrop12()
                                                    : isDropTapped13
                                                        ? saveDrop13()
                                                        : isDropTapped14
                                                            ? saveDrop14()
                                                            : isDropTapped15
                                                                ? saveDrop15()
                                                                : print(
                                                                    'object');
  }

  saveDrop1() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][0]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][0]['text']);
    widget.refresh();
  }

  saveDrop2() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][1]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][1]['text']);
    widget.refresh();
  }

  saveDrop3() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][2]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][2]['text']);
    widget.refresh();
  }

  saveDrop4() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][3]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][3]['text']);
    widget.refresh();
  }

  saveDrop5() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][4]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][4]['text']);
    widget.refresh();
  }

  saveDrop6() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][5]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][5]['text']);
    widget.refresh();
  }

  saveDrop7() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][6]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][6]['text']);
    widget.refresh();
  }

  saveDrop8() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][7]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][7]['text']);
    widget.refresh();
  }

  saveDrop9() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][8]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][8]['text']);
    widget.refresh();
  }

  saveDrop10() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][9]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][9]['text']);
    widget.refresh();
  }

  saveDrop11() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][10]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][10]['text']);
    widget.refresh();
  }

  saveDrop12() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][11]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][11]['text']);
    widget.refresh();
  }

  saveDrop13() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][12]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][12]['text']);
    widget.refresh();
  }

  saveDrop14() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][13]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][13]['text']);
    widget.refresh();
  }

  saveDrop15() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][14]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    offlineAnswers
        .add(widget.widget.snapQuestions[widget.index]['choices'][14]['text']);
    widget.refresh();
  }
}

Widget expansionButton(Function onPressed) {
  return GestureDetector(
    onTap: () => onPressed(),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      height: SizeConfig.blockSizeVertical * 8,
      width: SizeConfig.blockSizeVertical * 100,
      margin: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 40,
          left: SizeConfig.blockSizeHorizontal * 15,
          right: SizeConfig.blockSizeHorizontal * 15),
      child: Center(
          child: Text(
        'Next',
        style: TextStyle(
            color: Colors.white, fontSize: SizeConfig.safeBlockHorizontal * 5),
      )),
    ),
  );
}

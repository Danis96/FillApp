import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_expanded_tile/tileController.dart';

List<String> answers = ['Martial', 'Rashword', 'Pogba', 'Matic'];
String _selectedAnswer;
String textDropdown = 'Drop Down List';
ExpandedTileController _controller;

class DropdownWidget extends StatefulWidget {
  final widget;
  final int index, numberOfQuestions, number;
  final Function refresh;
  DropdownWidget({
    this.widget,
    this.index,
    this.refresh,
    this.number,
    this.numberOfQuestions,
  });

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  bool isDropTapped1 = false,
      isDropTapped2 = false,
      isDropTapped3 = false,
      isDropTapped4 = false;

  @override
  void initState() {
    _controller = ExpandedTileController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            width: SizeConfig.blockSizeHorizontal * 100,
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
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
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => onTap1(),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                          )),
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 3.7,
                              right: SizeConfig.blockSizeHorizontal * 3.7),
                          height: SizeConfig.blockSizeVertical * 6,
                          width: SizeConfig.blockSizeHorizontal * 100,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 2,
                            ),
                            child: Text(
                              widget.widget.snapQuestions[widget.index]['choices']
                                  [0]['text'],
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 5, color:isDropTapped1 ?  Color.fromRGBO(42, 92, 157, 1.0) : Colors.black ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => onTap2(),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                            )),
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 6,
                              left: SizeConfig.blockSizeHorizontal * 3.7,
                              right: SizeConfig.blockSizeHorizontal * 3.7),
                          height: SizeConfig.blockSizeVertical * 6,
                          width: SizeConfig.blockSizeHorizontal * 100,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 2,
                            ),
                            child: Text(
                              widget.widget.snapQuestions[widget.index]['choices']
                                  [1]['text'],
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                                  color:isDropTapped2 ?  Color.fromRGBO(42, 92, 157, 1.0) : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => onTap3(),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                            ),),
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 12,
                              left: SizeConfig.blockSizeHorizontal * 3.7,
                              right: SizeConfig.blockSizeHorizontal * 3.7),
                          height: SizeConfig.blockSizeVertical * 6,
                          width: SizeConfig.blockSizeHorizontal * 100,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 2,
                            ),
                            child: Text(
                              widget.widget.snapQuestions[widget.index]['choices']
                                  [2]['text'],
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                                  color:isDropTapped3 ?  Color.fromRGBO(42, 92, 157, 1.0) : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => onTap4(),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                              ),
                          ),
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 18,
                              left: SizeConfig.blockSizeHorizontal * 3.7,
                              right: SizeConfig.blockSizeHorizontal * 3.7),
                          height: SizeConfig.blockSizeVertical * 6,
                          width: SizeConfig.blockSizeHorizontal * 100,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 2,
                            ),
                            child: Text(
                              widget.widget.snapQuestions[widget.index]['choices']
                                  [3]['text'],
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                                  color:isDropTapped4 ?  Color.fromRGBO(42, 92, 157, 1.0) : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                contentBackgroundColor: Colors.white,
                contentPadding: EdgeInsets.all(0),
              ),
            ),
          ),
          expansionButton(submitDropdown),
        ],
      ),
    );
  }


  onTap1() {
    setState(() {
      isDropTapped1 = true;
      isDropTapped2 = false;
      isDropTapped3 = false;
      isDropTapped4 = false;
      textDropdown = widget.widget.snapQuestions[widget.index]['choices']
      [0]['text'];
    });
    Timer(Duration(milliseconds: 200), () {
      _controller.collapse();
    });

  }

  onTap2() {
    setState(() {
      isDropTapped1 = false;
      isDropTapped2 = true;
      isDropTapped3 = false;
      isDropTapped4 = false;
      textDropdown = widget.widget.snapQuestions[widget.index]['choices']
      [1]['text'];
    });
    Timer(Duration(milliseconds: 200), () {
      _controller.collapse();
    });
  }

  onTap3() {
    setState(() {
      isDropTapped1 = false;
      isDropTapped2 = false;
      isDropTapped3 = true;
      isDropTapped4 = false;
      textDropdown = widget.widget.snapQuestions[widget.index]['choices']
      [2]['text'];
    });
    Timer(Duration(milliseconds: 200), () {
      _controller.collapse();
    });
  }

  onTap4() {
    setState(() {
      isDropTapped1 = false;
      isDropTapped2 = false;
      isDropTapped3 = false;
      isDropTapped4 = true;
      textDropdown = widget.widget.snapQuestions[widget.index]['choices']
      [3]['text'];
    });
    Timer(Duration(milliseconds: 200), () {
      _controller.collapse();
    });
  }

  submitDropdown() {
    isDropTapped1
        ? saveDrop1()
        : isDropTapped2
            ? saveDrop2()
            : isDropTapped3
                ? saveDrop3()
                : isDropTapped4 ? saveDrop4() : print('None');
  }

  saveDrop1() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][0]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    widget.refresh();
  }

  saveDrop2() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][1]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    widget.refresh();
  }

  saveDrop3() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][2]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
    widget.refresh();
  }

  saveDrop4() {
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.widget.doc,
        context,
        widget.widget.username,
        widget.widget.snapQuestions[widget.index]['choices'][3]['text'],
        widget.widget.snapQuestions[widget.index]['title']);
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

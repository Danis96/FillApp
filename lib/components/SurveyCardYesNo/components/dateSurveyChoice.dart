import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/labelContainer.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/submitButton.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String userAnswer;
bool fieldColor1 = false;
bool fieldColor2 = false;
bool fieldColor3 = false;

class DateChoice extends StatefulWidget {
  final String username;
  final Function notifyParent;
  final DocumentSnapshot doc;
  final String title;
  String day, month, year;
  DateChoice(
      {this.doc,
      this.notifyParent,
      this.username,
      this.title,
      this.day,
      this.month,
      this.year});

  @override
  _DateChoiceState createState() => _DateChoiceState();
}

TextEditingController dayController = TextEditingController(text: '');
TextEditingController monthController = TextEditingController(text: '');
TextEditingController yearController = TextEditingController(text: '');
String selectedDay, selectedMonth, selectedYear;

class _DateChoiceState extends State<DateChoice> {
  @override
  void initState() {
    super.initState();
    dayController.text = '';
    monthController.text = '';
    yearController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Column(
        key: ValueKey(widget.title),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(45.0),
                right: ScreenUtil.instance.setWidth(45.0),
                top: ScreenUtil.instance.setWidth(15.0)),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    LabelContainer(
                        text: MyText().day,
                        leftMargin: 0.0,
                        containerWidth: 80.0),
                    Container(
                      width: ScreenUtil.instance.setWidth(80.0),
                      height: ScreenUtil.instance.setWidth(61.0),
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setWidth(5.0)),
                      child: TextFormField(
                        readOnly: true,
                        textAlign: TextAlign.center,
                        onTap: () => isSummary
                            ? null
                            : showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (selectedDay == null) {
                                        selectedDay = '1';
                                      }
                                      widget.day = selectedDay;
                                      dayController.text = widget.day;
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        height: ScreenUtil.instance
                                            .setHeight(265.0),
                                        child:
                                            _buildItemPicker('day', context)),
                                  );
                                }),
                        enableSuggestions: false,
                        style: TextStyle(color: Colors.black),
                        controller: dayController,
                        decoration: InputDecoration(
                          hasFloatingPlaceholder: false,
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: fieldColor1
                                  ? MyColor().error
                                  : MyColor().black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: fieldColor1
                                  ? MyColor().error
                                  : MyColor().black,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: MyColor().error,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: MyColor().error,
                            ),
                          ),
                        ),
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    LabelContainer(
                        text: MyText().month,
                        leftMargin: 10.0,
                        containerWidth: 80.0),
                    Container(
                      width: ScreenUtil.instance.setWidth(80.0),
                      height: ScreenUtil.instance.setWidth(61.0),
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setWidth(5.0),
                          left: ScreenUtil.instance.setWidth(10.0)),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        onTap: () => isSummary
                            ? null
                            : showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (selectedMonth == null) {
                                        selectedMonth = '1';
                                      }
                                      widget.month = selectedMonth;
                                      monthController.text = widget.month;
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        height: ScreenUtil.instance
                                            .setHeight(265.0),
                                        child:
                                            _buildItemPicker('month', context)),
                                  );
                                }),
                        enableSuggestions: false,
                        style: TextStyle(color: Colors.black),
                        controller: monthController,
                        decoration: InputDecoration(
                          hasFloatingPlaceholder: false,
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: fieldColor2
                                  ? MyColor().error
                                  : MyColor().black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: fieldColor2
                                  ? MyColor().error
                                  : MyColor().black,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: MyColor().error,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: MyColor().error,
                            ),
                          ),
                        ),
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    LabelContainer(
                        text: MyText().year,
                        leftMargin: 10.0,
                        containerWidth: 125.0),
                    Container(
                      width: ScreenUtil.instance.setWidth(125.0),
                      height: ScreenUtil.instance.setWidth(61.0),
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setWidth(5.0),
                          left: ScreenUtil.instance.setWidth(10.0)),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        onTap: () => isSummary
                            ? null
                            : showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (selectedYear == null) {
                                        selectedYear = '2020';
                                      }
                                      widget.year = selectedYear;
                                      yearController.text = widget.year;
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        height: ScreenUtil.instance
                                            .setHeight(265.0),
                                        child:
                                            _buildItemPicker('year', context)),
                                  );
                                }),
                        enableSuggestions: false,
                        style: TextStyle(color: Colors.black),
                        controller: yearController,
                        decoration: InputDecoration(
                          hasFloatingPlaceholder: false,
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: fieldColor3
                                  ? MyColor().error
                                  : MyColor().black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: fieldColor3
                                  ? MyColor().error
                                  : MyColor().black,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: MyColor().error,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(33.5)),
                            borderSide: BorderSide(
                              color: MyColor().error,
                            ),
                          ),
                        ),
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(3.0)),
            child: fieldColor1 || fieldColor2 || fieldColor3
                ? Text(
                    MyText().emptyFieldSnack,
                    style: TextStyle(color: MyColor().error),
                  )
                : Text(''),
          ),
          isSummary
              ? EmptyContainer()
              : SubmitButton(onPressedFunction: onPressed, isImage: false)
        ],
      ),
    );
  }

  Widget _buildItemPicker(String field, BuildContext context) {
    List<dynamic> items = [];
    if (field == 'year') {
      items.removeRange(0, items.length);
      for (int i = 2020; i >= 1900; i--) {
        items.add(i.toString());
      }
    } else if (field == 'month') {
      items.removeRange(0, items.length);
      for (int i = 1; i <= 12; i++) {
        items.add(i.toString());
      }
    } else if (field == 'day') {
      items.removeRange(0, items.length);
      for (int i = 1; i <= 31; i++) {
        items.add(i.toString());
      }
    }
    return CupertinoPicker(
      itemExtent: 45.0,
      onSelectedItemChanged: (index) {
        if (field == 'year') {
          selectedYear = items[index];
          widget.year = selectedYear;
        } else if (field == 'month') {
          selectedMonth = items[index];
          widget.month = selectedMonth;
        } else if (field == 'day') {
          selectedDay = items[index];
          widget.day = selectedDay;
        }
      },
      looping: true,
      useMagnifier: true,
      magnification: 1.2,
      children: List<Widget>.generate(items.length, (index) {
        return Container(
            alignment: Alignment.center,
            child: Text(
              items[index],
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(25.0)),
            ));
      }),
    );
  }

  onPressed(BuildContext context) {
    if (dayController.text.length == 0) {
      setState(() {
        fieldColor1 = true;
      });
      Timer(Duration(seconds: 3), () {
        setState(() {
          fieldColor1 = false;
        });
      });
    } else if (monthController.text.length == 0) {
      setState(() {
        fieldColor2 = true;
      });
      Timer(Duration(seconds: 3), () {
        setState(() {
          fieldColor2 = false;
        });
      });
    } else if (yearController.text.length == 0) {
      setState(() {
        fieldColor3 = true;
      });
      Timer(Duration(seconds: 3), () {
        setState(() {
          fieldColor3 = false;
        });
      });
    } else {
      setState(() {
        fieldColor1 = false;
        fieldColor2 = false;
        fieldColor3 = false;
      });
      userAnswer = dayController.text +
          '/' +
          monthController.text +
          '/' +
          yearController.text;
      FirebaseCrud().updateListOfUsernamesAnswersSurvey(
          widget.doc, context, widget.username, userAnswer, widget.title);
      widget.notifyParent();
      selectedDay = '1';
      selectedMonth = '1';
      selectedYear = '2020';
    }
  }
}

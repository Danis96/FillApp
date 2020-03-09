import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String userAnswer;
bool fieldColor1 = false;
bool fieldColor2 = false;
bool fieldColor3 = false;
String day = '', month = '', year = '';

class DateChoice extends StatefulWidget {
  final String username;
  final Function() notifyParent;
  final DocumentSnapshot doc;
  final String title;
  DateChoice({this.doc, this.notifyParent, this.username, this.title});

  @override
  _DateChoiceState createState() => _DateChoiceState();
}

class _DateChoiceState extends State<DateChoice> {
  TextEditingController dayController = TextEditingController(text: day);

  TextEditingController monthController = TextEditingController(text: month);

  TextEditingController yearController = TextEditingController(text: year);

  String selectedDay, selectedMonth, selectedYear;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    width: ScreenUtil.instance.setWidth(100.0),
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(20.0),
                        left: ScreenUtil.instance.setWidth(10.0)),
                    child: Text(
                      'Day',
                      style: TextStyle(
                          color: MyColor().black,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'LoewNextArabic',
                          fontSize: ScreenUtil.instance.setSp(18.0)),
                    ),
                  ),
                  Container(
                    width: ScreenUtil.instance.setWidth(100.0),
                    height: ScreenUtil.instance.setWidth(61.0),
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(5.0),
                        left: ScreenUtil.instance.setWidth(10.0)),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      readOnly: true,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  if (selectedDay == null) {
                                    selectedDay = '1';
                                  }
                                  print(selectedDay);
                                  day = selectedDay;
                                  dayController.text = day;
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    height:
                                        ScreenUtil.instance.setHeight(265.0),
                                    child: _buildItemPicker('day', context)),
                              );
                            });
                      },
                      enableSuggestions: false,
                      style: TextStyle(color: Colors.black),
                      controller: dayController,
                      decoration: InputDecoration(
                        hasFloatingPlaceholder: false,
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        labelText: 'Day',
                        labelStyle: TextStyle(color: MyColor().black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
                          borderSide: BorderSide(
                            color:
                                fieldColor1 ? MyColor().error : MyColor().black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
                          borderSide: BorderSide(
                            color:
                                fieldColor1 ? MyColor().error : MyColor().black,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
                          borderSide: BorderSide(
                            color: MyColor().error,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
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
                  Container(
                    alignment: Alignment.centerLeft,
                    width: ScreenUtil.instance.setWidth(100.0),
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(20.0),
                        left: ScreenUtil.instance.setWidth(10.0)),
                    child: Text('Month',
                      style: TextStyle(
                          color: MyColor().black,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'LoewNextArabic',
                          fontSize: ScreenUtil.instance.setSp(18.0)),
                    ),
                  ),
                  Container(
                    width: ScreenUtil.instance.setWidth(100.0),
                    height: ScreenUtil.instance.setWidth(61.0),
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(5.0),
                        left: ScreenUtil.instance.setWidth(10.0)),
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  if (selectedMonth == null) {
                                    selectedMonth = '1';
                                  }
                                  print(selectedMonth);
                                  month = selectedMonth;
                                  monthController.text = month;
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    height:
                                        ScreenUtil.instance.setHeight(265.0),
                                    child: _buildItemPicker('month', context)),
                              );
                            });
                      },
                      enableSuggestions: false,
                      style: TextStyle(color: Colors.black),
                      controller: monthController,
                      decoration: InputDecoration(
                        hasFloatingPlaceholder: false,
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        labelText: 'Month',
                        labelStyle: TextStyle(color: MyColor().black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
                          borderSide: BorderSide(
                            color:
                                fieldColor2 ? MyColor().error : MyColor().black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
                          borderSide: BorderSide(
                            color:
                                fieldColor2 ? MyColor().error : MyColor().black,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
                          borderSide: BorderSide(
                            color: MyColor().error,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
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
                  Container(
                    alignment: Alignment.centerLeft,
                    width: ScreenUtil.instance.setWidth(150.0),
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(20.0),
                        left: ScreenUtil.instance.setWidth(10.0)),
                    child: Text('Year',
                    style: TextStyle(
                          color: MyColor().black,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'LoewNextArabic',
                          fontSize: ScreenUtil.instance.setSp(18.0)),
                    ),
                  ),
                  Container(
                    width: ScreenUtil.instance.setWidth(150.0),
                    height: ScreenUtil.instance.setWidth(61.0),
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(5.0),
                        left: ScreenUtil.instance.setWidth(10.0)),
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  if (selectedYear == null) {
                                    selectedYear = '2020';
                                  }
                                  print(selectedYear);
                                  year = selectedYear;
                                  yearController.text = year;
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    height:
                                        ScreenUtil.instance.setHeight(265.0),
                                    child: _buildItemPicker('year', context)),
                              );
                            });
                      },
                      enableSuggestions: false,
                      style: TextStyle(color: Colors.black),
                      controller: yearController,
                      decoration: InputDecoration(
                        // floati ngLabelBehavior: FloatingLabelBehavior.never,
                        hasFloatingPlaceholder: false,
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        labelText: 'Year',
                        labelStyle: TextStyle(color: MyColor().black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
                          borderSide: BorderSide(
                            color:
                                fieldColor3 ? MyColor().error : MyColor().black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
                          borderSide: BorderSide(
                            color:
                                fieldColor3 ? MyColor().error : MyColor().black,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
                          borderSide: BorderSide(
                            color: MyColor().error,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
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
          Container(
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(3.0)),
            child: fieldColor1 || fieldColor2 || fieldColor3
                ? Text(
                    MyText().emptyFieldSnack,
                    style: TextStyle(color: MyColor().error),
                  )
                : Text(''),
          ),
          Container(
              width: ScreenUtil.instance.setWidth(316.0),
              height: ScreenUtil.instance.setHeight(55.0),
              margin: EdgeInsets.only(
                  top: ScreenUtil.instance.setWidth(20.0),
                  left: ScreenUtil.instance.setWidth(54.0),
                  right: ScreenUtil.instance.setWidth(55.0)),
              child: RaisedButton(
                color: MyColor().black,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(33.5),
                ),
                onPressed: () => onPressed(context),
                child: Text(MyText().btnSubmit,
                    style: TextStyle(fontSize: 18, color: MyColor().white)),
              )),
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
        print(items[index]);
        if (field == 'year') {
          selectedYear = items[index];
          year = selectedYear;
          print(selectedYear);
        } else if (field == 'month') {
          selectedMonth = items[index];
          month = selectedMonth;
          print(selectedMonth);
        } else if (field == 'day') {
          selectedDay = items[index];
          day = selectedDay;
          print(selectedDay);
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
      print(userAnswer);
      FirebaseCrud().updateListOfUsernamesAnswersSurvey(
          widget.doc, context, widget.username, userAnswer, widget.title);
      widget.notifyParent();
      day = '';
      month = '';
      year = '';
    }
  }
}

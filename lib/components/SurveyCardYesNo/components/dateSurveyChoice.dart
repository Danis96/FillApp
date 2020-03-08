import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String userAnswer;

class DateChoice extends StatelessWidget {
  final String username;
  final Function() notifyParent;
  final DocumentSnapshot doc;
  final String title;
  DateChoice({this.doc, this.notifyParent, this.username, this.title});

  TextEditingController dayController = TextEditingController(text: '');
  TextEditingController monthController = TextEditingController(text: '');
  TextEditingController yearController = TextEditingController(text: '');
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
              Container(
                width: ScreenUtil.instance.setWidth(115.0),
                height: ScreenUtil.instance.setWidth(61.0),
                margin: EdgeInsets.only(
                    top: ScreenUtil.instance.setWidth(20.0),
                    left: ScreenUtil.instance.setWidth(10.0)),
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              if(selectedDay == null) {
                                selectedDay = '1';
                              }
                              print(selectedDay);
                              dayController.text = selectedDay;
                            },
                            child: Container(
                                height: ScreenUtil.instance.setHeight(265.0),
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
                        vertical: 25.0, horizontal: 25.0),
                    labelText: 'Day',
                    labelStyle: TextStyle(color: MyColor().black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      borderSide: BorderSide(color: MyColor().black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      borderSide: BorderSide(color: MyColor().black),
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
              Container(
                width: ScreenUtil.instance.setWidth(130.0),
                height: ScreenUtil.instance.setWidth(61.0),
                margin: EdgeInsets.only(
                    top: ScreenUtil.instance.setWidth(20.0),
                    left: ScreenUtil.instance.setWidth(10.0)),
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              if(selectedMonth == null) {
                                selectedMonth = '1';
                              }
                              print(selectedMonth);
                              monthController.text = selectedMonth;
                            },
                            child: Container(
                                height: ScreenUtil.instance.setHeight(265.0),
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
                        vertical: 25.0, horizontal: 25.0),
                    labelText: 'Month',
                    labelStyle: TextStyle(color: MyColor().black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      borderSide: BorderSide(color: MyColor().black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      borderSide: BorderSide(color: MyColor().black),
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
              Container(
                width: ScreenUtil.instance.setWidth(115.0),
                height: ScreenUtil.instance.setWidth(61.0),
                margin: EdgeInsets.only(
                    top: ScreenUtil.instance.setWidth(20.0),
                    left: ScreenUtil.instance.setWidth(10.0)),
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              if(selectedYear == null) {
                                selectedYear = '2020';
                              }
                              print(selectedYear);
                              yearController.text = selectedYear;
                            },
                            child: Container(
                                height: ScreenUtil.instance.setHeight(265.0),
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
                        vertical: 25.0, horizontal: 25.0),
                    labelText: 'Year',
                    labelStyle: TextStyle(color: MyColor().black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      borderSide: BorderSide(color: MyColor().black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      borderSide: BorderSide(color: MyColor().black),
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
        if (field == 'year') {
          selectedYear = items[index];
        } else if (field == 'month') {
          selectedMonth = items[index];
        } else if (field == 'day') {
          selectedDay = items[index];
        }
      },
      looping: true,
      useMagnifier: true,
      magnification: 1.2,
      children: List<Widget>.generate(items.length, (index) {
        return Container(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                items[index],
                style: TextStyle(fontSize: ScreenUtil.instance.setSp(25.0)),
              ),
            ));
      }),
    );
  }

  onPressed(BuildContext context) {
    userAnswer = dayController.text +
        '/' +
        monthController.text +
        '/' +
        yearController.text;
        print(userAnswer);
        FirebaseCrud().updateListOfUsernamesAnswersSurvey(
            doc, context, username, userAnswer, title);
        FirebaseCrud()
            .updateListOfUsernamesThatGaveAnswersSurvey(doc, context, username);
        notifyParent();
   }
}
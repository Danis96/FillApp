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

  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  List<String> days = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
  ];

  List<String> months = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ];

  int selectedItem = 0;

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
                          return Container(
                              height: ScreenUtil.instance.setHeight(280.0),
                              child: _buildItemPicker(days, 'day', context));
                        });
                  },
                  enableSuggestions: false,
                  style: TextStyle(color: Colors.black),
                  controller: dayController,
                  decoration: InputDecoration(
                    // floati ngLabelBehavior: FloatingLabelBehavior.never,
                    hasFloatingPlaceholder: false,
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 35.0),
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
                        elevation: 1.0,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              height: ScreenUtil.instance.setHeight(280.0),
                              child:
                                  _buildItemPicker(months, 'month', context));
                        });
                  },
                  enableSuggestions: false,
                  style: TextStyle(color: Colors.black),
                  controller: monthController,
                  decoration: InputDecoration(
                    hasFloatingPlaceholder: false,
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 35.0),
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
                          return Container(
                              height: ScreenUtil.instance.setHeight(280.0),
                              child: _buildItemPicker(days, 'year', context));
                        });
                  },
                  enableSuggestions: false,
                  style: TextStyle(color: Colors.black),
                  controller: yearController,
                  decoration: InputDecoration(
                    // floati ngLabelBehavior: FloatingLabelBehavior.never,
                    hasFloatingPlaceholder: false,
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 35.0),
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

  Widget _buildItemPicker(
      List<dynamic> items, String field, BuildContext context) {
    if (field == 'year') {
      items.removeRange(0, items.length);
      for (int i = 2020; i >= 1900; i--) {
        items.add(i.toString());
      }
    }
    return CupertinoPicker(
      itemExtent: 45.0,
      onSelectedItemChanged: null,
      children: new List<Widget>.generate(items.length, (index) {
        return ListTile(
            title: Container(
                alignment: Alignment.center, child: Text(items[index])),
            onTap: () => print(items[index]));
      }),
    );
  }

  selectItem(String item, BuildContext context, String field) {
    print(field + ' ' + item);
    // switch (field) {
    //   case 'day':
    //     dayController.text = item;
    //     print(item);
    //     break;
    //   case 'month':
    //     monthController.text = item;
    //     print(item);
    //     break;
    //   case 'year':
    //     yearController.text = item;
    //     print(item);
    //     break;
    //   default:
    // }
    Navigator.pop(context);
    
  }

  onPressed(BuildContext context) {
    userAnswer = dayController.text +
        '/' +
        monthController.text +
        '/' +
        yearController.text;
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        doc, context, username, userAnswer, title);
    FirebaseCrud()
        .updateListOfUsernamesThatGaveAnswersSurvey(doc, context, username);
    notifyParent();
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/labelContainer.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/submitButton.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String userAnswer;
bool fieldColor1 = false;
TextEditingController dayController = TextEditingController(text: '');
String selectedDay;

class DayDateField extends StatefulWidget {
  final String username;
  final Function notifyParent;
  final DocumentSnapshot doc;
  final String title;
  String day;
  DayDateField(
      {Key key,
      this.title,
      this.notifyParent,
      this.username,
      this.day,
      this.doc})
      : super(key: key);

  @override
  _DayDateFieldState createState() => _DayDateFieldState();
}

class _DayDateFieldState extends State<DayDateField> {

  @override
  void initState() {
    super.initState();
    dayController.text = '';
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
          Column(
            children: <Widget>[
              LabelContainer(
                  text: MyText().day, leftMargin: 0.0, containerWidth: 300.0),
              Container(
                width: ScreenUtil.instance.setWidth(327.0),
                height: ScreenUtil.instance.setWidth(61.0),
                margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(5.0)),
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
                                  height: ScreenUtil.instance.setHeight(265.0),
                                  child: _buildItemPicker(context)),
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
                      borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      borderSide: BorderSide(
                        color: fieldColor1 ? MyColor().error : MyColor().black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      borderSide: BorderSide(
                        color: fieldColor1 ? MyColor().error : MyColor().black,
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
          Container(
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(3.0)),
            child: fieldColor1
                ? Text(
                    AppLocalizations.of(context).translate('thisFiledCantBeEmpty'),
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
    } else {
      setState(() {
        fieldColor1 = false;
      });
      userAnswer = dayController.text;
      FirebaseCrud().updateListOfUsernamesAnswersSurvey(
          widget.doc, context, widget.username, userAnswer, widget.title);
      widget.notifyParent();
      selectedDay = '1';
    }
  }

  Widget _buildItemPicker(BuildContext context) {
    List<dynamic> items = [];
    items.removeRange(0, items.length);
    for (int i = 1; i <= 31; i++) {
      items.add(i.toString());
    }

    return CupertinoPicker(
      itemExtent: 45.0,
      onSelectedItemChanged: (index) {
        selectedDay = items[index];
        widget.day = selectedDay;
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
}

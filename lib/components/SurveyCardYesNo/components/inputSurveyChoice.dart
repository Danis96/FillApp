import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String userAnswer;

class InputChoice extends StatelessWidget {
  final String username;
  final Function() notifyParent;
  final DocumentSnapshot doc;
  final String title;
  InputChoice({this.doc, this.notifyParent, this.username, this.title});

 
  TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: ScreenUtil.instance.setWidth(327.0),
          height: ScreenUtil.instance.setWidth(61.0),
          margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(20.0)),
          child: TextFormField(
            enableSuggestions: false,
            style: TextStyle(color: Colors.black),
            controller: answerController,
            decoration: InputDecoration(
              // floati ngLabelBehavior: FloatingLabelBehavior.never,
              hasFloatingPlaceholder: false,
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 25.0, horizontal: 35.0),
              labelText: MyText().placeholderInput,
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
          child: Text(MyText().btnSubmit, style: TextStyle(fontSize: 18, color: MyColor().white)),
        )),
      ],
    );
  }

  onPressed(BuildContext context) {
      userAnswer = answerController.text;
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        doc, context, username, userAnswer, title);
    FirebaseCrud().updateListOfUsernamesThatGaveAnswersSurvey(
        doc, context, username);
    notifyParent();
  }
}

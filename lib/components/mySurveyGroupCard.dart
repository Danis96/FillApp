/// Yes No Card class
///
/// This class contains model for flash yes and no question card.
///
/// Imports:
///   MyColor constant class with all colors
///   Cloud_firestore for connection to the firebase
///   ScreenUtil class for respnsive desing
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/statuSurvey.dart';
import 'package:fillproject/components/SurveyCardYesNo/surveyCard.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/components/myProgressNumbers.dart';
import 'package:fillproject/components/myQuestion.dart';
import 'package:fillproject/components/myQuestionSAR.dart';
import 'package:fillproject/dashboard/survey.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySurveyGroupCard extends StatefulWidget {
  final PasswordArguments arguments;
  final String name, username, usernameSecond;
  final int answered, total, sar, userSar;
  final DocumentSnapshot doc, userDoc;
  final List<dynamic> snapQuestions, usernameFinal;

  MySurveyGroupCard({
    this.arguments,
    this.sar,
    this.userSar,
    this.name,
    this.answered,
    this.total,
    this.snapQuestions,
    this.username,
    this.doc,
    this.userDoc,
    this.usernameFinal,
    this.usernameSecond,
  });

  @override
  _MySurveyGroupCard createState() => _MySurveyGroupCard();
}

class _MySurveyGroupCard extends State<MySurveyGroupCard>
    with AutomaticKeepAliveClientMixin<MySurveyGroupCard> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    if (usernameFinal.contains(widget.username) == false &&
        usernameFinal.contains(usernameSecond) == false) {
      isCompleted = false;
    } else {
      isCompleted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);
    return GestureDetector(
      onTap: () {
        if (!isCompleted) {
          // List<dynamic> lista = doc.data['questions'];
          // // print(lista[1]['is_branching']);
          // for(int i = 0; i < lista.length; i++) {
          //   print(lista[i]['is_branching']);
          //   if(lista[i]['is_branching'] == 'yes') {
          //     lista.insert(0, lista[i]);
          //     break;
          //   }
          // }
          // print('Lista nakon pomjeranja!!!');
          // for(int i = 0; i < lista.length; i++) {
          //   print(lista[i]['is_branching']);
          // }

          //FirebaseJson().importSurveyJson(),
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => SurveyCard(
                userDoc: widget.userDoc,
                sarSurvey: widget.sar,
                userSar: widget.userSar,
                  arguments: widget.arguments,
                  isCompleted: setColor,
                  doc: widget.doc,
                  username: widget.username,
                  snapQuestions: widget.snapQuestions,
                  total: widget.total)));
        }
      },
      child: Container(
          key: widget.key,
          width: ScreenUtil.instance.setWidth(340.0),
          height: ScreenUtil.instance.setHeight(265.0),
          margin: EdgeInsets.only(
              left: ScreenUtil.instance.setWidth(30.0),
              right: ScreenUtil.instance.setWidth(30.0),
              bottom: ScreenUtil.instance.setWidth(25.0)),
          decoration: BoxDecoration(
              border: Border.all(
                  color: isCompleted ? MyColor().black : MyColor().black,
                  width: 3.0),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: isCompleted ? MyColor().white : MyColor().black),
          child: Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil.instance.setWidth(37.0),
                  right: ScreenUtil.instance.setWidth(37.0),
                  top: ScreenUtil.instance.setWidth(15.0)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil.instance.setWidth(5.0)),
                          child: MyQuestionSAR(
                            text: '+' + widget.sar.toString() + ' SAR',
                            isCompleted: isCompleted,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil.instance.setWidth(5.0),
                              left: ScreenUtil.instance.setWidth(83.0)),
                          child: MyProgressNumbers(
                              isCompleted: isCompleted,
                              answered: isCompleted ? widget.total : 0,
                              total: widget.total),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setWidth(100.0)),
                      child: MyQuestion(
                          isCompleted: isCompleted,
                          question: widget.name,
                          containerHeight: ScreenUtil.instance.setHeight(80.0)),
                    ),
                    isCompleted ? StatusSurvey() : EmptyContainer(),
                  ]))),
    );
  }

  setColor() {
    setState(() {
      isCompleted = true;
    });
  }

  @override
  bool get wantKeepAlive => true;
}

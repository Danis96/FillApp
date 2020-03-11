import 'dart:async';

/// Survey class
///
/// This class contains methods and layout for survey page.
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020import 'package:fillproject/components/SurveyCardYesNo/myYesNoSurveyCard.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/components/mySurveyGroupCard.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/models/Survey/surveyModel.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/emptyCont.dart';

var controller = PageController(viewportFraction: 1 / 2, initialPage: 1);
bool isVisible = false, isCompleted = false;
List<dynamic> snapi = [],
    snapQuestions = [],
    usernamesThatAnswers = [],
    usernameFinal = [];
DocumentSnapshot snap, doc;
int userLevel, sar, total, userSar, surveyTarget;
String name, type, usernameSecond;

class SurveyPage extends StatefulWidget {
  final PasswordArguments arguments;
  SurveyPage({Key key, this.arguments}) : super(key: key);

  @override
  _SurveyState createState() => _SurveyState();
}

int counter = 0;

class _SurveyState extends State<SurveyPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 600), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: _onWillPop,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Center(
              child: Container(
            margin: EdgeInsets.only(
                top: ScreenUtil.instance.setWidth(45.0),
                bottom: ScreenUtil.instance.setWidth(15.0)),
            child: Text('Survey List',
                style: TextStyle(
                    color: MyColor().black,
                    fontWeight: FontWeight.w700,
                    fontFamily: "LoewNextArabic",
                    fontStyle: FontStyle.normal,
                    fontSize: ScreenUtil.instance.setSp(24.0))),
          )),
          FutureBuilder(
            future: FirebaseCheck().getUserUsername(widget.arguments.username),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      snap = snapshot.data[index];
                      userLevel = snap.data['level'];
                      usernameSecond = snap.data['username_second'];
                      userSar = snap.data['sar'];
                      if (counter == 0) {
                        saroviOffline = userSar;
                        counter = 1;
                      }
                      return EmptyContainer();
                    });
              }
              return EmptyContainer();
            },
          ),
          Container(
            height: ScreenUtil.instance.setHeight(650.0),
            child: FutureBuilder(

                /// [getQuestions]
                ///
                /// future function that executes 500 miliseconds after
                /// [getUserUsername] function, & recieve [userLevel] ,
                /// variable that we get from future function above
                future: Future.delayed(Duration(milliseconds: 600)).then(
                    (value) => FirebaseCheck().getSurveyGroups(userLevel)),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (!isVisible) {
                      snapi = snapshot.data
                          .map((doc) => Survey.fromDocument(doc))
                          .toList();
                      isVisible = true;
                    }

                    return ListView.builder(
                        //pageSnapping: true,
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        itemCount: snapi.length,
                        itemBuilder: (BuildContext context, int index) {
                          doc = snapshot.data[index];
                          sar = snapi[index].sarTotal;
                          total = snapi[index].numberOfQuestions;
                          name = snapi[index].name;
                          snapQuestions = snapi[index].questions;
                          questionNumber = snapQuestions.length;
                          usernamesThatAnswers =
                              snapi[index].usersThatGaveAnswers;
                          usernameFinal = snapi[index].usersCompleted;
                          surveyTarget = snapi[index].target;

                          if (usernameFinal.length < surveyTarget) {
                            return MySurveyGroupCard(
                                userSar: userSar,
                                arguments: widget.arguments,
                                usernameFinal: usernameFinal,
                                usernameSecond: usernameSecond,
                                userProgress: usernamesThatAnswers,
                                doc: doc,
                                userDoc: snap,
                                sar: sar,
                                name: name,
                                total: total,
                                snapQuestions: snapQuestions,
                                username: widget.arguments.username);
                          } else {
                            //usernameFinal.removeAt(index);
                            return EmptyContainer();
                          }
                        });
                  }

                  return Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }

  /// [_onWillPop]
  ///
  /// async funstion that creates an exit dialog for our screen
  /// YES / NO
  Future<bool> _onWillPop() async {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(MyText().willQuestion),
            content: new Text(MyText().willQuestion1),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(MyText().willNo),
              ),
              new FlatButton(
                onPressed: () => exit(0),
                child: new Text(MyText().willYes),
              ),
            ],
          ),
        ) ??
        true;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/appBar.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/yesNoSurveyChoices.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/yesNoSurveySarQuestionProgress.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:flutter/material.dart';

class YesNoSurvey extends StatelessWidget {

  final DocumentSnapshot snap;
  YesNoSurvey({this.snap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: FirebaseCheck().getSurveyQuestions('Sport'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return PageView.builder(
                          // itemCount: snap.length,
                          itemBuilder: (BuildContext context, int index) {

 

                          });
                    });
              }
              return CircularProgressIndicator();
            },
          ),
          SurveyAppBar(
            percent: 0.3,
          ),
          YesNoSurveySQP(
            answered: 3,
            answeredFrom: 10,
            sar: 3,
            question: 'What is your favourite tv show?',
          ),
          YesNoSurveyChoices(choice1: 'Yes'),
          YesNoSurveyChoices(choice1: 'No'),
        ],
      ),
    );
  }
}

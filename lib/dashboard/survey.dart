/// Survey class
///
/// This class contains methods and layout for survey page.
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020
import 'package:flutter/material.dart';

class Survey extends StatefulWidget {
  Survey({Key key}) : super(key: key);

  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Ovdje će biti SURVEY-i !!!'),
      ),
    );
  }
}

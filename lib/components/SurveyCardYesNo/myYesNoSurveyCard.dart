import 'package:fillproject/components/SurveyCardYesNo/components/appBar.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/yesNoSurveyChoices.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/yesNoSurveySarQuestionProgress.dart';
import 'package:fillproject/models/Survey/surveyQuestions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YesNoSurvey extends StatefulWidget {
  final List<dynamic> snapQuestions;
  final int total;
  YesNoSurvey({this.snapQuestions, this.total});

  @override
  _YesNoSurveyState createState() => _YesNoSurveyState();
}

class _YesNoSurveyState extends State<YesNoSurvey> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: ScreenUtil.instance.setHeight(height),
            child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                itemCount: widget.snapQuestions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      SurveyAppBar(
                        percent: (index + 1.0) / widget.total,
                      ),
                      YesNoSurveySQP(
                        answered: index + 1,
                        answeredFrom: widget.total,
                        sar: widget.snapQuestions[index]['sar'],
                        question: widget.snapQuestions[index]['title'],
                      ),
                      YesNoSurveyChoices(
                          choice1: widget.snapQuestions[index]['choices'][0]
                              ['text'],
                          notifyParent: refresh),
                      YesNoSurveyChoices(
                          choice1: widget.snapQuestions[index]['choices'][1]
                              ['text'],
                          notifyParent: refresh),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  refresh() {
    _controller.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}

import 'package:fillproject/components/SurveyCardYesNo/components/multipleChoiceSurveyChoices.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultipleMcqAnswers extends StatelessWidget {
  final int numberOfChoices, isSingle, index;
  final widget;
  final Function refresh;
  const MultipleMcqAnswers(
      {Key key,
      this.numberOfChoices,
      this.isSingle,
      this.index,
      this.widget,
      this.refresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(20.0),
          right: ScreenUtil.instance.setWidth(20.0)),
      child: Column(
        children: <Widget>[
          MultipleChoiceSurveyChoices(
            length: numberOfChoices,
            isSingle: isSingle,
            index: AppLocalizations.of(context).translate('a'),
            choice1: widget.snapQuestions[index]['choices'][0]['text'],
            notifyParent: refresh,
            username: widget.username,
            title: widget.snapQuestions[index]['title'],
            doc: widget.doc,
          ),
          MultipleChoiceSurveyChoices(
            length: numberOfChoices,
            isSingle: isSingle,
            index:  AppLocalizations.of(context).translate('b'),
            choice1: widget.snapQuestions[index]['choices'][1]['text'],
            notifyParent: refresh,
            username: widget.username,
            title: widget.snapQuestions[index]['title'],
            doc: widget.doc,
          ),
          MultipleChoiceSurveyChoices(
            length: numberOfChoices,
            isSingle: isSingle,
            index:  AppLocalizations.of(context).translate('c'),
            choice1: widget.snapQuestions[index]['choices'][2]['text'],
            notifyParent: refresh,
            username: widget.username,
            title: widget.snapQuestions[index]['title'],
            doc: widget.doc,
          ),
          MultipleChoiceSurveyChoices(
            length: numberOfChoices,
            isSingle: isSingle,
            index: AppLocalizations.of(context).translate('d'),
            choice1: widget.snapQuestions[index]['choices'][3]['text'],
            notifyParent: refresh,
            username: widget.username,
            title: widget.snapQuestions[index]['title'],
            doc: widget.doc,
          ),
        ],
      ),
    );
  }
}

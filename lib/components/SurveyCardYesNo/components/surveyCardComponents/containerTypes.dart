import 'dart:async';

import 'package:fillproject/components/SurveyCardYesNo/components/inputSurveyChoice.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/choiceCont.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/dateWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/imageWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/inputWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/mcqWidget.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/submitButton.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/yesNoWidget.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';

class ContainerTypes extends StatefulWidget {
  final widget;
  final int index, number, isSingle, numberOfQuestions;
  final Function refresh, isCompleted;
  final String type, branching, branchingChoice;
  var user;
  final List<dynamic> answers;
  ContainerTypes(
      {Key key,
      this.isCompleted,
      this.isSingle,
      this.numberOfQuestions,
      this.refresh,
      this.index,
      this.widget,
      this.answers,
      this.number,
      this.type,
      this.user,
      this.branchingChoice,
      this.branching})
      : super(key: key);

  @override
  _ContainerTypesState createState() => _ContainerTypesState();
}

class _ContainerTypesState extends State<ContainerTypes> {
  List<String> listOfItems;
  @override
  void initState() {
    super.initState();
    List<String> listOfItemsPreview;
    if (isSummary) {
      listOfItemsPreview = clickedAnswer.split(', ');
    }
    isSummary
        ? listOfItems = listOfItemsPreview
        : listOfItems = [
            widget.widget.snapQuestions[widget.index]['choices'][0]['text'],
            widget.widget.snapQuestions[widget.index]['choices'][1]['text'],
            widget.widget.snapQuestions[widget.index]['choices'][2]['text'],
            widget.widget.snapQuestions[widget.index]['choices'][3]['text']
          ];
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case 'yesno':
        return YesNoWidget(
            widget: widget.widget,
            index: widget.index,
            refresh: widget.refresh,
            branching: widget.branching,
            branchingChoice: widget.branchingChoice,
            isCompleted: widget.isCompleted,
            answers: widget.answers);
      case 'input':
        return InputWidget(
            widget: widget.widget,
            index: widget.index,
            refresh: widget.refresh,
            numberOfQuestions: widget.numberOfQuestions,
            number: widget.number);
      case 'mcq':
        return McqWidget(
            widget: widget.widget,
            index: widget.index,
            refresh: widget.refresh,
            isSingle: widget.isSingle,
            numberOfQuestions: widget.numberOfQuestions,
            number: widget.number);
      case 'date':
        return DateWidget(
            widget: widget.widget,
            index: widget.index,
            refresh: widget.refresh,
            numberOfQuestions: widget.numberOfQuestions,
            number: widget.number);
      case 'image':
        return ImageWidget(
            widget: widget.widget,
            index: widget.index,
            refresh: widget.refresh,
            isSingle: widget.isSingle);
      case 'order':
        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(height: 400.0, child: lista()),
            isSummary
              ? EmptyContainer()
              : SubmitButton(
                  onPressedFunction: onPressed,
                  isImage: false,
                  text: (widget.number + 1) == widget.numberOfQuestions
                      ? AppLocalizations.of(context).translate('submitLast')
                      : AppLocalizations.of(context).translate('submit'))
          ],
        );
      default:
        return EmptyContainer();
    }
  }

  onPressed(BuildContext context) {
    userAnswer = listOfItems.toString();
    if (userAnswer.length == 0) {
      setState(() {
        fieldColor = true;
      });
      Timer(Duration(seconds: 3), () {
        setState(() {
          fieldColor = false;
        });
      });
    } else {
      setState(() {
        fieldColor = false;
      });
      // FirebaseCrud().updateListOfUsernamesAnswersSurvey(
      //     widget.doc, context, widget.username, userAnswer, widget.title);
      offlineAnswers.add(userAnswer);
      FocusScope.of(context).requestFocus(new FocusNode());
      widget.refresh();
    }
  }

  //Metoda koja vrši ordering kada user drag-a neki choice
  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      var item = listOfItems.removeAt(oldIndex);
      listOfItems.insert(newIndex, item);
    });
  }

  Widget lista() {
    return 
    isSummary
                ? Column(
                    children: <Widget>[
                      ChoiceContainer(
                        number: widget.number,
                        numberOfQuestions: widget.numberOfQuestions,
                        index: AppLocalizations.of(context).translate('a'),
                        choice1: listOfItems[0],
                        notifyParent: widget.refresh,
                        username: widget.widget.username,
                        title: widget.widget.snapQuestions[widget.index]
                            ['title'],
                        doc: widget.widget.doc,
                      ),
                      ChoiceContainer(
                        number: widget.number,
                        numberOfQuestions: widget.numberOfQuestions,
                        index: AppLocalizations.of(context).translate('a'),
                        choice1: listOfItems[1],
                        notifyParent: widget.refresh,
                        username: widget.widget.username,
                        title: widget.widget.snapQuestions[widget.index]
                            ['title'],
                        doc: widget.widget.doc,
                      ),
                      ChoiceContainer(
                        number: widget.number,
                        numberOfQuestions: widget.numberOfQuestions,
                        index: AppLocalizations.of(context).translate('a'),
                        choice1: listOfItems[2],
                        notifyParent: widget.refresh,
                        username: widget.widget.username,
                        title: widget.widget.snapQuestions[widget.index]
                            ['title'],
                        doc: widget.widget.doc,
                      ),
                      ChoiceContainer(
                        number: widget.number,
                        numberOfQuestions: widget.numberOfQuestions,
                        index: AppLocalizations.of(context).translate('a'),
                        choice1: listOfItems[3],
                        notifyParent: widget.refresh,
                        username: widget.widget.username,
                        title: widget.widget.snapQuestions[widget.index]
                            ['title'],
                        doc: widget.widget.doc,
                      )
                    ],
                  )
                //Reorderable List View ciji children su itme-i liste
                : ReorderableListView(
      //Pozivanje metode za reordering
      onReorder: onReorder,
      children: listOfItems
          .map((listIndex) =>
              tileList(AppLocalizations.of(context).translate('a'), listIndex))
          .toList(),
    );
  }

  /// layout za draggable odgovore
  Widget tileList(String index, String choice1) {
    return Column(
      key: UniqueKey(),
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: MyColor().black),
                borderRadius: BorderRadius.all(Radius.circular(33.5)),
                color: MyColor().white),
            width: ScreenUtil.instance.setWidth(350.0),
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0)),
            child: ListTile(
              leading: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: MyColor().black),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: MyColor().black),
                height: ScreenUtil.instance.setHeight(58.0),
                width: ScreenUtil.instance.setWidth(58.0),
                child: Text(index,
                    style: TextStyle(
                        color: MyColor().white,
                        fontWeight: FontWeight.w500,
                        fontFamily: arabic,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil.instance.setSp(18.0))),
              ),
              title: Container(
                alignment: Alignment.centerLeft,
                child: Text(choice1,
                    style: TextStyle(
                        color: MyColor().black,
                        fontWeight: FontWeight.w700,
                        fontFamily: arabic,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil.instance.setSp(18.0))),
              ),
            )),
      ],
    );
  }
}

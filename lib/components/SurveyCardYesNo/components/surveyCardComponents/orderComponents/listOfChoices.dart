import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/multipleChoiceSurveyChoices.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/orderComponents/choiceContainer.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/submitButton.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String userAnswer;
bool fieldColor = false;
int total;

class ListOfChoices extends StatefulWidget {
  final int index, number, numberOfQuestions;
  final String username, title;
  final widget;
  final Function refresh;
  final DocumentSnapshot doc;
  const ListOfChoices(
      {Key key,
      this.doc,
      this.title,
      this.username,
      this.numberOfQuestions,
      this.number,
      this.index,
      this.widget,
      this.refresh})
      : super(key: key);

  @override
  _ListOfChoicesState createState() => _ListOfChoicesState();
}

class _ListOfChoicesState extends State<ListOfChoices> {
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
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(height: ScreenUtil.instance.setHeight(380.0), child: lista()),
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
      FirebaseCrud().updateListOfUsernamesAnswersSurvey(
          widget.doc, context, widget.username, userAnswer, widget.title);
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
    return isSummary
        ? Column(
            children: <Widget>[
              ChoiceContainer(
                number: widget.number,
                numberOfQuestions: widget.numberOfQuestions,
                index: AppLocalizations.of(context).translate('a'),
                choice1: listOfItems[0],
                notifyParent: widget.refresh,
                username: widget.widget.username,
                title: widget.widget.snapQuestions[widget.index]['title'],
                doc: widget.widget.doc,
              ),
              ChoiceContainer(
                number: widget.number,
                numberOfQuestions: widget.numberOfQuestions,
                index: AppLocalizations.of(context).translate('a'),
                choice1: listOfItems[1],
                notifyParent: widget.refresh,
                username: widget.widget.username,
                title: widget.widget.snapQuestions[widget.index]['title'],
                doc: widget.widget.doc,
              ),
              ChoiceContainer(
                number: widget.number,
                numberOfQuestions: widget.numberOfQuestions,
                index: AppLocalizations.of(context).translate('a'),
                choice1: listOfItems[2],
                notifyParent: widget.refresh,
                username: widget.widget.username,
                title: widget.widget.snapQuestions[widget.index]['title'],
                doc: widget.widget.doc,
              ),
              ChoiceContainer(
                number: widget.number,
                numberOfQuestions: widget.numberOfQuestions,
                index: AppLocalizations.of(context).translate('a'),
                choice1: listOfItems[3],
                notifyParent: widget.refresh,
                username: widget.widget.username,
                title: widget.widget.snapQuestions[widget.index]['title'],
                doc: widget.widget.doc,
              )
            ],
          )
        //Reorderable List View ciji children su itme-i liste
        : ReorderableListView(
            //Pozivanje metode za reordering
            onReorder: onReorder,
            children: listOfItems
                .map((listIndex) => tileList(
                    AppLocalizations.of(context).translate('a'), listIndex))
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
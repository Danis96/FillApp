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
  //Lista koja se koristi u Reorderable List View
  List<String> listOfItems;

  //Metoda koja vrši ordering kada user drag-a neki choice
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      var item = listOfItems.removeAt(oldIndex);
      listOfItems.insert(newIndex, item);
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSummary ? ScreenUtil.instance.setHeight(420.0) : null,
      child: Column(
        children: <Widget>[
          Container(
            //Ovaj height ako se ne stavi, onda nestane citava lista i kaze
            //da mu fali height, tj. da je height infinite
            height: !isSummary ? ScreenUtil.instance.setHeight(380.0) : null,
            child: isSummary
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
                    onReorder: _onReorder,
                    children: listOfItems
                        .map((listIndex) => ChoiceContainer(
                              //Svaki child mora imati unique key
                              key: ValueKey(widget.index),
                              number: widget.number,
                              numberOfQuestions: widget.numberOfQuestions,
                              index:
                                  AppLocalizations.of(context).translate('a'),
                              choice1: listIndex,
                              notifyParent: widget.refresh,
                              username: widget.widget.username,
                              title: widget.widget.snapQuestions[widget.index]
                                  ['title'],
                              doc: widget.widget.doc,
                            ))
                        .toList(),
                  ),
          ),
          isSummary
              ? EmptyContainer()
              : SubmitButton(
                  onPressedFunction: onPressed,
                  isImage: false,
                  text: (widget.number + 1) == widget.numberOfQuestions
                      ? AppLocalizations.of(context).translate('submitLast')
                      : AppLocalizations.of(context).translate('submit'))
        ],
      ),
    );
  }
}

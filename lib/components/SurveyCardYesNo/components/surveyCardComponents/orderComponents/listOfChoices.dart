import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/orderComponents/choiceContainer.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/submitButton.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reorderables/reorderables.dart';

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
  List<Widget> listOfItems = [];
  List<String> listOfItemsStrings = [];
  List<String> listOfItemsPreview = [];

  @override
  void initState() {
    super.initState();
     SchedulerBinding.instance.addPostFrameCallback((_) => populateList());
  }

  populateList() {
    setState(() {});
    listOfItemsStrings = [
      widget.widget.snapQuestions[widget.index]['choices'][0]['text'],
      widget.widget.snapQuestions[widget.index]['choices'][1]['text'],
      widget.widget.snapQuestions[widget.index]['choices'][2]['text'],
      widget.widget.snapQuestions[widget.index]['choices'][3]['text']
    ];
    listOfItems = [
      ChoiceContainer(
        number: widget.number,
        numberOfQuestions: widget.numberOfQuestions,
        index: AppLocalizations.of(context).translate('a'),
        choice1: isSummary
            ? listOfItemsPreview[0]
            : widget.widget.snapQuestions[widget.index]['choices'][0]['text'],
        notifyParent: widget.refresh,
        username: widget.widget.username,
        title: widget.widget.snapQuestions[widget.index]['title'],
        doc: widget.widget.doc,
      ),
      ChoiceContainer(
        number: widget.number,
        numberOfQuestions: widget.numberOfQuestions,
        index: AppLocalizations.of(context).translate('b'),
        choice1: isSummary
            ? listOfItemsPreview[1]
            : widget.widget.snapQuestions[widget.index]['choices'][1]['text'],
        notifyParent: widget.refresh,
        username: widget.widget.username,
        title: widget.widget.snapQuestions[widget.index]['title'],
        doc: widget.widget.doc,
      ),
      ChoiceContainer(
        number: widget.number,
        numberOfQuestions: widget.numberOfQuestions,
        index: AppLocalizations.of(context).translate('c'),
        choice1: isSummary
            ? listOfItemsPreview[2]
            : widget.widget.snapQuestions[widget.index]['choices'][2]['text'],
        notifyParent: widget.refresh,
        username: widget.widget.username,
        title: widget.widget.snapQuestions[widget.index]['title'],
        doc: widget.widget.doc,
      ),
      ChoiceContainer(
        number: widget.number,
        numberOfQuestions: widget.numberOfQuestions,
        index: AppLocalizations.of(context).translate('d'),
        choice1: isSummary
            ? listOfItemsPreview[3]
            : widget.widget.snapQuestions[widget.index]['choices'][3]['text'],
        notifyParent: widget.refresh,
        username: widget.widget.username,
        title: widget.widget.snapQuestions[widget.index]['title'],
        doc: widget.widget.doc,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (isSummary) {
      listOfItemsPreview = clickedAnswer.split(', ');
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(height: ScreenUtil.instance.setHeight(340.0), child: lista()),
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
    userAnswer = listOfItemsStrings.toString();
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
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      Widget row = listOfItems.removeAt(oldIndex);
      listOfItems.insert(newIndex, row);
      var rowString = listOfItemsStrings.removeAt(oldIndex);
      listOfItemsStrings.insert(newIndex, rowString);
    });
  }

  Widget lista() {
    ScrollController _scrollController =
        PrimaryScrollController.of(context) ?? ScrollController();
    return Padding(
      padding: EdgeInsets.all(ScreenUtil.instance.setWidth(25.0)),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          ReorderableSliverList(
            delegate: ReorderableSliverChildBuilderDelegate(
                (BuildContext context, int index) => listOfItems[index],
                childCount: listOfItems.length),
            onReorder: _onReorder,
          ),
        ],
      ),
    );
  }
}

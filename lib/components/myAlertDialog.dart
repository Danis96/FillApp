import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String title, content, yes, no;
  final Function notifyParent, emptyAnswers;
  MyAlertDialog(
      {Key key, this.title, this.content, this.yes, this.no, this.notifyParent, this.emptyAnswers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: new Text(content),
      actions: <Widget>[
        new FlatButton(
          onPressed: () => Navigator.pop(context),
          child: new Text(no),
        ),
        new FlatButton(
          onPressed: () => {
            notifyParent(),
            !isSummary ? emptyAnswers() : print(''),
            Navigator.of(context).pop(),
            Navigator.of(context).pop(),
          },
          child: new Text(yes),
        ),
      ],
    );
  }
}

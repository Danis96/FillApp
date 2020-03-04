import 'dart:io';

import 'package:fillproject/components/constants/myText.dart';
/// Profile class
///
/// This class contains methods and layout for profile page.
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

BuildContext ctx;

// @override
// void initState() { 
//   super.initState();
//   askUserToRegister(ctx);
// }

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Container(
      child: Center(child: Text('Ovdje će biti PROFILE !!!')),
    );
  }
}

askUserToRegister(BuildContext context) {
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
        );
    }

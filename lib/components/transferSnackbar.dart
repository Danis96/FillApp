import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';

class MySnackbarTransfer {
  void showSnackbar(
      String snackText, BuildContext context, String snackAction) {
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      elevation: 3,
      backgroundColor: MyColor().black,
      content: Text(
        snackText,
        style: TextStyle(color: MyColor().white),
      ),
      action: SnackBarAction(
        label: snackAction,
        onPressed: () {},
      ),
    ));
  }
}

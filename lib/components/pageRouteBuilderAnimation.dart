import 'package:flutter/material.dart';

class DanisAnimationTween extends PageRouteBuilder {
  final Widget widget;
  DanisAnimationTween({this.widget})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return widget;
            },
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              var begin = Offset(1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
}

class CardAnimationTween extends PageRouteBuilder {
  final Widget widget;
  CardAnimationTween  ({this.widget})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return widget;
            },
            transitionDuration: Duration(milliseconds: 10),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              return ScaleTransition(
                scale: animation,
                alignment: Alignment.center,
                child: child,
              );
            });
}
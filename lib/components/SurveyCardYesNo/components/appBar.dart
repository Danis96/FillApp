import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SurveyAppBar extends StatelessWidget {
  final PasswordArguments arguments;
  final double percent;
  SurveyAppBar({this.arguments, this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          /// top elements
          ///
          /// backbtn and indicator
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil.instance.setWidth(20.0),
                left: ScreenUtil.instance.setWidth(40.0)),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => new AlertDialog(
                      title: Text('Are you sure?'),
                      content: new Text('Do you really want to exit the survey?'),
                      actions: <Widget>[
                        new FlatButton(
                          onPressed: () => Navigator.pop(context),
                          child: new Text(MyText().registerNo),
                        ),
                        new FlatButton(
                         onPressed: () => {
                            Navigator.of(context).pop(),
                            Navigator.of(context).pop(),
                          },
                          child: new Text(MyText().willYes),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil.instance.setWidth(20.0),
                  left: ScreenUtil.instance.setWidth(30.0)),
              child: LinearPercentIndicator(
                width: 170.0,
                lineHeight: 6.0,
                percent: percent,
                progressColor: Colors.white,
              )),
        ],
      ),
    );
  }
}

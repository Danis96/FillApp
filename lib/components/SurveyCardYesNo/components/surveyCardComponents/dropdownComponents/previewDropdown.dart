
import 'package:fillproject/globals.dart';
import 'package:fillproject/utils/size_config.dart';
import 'package:flutter/material.dart';

class PreviewDropdown extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
      child: Column(
        children: <Widget>[
            Center(
              child: Container(
                height: SizeConfig.blockSizeHorizontal * 15,
                width: SizeConfig.blockSizeHorizontal * 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(child: Text(answersFromSummary.toString(), style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 6),))),
            )
        ],
      ),
    );
  }
}

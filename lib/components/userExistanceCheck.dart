import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:flutter/material.dart';


class UserExistanceCheck extends StatelessWidget {
  final String username;
  bool isUserInDB;
  UserExistanceCheck({Key key, this.username, this.isUserInDB}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0,
      width: 0,
      child: FutureBuilder(
        future: FirebaseCheck().doesNameAlreadyExist(username),
        builder: (BuildContext context, AsyncSnapshot<bool> result) {
          if (!result.hasData) {
            return EmptyContainer();
          }
          if (result.data) {
            isUserInDB = true;
            return EmptyContainer();
          } else {
            isUserInDB = false;
            FirebaseCrud().createUser('', '', username, '', 0, 1);
            isUserInDB = true;
            return EmptyContainer();
          }
        },
      ),
    );
  }
}
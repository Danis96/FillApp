import 'package:cloud_firestore/cloud_firestore.dart';

class UsernameAnswers {
  final List<dynamic> usernameAnswers;
  UsernameAnswers({this.usernameAnswers});

  factory UsernameAnswers.fromDocument(DocumentSnapshot doc) {
    return UsernameAnswers(usernameAnswers: doc['list_of_username_answers']);
  }
}

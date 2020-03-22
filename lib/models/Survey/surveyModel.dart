import 'package:cloud_firestore/cloud_firestore.dart';

class Survey {
  final int level, numberOfQuestions, target, sarTotal;
  final String name, type;
  final List<dynamic> questions, usersCompleted, usersAnswers, usersThatGaveAnswers;

  Survey(
      {this.level,
      this.name,
      this.numberOfQuestions,
      this.questions,
      this.sarTotal,
      this.target,
      this.type,
      this.usersCompleted,
      this.usersAnswers,
      this.usersThatGaveAnswers,
      });

    factory Survey.fromDocument(DocumentSnapshot doc) {
        return Survey(
          level: doc['level'],
          name: doc['name'],
          numberOfQuestions: doc['number_of_questions'],
          sarTotal: doc['sar_total'],
          target: doc['target'],
          type: doc['type'],
          questions: doc['questions'],
          usersCompleted: doc['users_completed'],
          usersAnswers: doc['list_of_username_answers'],
          usersThatGaveAnswers: doc['list_of_usernames_that_gave_answers'],
        );
    }
}
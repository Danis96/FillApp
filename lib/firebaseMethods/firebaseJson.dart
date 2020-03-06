/// Firebase JSON  class
///
/// This class contains one method which imports quesitons to database.
///
/// Imports:
///   Cloud_firestore for connection to the firebase
///   Questions JSON class were are questions.
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020
///
import 'package:fillproject/components/questionsLevel1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/questionsSurvey.dart';

final db = Firestore.instance;

class FirebaseJson {
  importJson() {
     QuestionsFlash().questionsFlash.forEach((element) {
      db
          .collection('Questions')
          .add({
            'name': element['name'],
            'type': element['type'],
            'title': element['title'],
            'choices': element['choices'],
            'target': element['target'],
            'sar': element['sar'],
            'level': 1,
            'listOfUsernameAnswers': element['listOfUsernameAnswers'],
            'listOfUsernamesThatGaveAnswers':
                element['listOfUsernamesThatGaveAnswers'],
          })
          .then((value) => {print('unos uspjesan')})
          .catchError((err) {
            print(err);
          });
    });
  }

  /// import survey questions
  /// 
  importSurveyJson() {
     QuestionsForSurvey().qSurvey.forEach((element) {
      db.collection('QuestionsSurvey').add({
         'level':element['level'],
         'name': element['name'],
         'sar_total': element['sar_total'], 
         'target': element['target'],
         'type': element['type'],
         'questions': element['questions'],
         'users_completed': element['users_completed'],
         'number_of_questions': element['number_of_questions']
      }).then((value) => {print('unos uspjesan')})
          .catchError((err) {
            print(err);
          });
     });
  }

}

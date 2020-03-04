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

final db = Firestore.instance;

class FirebaseJson {
  importJson() {
    QuestionsLevel1().questionLevel1.forEach((element) {
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
}

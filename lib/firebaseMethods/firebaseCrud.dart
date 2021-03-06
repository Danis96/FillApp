/// Firebase CRUD  class
///
/// This class contains methods (CRUD) for the app.
///
/// Imports:
///   Cloud_firestore for connection to the firebase
///   Routes
///   Random String class for generating String which is used for custom username for anonymous users
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/pageRouteBuilderAnimation.dart';
import 'package:fillproject/login/loginPage.dart';
import 'package:fillproject/register/registerPage.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

final db = Firestore.instance;

class FirebaseCrud {
  /// create function
  ///
  /// upis u firestore collection
  createUser(String name, String date, String email, String phone, String username, String password,
      int sar, int isAnonymous) async {
    await db.collection('Users').add({
      'email': email,
      'username': username,
      'username_second': '',
      'password': password,
      'phone': phone,
      'is_anonymous': isAnonymous,
      'user_id': randomAlphaNumeric(15),
      'level': 1,
      'sar': sar,
      'transferSar': [],
      'name_and_surname': name,
      'date_of_birth': date,
      'card_number': '',
      'expire_date': '',
      'cc': '',
      'email_profile': ''
    });
  }

  /// create transfer
  ///
  /// upis u firestore collection
  createTransfer(
      String date,
      String nameAndSurname,
      String dateOfBirth,
//      String email,
//      String cardNumber,
//      String expireDate,
//      String cc,
      int tSar) async {
    await db.collection('Transfers').add({
      'date': date,
      'name_and_surname': nameAndSurname,
      'date_of_birth': dateOfBirth,
//      'email': email,
//      'card_number': cardNumber,
//      'expipre_date': expireDate,
//      'cc': cc,
      'transferSar': tSar,
      'dateOfAdminTransfer' : '',
      'isDone': 0
    });
  }

  /// update function for user that is anonymous and wants to become registered user
  ///
  /// we only need to update specific fields,
  /// we don't need to update user_id,
  /// (ako vidis jos koju stvar da je viska izbaci)
  updateUser(DocumentSnapshot doc, String email, String phone, String username, String name, String date,
      String usernameSecond, String password, int sar) async {
    await db.collection('Users').document(doc.documentID).updateData({
      'email': email,
      'username': username,
      'username_second': usernameSecond,
      'name_and_surname': name,
      'date_of_birth': date,
      'password': password,
      'phone':  phone,
      'is_anonymous': 0,
      'sar': sar,
    });
  }

  updateUserOnCompletePRofile(
      DocumentSnapshot doc,
      String nameSurname,
      String dateOfBirth,
//      String email,
//      String cardNumber,
//      String expireDate,
//      String cc
      ) async {
    await db.collection('Users').document(doc.documentID).updateData({
//      'email_profile': email,
      'name_and_surname': nameSurname,
      'date_of_birth': dateOfBirth,
//      'card_number': cardNumber,
//      'expire_date': expireDate,
//      'cc': cc,
    });
  }

  updateSarOnTransfer(
    DocumentSnapshot doc,
    int sar,
    int tSar,
  ) async {
    await db.collection('Users').document(doc.documentID).updateData({
      'sar': sar,
      'transferSar': FieldValue.arrayUnion([tSar])
    });
  }

  /// [updatePassword]
  ///
  /// function that updates users password ,
  /// forgot password
  updatePassword(
      DocumentSnapshot doc, BuildContext context, String password) async {
    await db
        .collection('Users')
        .document(doc.documentID)
        .updateData({'password': '$password'});
    Navigator.of(context).push(CardAnimationTween(widget: LoginPage()));
  }

  /// [updateListOfUsernameAnswers]
  ///
  /// this function updates users answers in db
  updateListOfUsernameAnswers(DocumentSnapshot doc, BuildContext context,
      String username, String choice) async {
    await db.collection('Questions').document(doc.documentID).updateData({
      'listOfUsernameAnswers': FieldValue.arrayUnion(['$username : $choice'])
    });
  }

  /// [updateListOfUsernamesThatGaveAnswers]
  ///
  /// this function updates users that answer questions in db
  updateListOfUsernamesThatGaveAnswers(
      DocumentSnapshot doc, BuildContext context, String username) async {
    await db.collection('Questions').document(doc.documentID).updateData({
      'listOfUsernamesThatGaveAnswers': FieldValue.arrayUnion(['$username'])
    });
  }

  /// [updateUsersSars]
  ///
  /// this function updates users sars when he answers the question
  updateUsersSars(DocumentSnapshot doc, BuildContext context, int sar) async {
    await db
        .collection('Users')
        .document(doc.documentID)
        .updateData({'sar': sar});
  }

  /// [updateListOfUsernamesAnswersSurvey]
  ///
  /// this function updates users that answer questions in db
  updateListOfUsernamesAnswersSurvey(DocumentSnapshot doc, BuildContext context,
      String username, String choice, String title) async {
    await db.collection('QuestionsSurvey').document(doc.documentID).updateData({
      'list_of_username_answers':
          FieldValue.arrayUnion(['$title : $choice : $username']),
    });
  }

  /// [updateListOfUsernamesThatGaveAnswersInSurvey]
  ///
  /// this function updates users that answer questions in db
  updateListOfUsernamesThatGaveAnswersSurvey(
      DocumentSnapshot doc, BuildContext context, String username) async {
    await db.collection('QuestionsSurvey').document(doc.documentID).updateData({
      'users_completed': FieldValue.arrayUnion(['$username'])
    });
  }

  /// [updateListOfUsernamesThatGaveAnswers]
  ///
  /// this function updates users that answer questions in db
  updateListOfUsernamesThatGaveAnswersProgress(
      DocumentSnapshot doc, BuildContext context, String username) async {
    await db.collection('QuestionsSurvey').document(doc.documentID).updateData({
      'list_of_usernames_that_gave_answers':
          FieldValue.arrayUnion(['$username'])
    });
  }

  deleteListOfUsernamesThatGaveAnswersProgress(
      DocumentSnapshot doc, BuildContext context, String username) async {
    await db.collection('QuestionsSurvey').document(doc.documentID).updateData({
      'list_of_usernames_that_gave_answers':
          FieldValue.arrayRemove(['$username'])
    });
  }

  /// Metoda koja se poziva na klik button-a kada na njemu piše 'Register'
  userRegister(BuildContext context, String username) {
    Navigator.of(context).push(
      CardAnimationTween(
        widget: RegisterPage(
            arguments: DidntRecievePinArguments(username: username)),
      ),
    );
  }
  /// metoda koja se poziva na login btn na profilu
  userLogin(BuildContext context) {
    Navigator.of(context).push(CardAnimationTween(
      widget: LoginPage(),
    ));
  }
}

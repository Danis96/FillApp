/// Firebase Check class
///
/// This class contains methods for checking if data exits in firebase
///
/// Imports:
///   Cloud_firestore for connection to the firebase
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCheck {
  /// check if username already exists in db
  ///
  Future<bool> doesNameAlreadyExist(String username) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('Users')
        .where('username', isEqualTo: username)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    return documents.length == 1;
  }

  /// check if pass already exists in db
  ///
  Future<bool> doesPassAlreadyExist(String password, String username) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('Users')
        .where('password', isEqualTo: password)
        .where('username', isEqualTo: username)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    return documents.length == 1;
  }

  /// heck if number already exists in db
  ///
  Future<bool> doesNumberAlreadyExist(String phone) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('Users')
        .where('phone', isEqualTo: phone)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    return documents.length == 1;
  }

  /// heck if number already exists in db
  /// 
  Future<bool> doesEmailAlreadyExist(String email) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('Users')
        .where('email', isEqualTo: email)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    return documents.length == 1;
  }

  /// with [getUser] method , based on entered email we get users info 
  /// and update his password
  Future getUser(String email) async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('Users')
        .where('email', isEqualTo: email)
        .getDocuments();
    return qn.documents;
  }
  
  /// with [getUserUsername] function , based on entered username 
  /// we get users info 
  Future getUserUsername(String username) async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('Users')
        .where('username', isEqualTo: username)
        .getDocuments();
    return  qn.documents;
  }
  
  /// with [getQuestions] function , based on userLevel 
  /// we get users questions 
  Future getQuestions(int userLevel) async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('Questions')
        .where('level', isEqualTo: userLevel)
        .getDocuments();
    return qn.documents;
  }


  /// with [getSurveyQuestions] function , based on survey name 
  /// we get users questions 
  Future getSurveyQuestions(String name) async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('SurveyQuestions')
        .where('name', isEqualTo: name)
        .getDocuments();
    return qn.documents;
  }

}

/// Singin Firebase class
///
/// This class contains one method for singin in anonymous user to firebase.
///
/// Imports:
///  FirebaseMethod to connect to database
///  Firebase_Auth for authentication
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseSignIn {
  /// Anonymous SIGN IN
  ///
  /// on SKIP BUTTON
  Future<void> signInAnonymously(String username) async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }
}
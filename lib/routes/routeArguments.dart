/// Register Arguments class
///
/// This file contains classes for each route .
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

class RegisterArguments {
  final String email;
  final String phone;
  final String username;
  final String verId;

  RegisterArguments({this.email, this.phone, this.username, this.verId});
}

class PasswordArguments {
   final String email;
   final String phone;
   final String username;
   final String password;

   PasswordArguments({this.email, this.phone, this.username, this.password});
}

class UpdatePasswordArguments {
    final String email; 
    final String emailCode;
    UpdatePasswordArguments({this.email, this.emailCode});
}

class DidntRecievePinArguments {
  final String username;
  final String phone;
  DidntRecievePinArguments({this.phone, this.username});
}


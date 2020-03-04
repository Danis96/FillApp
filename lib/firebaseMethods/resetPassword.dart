/// Reset Password class
///
/// This class contains methods and credentials which are sending email to user who send request for reseting password.
///
/// Imports:
///  Mailer class for sending emails to users
///  SMTP_Server package with server which is handeling emails
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'package:fillproject/components/constants/myText.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

String email = "fillproject966@gmail.com";
String password = "kjpu8vk6";

class ResetPassword {
  String recipent;
  ResetPassword({this.recipent});

  Future<void> sendEmail(String recipent, String emailCode) async {
    final smtpServer = gmail(email, password);
    // Creating the Gmail server

    // Create our email message.
    final message = Message()
      ..from = Address(email)
      ..recipients.add(recipent) //recipent email
      ..subject = MyText().subject //subject of the email
      ..text = MyText().emailMsg + '  \n \n$emailCode'; //body of the email

    try {
      final sendReport = await send(message, smtpServer);
      print(MyText().msgSent +
          sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print(MyText().msgNotSent +
          ' \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }
}

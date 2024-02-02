import 'package:flutter/material.dart';
import 'package:ientrance/utils/constants.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'dart:math';
class EmailOTPVerification {

  final String userEmail;
  late String generatedOTP;
  EmailOTPVerification({required this.userEmail}){
    this.generatedOTP = generateOTP();
  }
  String generateOTP() {
    // Generate a random 4-digit number
    int otp = Random().nextInt(9000) + 1000;

    // Convert the number to a string
    return otp.toString();
  }


  Future<List<dynamic>> sendEmail(BuildContext context) async {

    print(Constants.EMAIL);
    String username = Constants.EMAIL; //Your Email
    String password = Constants.APP_PASSWORD;
         // 16 Digits App Password Generated From Google Account

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username, 'OGosh')
      ..recipients.add(userEmail)
      ..subject = 'IO TOPS Email'
      ..text = 'Your OTP for IO_ Tops is ${generatedOTP}'
        ;

    try {
      final sendReport = await send(message, smtpServer);
      // print('Message sent: ' + sendReport.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Mail Send Successfully")));
      return [true, generatedOTP];
    } on MailerException catch (e) {
      // print('Message not sent.');
      // print(e.message);
      // for (var p in e.problems) {
      //   print('Problem: ${p.code}: ${p.msg}');
      // }
      return [false, generatedOTP];
    }
  }
}
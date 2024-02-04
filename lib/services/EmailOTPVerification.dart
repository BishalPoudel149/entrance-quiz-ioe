import 'package:flutter/material.dart';
import 'package:ientrance/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'dart:math';
class EmailOTPVerification {

  final String userEmail;
  final String userName;
  late String generatedOTP;
  late String todayDate;
  EmailOTPVerification({required this.userEmail, required this.userName}){
    this.generatedOTP = generateOTP();
    todayDate = DateFormat('dd MMM, yyyy').format(DateTime.now());
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
      // ..text = 'Your OTP for IO_ Tops is ${generatedOTP}'
      ..html = '''
      <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>OTP Email</title>

    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
      rel="stylesheet"
    />
  </head>
  <body
    style="
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background: #ffffff;
      font-size: 14px;
    "
  >
    <div
      style="
        max-width: 680px;
        margin: 0 auto;
        padding: 45px 30px 60px;
        background: #f4f7ff;
        background-repeat: no-repeat;
        background-size: 800px 452px;
        background-position: top center;
        font-size: 14px;
        color: #434343;
      "
    >
      <header>
        <table style="width: 100%">
          <tbody>
            <tr style="height: 0">
              <td style="text-align: right">
                <span style="font-size: 16px; line-height: 30px; color: #531414"
                  >$todayDate</span
                >
              </td>
            </tr>
          </tbody>
        </table>
      </header>

      <main>
        <div
          style="
            margin: 0;
            margin-top: 70px;
            padding: 92px 30px 115px;
            background: #ffffff;
            border-radius: 30px;
            text-align: center;
          "
        >
          <div style="width: 100%; max-width: 489px; margin: 0 auto">
            <h1
              style="
                margin: 0;
                font-size: 24px;
                font-weight: 500;
                color: #1f1f1f;
              "
            >
              Your OTP
            </h1>
            <p
              style="
                margin: 0;
                margin-top: 17px;
                font-size: 16px;
                font-weight: 500;
              "
            >
              Hey $userName,
            </p>
            <p
              style="
                margin: 0;
                margin-top: 17px;
                font-weight: 500;
                letter-spacing: 0.56px;
              "
            >
              Thank you for choosing
              <span style="font-weight: 600; color: #1f1f1f">IO_ TOPS.</span>
              Please, Do not share this code with others.
            </p>
            <p
              style="
                margin: 0;
                margin-top: 60px;
                font-size: 40px;
                font-weight: 600;
                letter-spacing: 25px;
                color: #ba3d4f;
              "
            >
              $generatedOTP
            </p>
          </div>
        </div>

        <p
          style="
            max-width: 400px;
            margin: 0 auto;
            margin-top: 50px;
            text-align: center;
            font-weight: 500;
            color: #8c8c8c;
          "
        >
          Need help? Ask at
          <a
            href="mailto:archisketch@gmail.com"
            style="color: #499fb6; text-decoration: none"
            >ioe.tops@gmail.com</a
          >
          or visit our
          <a
            href=""
            target="_blank"
            style="color: #499fb6; text-decoration: none"
            >Help Center</a
          >
        </p>
      </main>

      <footer
        style="
          width: 100%;
          max-width: 490px;
          margin: 20px auto 0;
          text-align: center;
          border-top: 1px solid #e6ebf1;
        "
      >
        <p
          style="
            margin: 0;
            margin-top: 40px;
            font-size: 16px;
            font-weight: 600;
            color: #434343;
          "
        >
          IO_ TOPS
        </p>
        <p style="margin: 0; margin-top: 8px; color: #434343">
          Red District, Mars, Solar System.
        </p>
        <div style="margin: 0; margin-top: 16px">
          <a href="" target="_blank" style="display: inline-block">
            <img
              width="36px"
              alt="Facebook"
              src="https://icons.iconarchive.com/icons/yootheme/social-bookmark/256/social-facebook-button-blue-icon.png"
            />
          </a>
          <a
            href=""
            target="_blank"
            style="display: inline-block; margin-left: 8px"
          >
            <img
              width="36px"
              alt="Instagram"
              src="https://icons.iconarchive.com/icons/uiconstock/socialmedia/256/Instagram-icon.png"
          /></a>
          <a
            href=""
            target="_blank"
            style="display: inline-block; margin-left: 8px"
          >
            <img
              width="36px"
              alt="Twitter"
              src="https://icons.iconarchive.com/icons/bokehlicia/pacifica/256/twitter-icon.png"
            />
          </a>
          <a
            href=""
            target="_blank"
            style="display: inline-block; margin-left: 8px"
          >
            <img
              width="36px"
              alt="Youtube"
              src="https://icons.iconarchive.com/icons/papirus-team/papirus-apps/256/youtube-icon.png"
          /></a>
        </div>
        <p style="margin: 0; margin-top: 16px; color: #434343">
          Copyright © 2022 Company. All rights reserved.
        </p>
      </footer>
    </div>
  </body>
</html>

      ''';

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
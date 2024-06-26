import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ientrance/Features/authentication/controllers/signUpController.dart';
import 'package:ientrance/screens/HomeScreen.dart';

import 'package:ientrance/widgets/button_custom.dart';
import 'package:ientrance/widgets/success_modal.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final String generatedOTP;
  const OtpScreen({Key? key, required this.generatedOTP}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _email = "";
  String _otp = "";
  String _status = "";
  int _resendOtpCountdown = 30; // Assuming a 30-second cooldown
  Timer? _resendOtpTimer;
  String typedOTP = "";

  Future<void> sendOTP() async {}

  Future<void> verifyOTP() async {
    if (typedOTP == widget.generatedOTP) {
      SignUpController signUpController = SignUpController.instance;

      signUpController.registerUser(
          signUpController.emailTextController.text.trim(),
          signUpController.passwordTextController.text.trim());

/*      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen(title: "Welcome")));*/
      showModalBottomSheet(
          isDismissible: true,
          isScrollControlled: true,
          context: context,
          builder: ((context) {
            return const Padding(
              padding: EdgeInsets.only(
                  bottom: 20.0), // Adjust the top padding to position the modal
              child: SuccessScreen(
                iconPath: 'assets/images/success.png',
                headingText: "Successfully !",
                subHeadingText: "Congrats ! You are now a registered user.",
              ),
            );
          }));
    } else {
      showModalBottomSheet(
          isDismissible: true,
          isScrollControlled: true,
          context: context,
          builder: ((context) {
            return const Padding(
              padding: EdgeInsets.only(
                  bottom: 20.0), // Adjust the top padding to position the modal
              child: SuccessScreen(
                iconPath: 'assets/images/error.png',
                headingText: "Wrong OTP !",
                subHeadingText: "Please enter valid OTP.",
              ),
            );
          }));
    }
  }

  void startResendTimer() {
    _resendOtpTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendOtpCountdown > 0) {
          _resendOtpCountdown--;
        } else {
          _resendOtpCountdown = 30; // Reset cooldown
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startResendTimer(); // Start the timer when the screen loads
  }

  @override
  void dispose() {
    _resendOtpTimer?.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: SafeArea(
          child: AppBar(

            toolbarHeight: 80.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text("You've got mail !",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                )),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.mail,
                  color: Colors.yellow.shade600,
                  size: 34.0,
                ),
                onPressed: () {},
              ),
            ],
            backgroundColor: Colors.grey.shade200,
            centerTitle: true,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: PinCodeTextField(
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10.6),
                    fieldHeight: 80,
                    fieldWidth: 80,
                    activeFillColor: Colors.black,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey),
                length: 4,
                onCompleted: (code) => _otp = code,
                textStyle: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
                appContext: context,
                onChanged: (String value) {
                  typedOTP = value;
                },
              ),
            ),
            SizedBox(height: 20.0),
            ButtonC(
                buttonText: "VERIFY",
                buttonColor: Colors.green,
                textColor: Colors.white,
                onTap: verifyOTP),
            // ElevatedButton(
            //   onPressed: verifyOTP,
            //   child: Text('Verify OTP'),
            // ),
            SizedBox(height: 20.0),
            Text(
              'Resend OTP in 00:${_resendOtpCountdown.toString().padLeft(2, '0')}', // Dynamically display seconds
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

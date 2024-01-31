import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ientrance/main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _email = "";
  String _otp = "";
  String _status = "";
  int _resendOtpCountdown = 30; // Assuming a 30-second cooldown
  Timer? _resendOtpTimer;

  Future<void> sendOTP() async {}

  Future<void> verifyOTP() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => MyHomePage(title: "Welcome")));
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
      appBar: AppBar(
        title: Text("You've got mail",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
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
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: PinCodeTextField(
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10.6),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.black,
                ),
                length: 4,
                onCompleted: (code) => _otp = code,
                textStyle: TextStyle(fontSize: 20.0),
                appContext: context,
                onChanged: (String value) {},
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: verifyOTP,
              child: Text('Verify OTP'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Resend OTP in 00:${_resendOtpCountdown.toString().padLeft(2, '0')}', // Dynamically display seconds
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

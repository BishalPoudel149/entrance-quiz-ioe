import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ientrance/screens/LoginScreen.dart';
import 'package:ientrance/screens/OtpScreen.dart';
import 'package:ientrance/services/EmailOTPVerification.dart';
import 'package:ientrance/widgets/button_custom.dart';
import 'package:ientrance/widgets/text_field.dart';

import '../widgets/success_modal.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final usernameTextController = TextEditingController();

  void registerUserByGoogle() {}
  void registerUserByApple() {}
  Future<void> registerUserByEmail(BuildContext context) async {
    //to close keyboard when register button is clicked.
    FocusScope.of(context).unfocus();
    // Show loading indicator
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text(
                  'Loading...',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );

    EmailOTPVerification emailVerification = EmailOTPVerification(userEmail: emailTextController.text);
    List<dynamic> emailAndOtpStatus = await emailVerification.sendEmail(context);
    bool isEmailSent = emailAndOtpStatus[0] as bool;
    String otpGenerated = emailAndOtpStatus[1] as String;
    if(isEmailSent){
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => OtpScreen(generatedOTP: otpGenerated,)));
    }
    else{
      showModalBottomSheet(
          isDismissible: true,
          isScrollControlled: true,
          context: context,
          builder: ((context) {
            return  const  Padding(
              padding: EdgeInsets.only(bottom: 20.0), // Adjust the top padding to position the modal
              child: SuccessScreen(
                iconPath: 'assets/images/error.png',
                headingText: "Oops Email Stucked !",
                subHeadingText: "Please check your Email ID once.",
              ),
            );
          })
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Image.asset(
                  'assets/images/logo.png',
                  width: 60,
                  height: 60,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Warm Welcome',
                  style: GoogleFonts.pacifico(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                //username
                CTextBox(
                  hintText: "Username",
                  obscureText: false,
                  controller: usernameTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                //email
                CTextBox(
                  hintText: "Email Address",
                  obscureText: false,
                  controller: emailTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                //password
                CTextBox(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordTextController,
                ),
                //forget password
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         'Forget Password ?',
                //         style: GoogleFonts.singleDay(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                //sign in button.
                ButtonC(
                  buttonText: 'Register',
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  onTap: () => registerUserByEmail(context),
                ),
                //or continue with
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.4,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or Continue With',
                          style: GoogleFonts.singleDay(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade500),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 0.4,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonC(
                      buttonText: 'Google',
                      iconPath: 'assets/images/google.png',
                      onTap: registerUserByGoogle,
                    ),
                    const SizedBox(
                        width: 20), // Adjust the spacing between buttons
                    ButtonC(
                      buttonText: 'Apple',
                      iconPath: 'assets/images/apple.png',
                      onTap: registerUserByApple,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //already user Login
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle the click action here
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          'Already a User ? LogIn',
                          style: GoogleFonts.singleDay(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            color: Colors
                                .blue, // Optional: You can set a different color for the clickable text
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ientrance/screens/SignupScreen.dart';
import 'package:ientrance/widgets/button_custom.dart';
import 'package:ientrance/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  void loginUserByEmail() {
    print("Login Button Clicked. ${emailTextController.text}");
  }

  void loginUserByGoogle() {}
  void loginUserByApple() {}
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
                  'Challenge Yourself Again!',
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password ?',
                        style: GoogleFonts.singleDay(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),

                //sign in button.
                ButtonC(
                  buttonText: 'LogIn',
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  onTap: loginUserByEmail,
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

                SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Allowing horizontal scrolling
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonC(
                        buttonText: 'Google',
                        iconPath: 'assets/images/google.png',
                        onTap: loginUserByGoogle,
                      ),
                      const SizedBox(
                          width: 20), // Adjust the spacing between buttons
                      ButtonC(
                        buttonText: 'Apple',
                        iconPath: 'assets/images/apple.png',
                        onTap: loginUserByApple,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                                builder: (context) => SignupScreen()),
                          );
                        },
                        child: Text(
                          'New Journey with Us ? Register Here',
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

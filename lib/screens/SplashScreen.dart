import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ientrance/screens/LoginScreen.dart';
import 'package:ientrance/screens/OnboardingScreen.dart';
import 'package:ientrance/screens/SignupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_options.dart';
import '../repository/authentication_repository/authentication_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), checkOnboardingAndNavigate);
  }

  Future<void> checkOnboardingAndNavigate() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool onBoardingCompleted = pref.getBool("onboarding") ?? false;

    if (!onBoardingCompleted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      ).then((_) {
        // Initialize repository after navigation
        initializeRepository();
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignupScreen()),
      ).then((_) {
        // Initialize repository after navigation
        initializeRepository();
      });
    }
  }

  void initializeRepository() {
    // Initialize the repository after navigation
    Get.put(AuthenticationRepository());
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 160,
                    height: 160,
                    color: Colors.greenAccent,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("IO_ TOPS",
                      style: GoogleFonts.lato(
                          fontSize: 60, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

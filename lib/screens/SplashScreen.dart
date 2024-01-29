import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ientrance/main.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (_) => const MyHomePage(title: "IO_ TOPS"
              )
          )
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
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
        child:  Column(
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
                  const SizedBox(height: 20,),
                  Text(
                    "IO_ TOPS",
                    style:  GoogleFonts.lato(
                      fontSize: 60,
                      fontWeight: FontWeight.bold
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

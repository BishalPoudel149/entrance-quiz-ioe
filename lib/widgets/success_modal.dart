import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/success.png',
                height: 120,
                width: 120,
              ),
              Text(
                "Successfully !",
                style: GoogleFonts.singleDay(
                    fontWeight: FontWeight.bold,
                    fontSize: 45
                ),),
              SizedBox(height: 20,),
              Text(
                "Congrats ! You are now a registered user.",
                style: GoogleFonts.singleDay(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.normal,
                    fontSize: 30
                ),)
            ],
          ),
        ),
      ),
    );
  }
}

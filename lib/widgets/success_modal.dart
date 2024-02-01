import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SuccessScreen extends StatelessWidget {
  final String iconPath;
  final String headingText ;
  final String subHeadingText ;
  const SuccessScreen({super.key,required this.iconPath, required this.headingText, required this.subHeadingText});

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
                iconPath,
                height: 120,
                width: 120,
              ),
              Text(
                headingText,
                style: GoogleFonts.singleDay(
                    fontWeight: FontWeight.bold,
                    fontSize: 45
                ),),
              SizedBox(height: 20,),
              Text(
                subHeadingText,
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

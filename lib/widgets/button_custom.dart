import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonC extends StatelessWidget {
  final String? iconPath;
  final dynamic buttonColor;
  final dynamic textColor;
  final String buttonText;
  final Function()? onTap;

  const ButtonC({Key? key, this.iconPath = "", this.buttonColor = Colors.grey, this.textColor = Colors.white, required this.buttonText, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Align items to the start (left)
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (iconPath != null && iconPath!.isNotEmpty)
                Image.asset(
                  iconPath!,
                  height: 28,  // Set the height of the icon as per your requirement
                  width: 28,   // Set the width of the icon as per your requirement
                ),
              if (iconPath != null && iconPath!.isNotEmpty)
                SizedBox(width: 12),  // Adjust the spacing between icon and text
              Text(
                buttonText,
                style: GoogleFonts.singleDay(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

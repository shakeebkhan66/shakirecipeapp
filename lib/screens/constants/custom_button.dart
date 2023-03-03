import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class CustomButton extends StatelessWidget {

  String? text;
  VoidCallback? onPressed;
  Color color;

  CustomButton({required this.text, required this.color, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.white,
      highlightColor: thirdColor,
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Container(
          height: 50,
          width: 280,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: firstColor,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white38,
                  offset: Offset(0, 0.1),
                  blurRadius: 10.0,
                )
              ]),
          child: Text(
            text!,
            style: GoogleFonts.oswald(
                color: color, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}


class CustomButtonLogin extends StatelessWidget {

  String? text;
  VoidCallback? onPressed;
  Color color;

  CustomButtonLogin({required this.text, required this.color, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.white,
      highlightColor: thirdColor,
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          height: 40,
          width: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: firstColor,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 0.1),
                  blurRadius: 5.0,
                )
              ]),
          child: Text(
            text!,
            style: GoogleFonts.oswald(
                color: color, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60.0),
            alignment: Alignment.center,
            child: Text(
              "Skabapp",
              style: GoogleFonts.sofia(
                  fontSize: 38.0,
                  color: firstColor.withOpacity(0.9),
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      )),
    );
  }
}

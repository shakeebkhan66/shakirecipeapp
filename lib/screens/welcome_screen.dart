import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'authentication/signup_screen.dart';
import 'constants/colors.dart';
import 'constants/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: firstColor.withOpacity(0.5),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 100.0, left: 25.0),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(seconds: 20),
                      animatedTexts: [
                        TyperAnimatedText('Enjoy',
                            textStyle: GoogleFonts.audiowide(
                                color: Colors.black87,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.0),
                          speed: const Duration(milliseconds: 350),
                          curve: Curves.bounceIn
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 4.0, left: 25.0),
                    // child: Text("cooking",
                    //     style: GoogleFonts.audiowide(
                    //         color: Colors.white,
                    //         fontSize: 30.0,
                    //         fontWeight: FontWeight.w400,
                    //         letterSpacing: 1.0)),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(seconds: 13),
                      animatedTexts: [
                        TyperAnimatedText('cooking',
                            textStyle: GoogleFonts.audiowide(
                                color: thirdColor,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.0),
                            speed: const Duration(milliseconds: 370),
                            curve: Curves.linear,
                        )
                      ],
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 20.0, left: 25.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Delicious and detailed restaurant recipes",
                              style: GoogleFonts.roboto(
                                  color: Colors.black87, fontSize: 13.0)),
                          TextSpan(
                              text: "\non your phone",
                              style: GoogleFonts.roboto(
                                  color: Colors.black87, fontSize: 13.0))
                        ]),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 50.0, right: 10.0),
                      child: Image.asset(
                        "assets/images/wel.png",
                        fit: BoxFit.cover,
                      )),
                  CustomButton(text: "Get started", color: secondColor, onPressed: (){
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

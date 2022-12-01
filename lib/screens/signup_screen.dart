import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myreceipeapp/constants/colors.dart';
import 'package:myreceipeapp/constants/custom_button.dart';
import 'package:myreceipeapp/screens/login_screen.dart';

import '../constants/customtextfield.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signUpScreen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40.0),
              alignment: Alignment.center,
              child: Text(
                "Skabapp",
                style: GoogleFonts.sofia(
                    fontSize: 38.0,
                    color: firstColor.withOpacity(0.9),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 20.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Sign Up to post your recipes",
                        style: GoogleFonts.roboto(
                            color: Colors.black87, fontSize: 12.0)),
                    TextSpan(
                        text: "\nand to see recipes of other's",
                        style: GoogleFonts.roboto(
                            color: Colors.black87, fontSize: 12.0))
                  ]),
                )),
            Container(
              height: 40,
              width: 270,
              margin: const EdgeInsets.only(top: 40.0),
              decoration: BoxDecoration(
                  color: facebookColor,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 0.1),
                      blurRadius: 10.0,
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    FontAwesomeIcons.facebook,
                    color: thirdColor,
                  ),
                  Text(
                    "Log in with Facebook",
                    style: GoogleFonts.openSans(
                        color: thirdColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 140.0,
                    child: Divider(
                      color: firstColor,
                      thickness: 1.0,
                    ),
                  ),
                  Text("OR",
                      style: GoogleFonts.roboto(
                          color: Colors.black87,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(
                    width: 140.0,
                    child: Divider(
                      color: firstColor,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            // TextFormField(
            //   decoration: InputDecoration(
            //       hintText: "Mobile Number or Email",
            //       hintStyle: TextStyle(color: firstColor.withOpacity(0.5)),
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(20.0)),
            //       enabledBorder: OutlineInputBorder(
            //           borderSide: const BorderSide(color: Colors.black54),
            //           borderRadius: BorderRadius.circular(13.0)),
            //       focusedBorder: OutlineInputBorder(
            //           borderSide: const BorderSide(color: firstColor),
            //           borderRadius: BorderRadius.circular(13.0))),
            // )
            const SizedBox(height: 25.0),
            CustomTextField(
              text: "Mobile Number or Email",
            ),
            const SizedBox(height: 10.0),
            CustomTextField(text: "Full Name"),
            const SizedBox(height: 10.0),
            CustomTextField(text: "Username"),
            const SizedBox(height: 10.0),
            CustomTextField(text: "Password"),
            const SizedBox(
              height: 19.0,
            ),
            MaterialButton(
              onPressed: () {},
              splashColor: secondColor,
              hoverColor: firstColor,
              minWidth: 180,
              color: firstColor.withOpacity(0.8),
              child: Text(
                "Sign Up",
                style: GoogleFonts.oswald(color: secondColor, fontSize: 15.0),
              ),
            ),
            const SizedBox(height: 5.0,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Divider(thickness: 2.5, color: firstColor,),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              hoverColor: firstColor,
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 20.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Have an account?",
                          style: GoogleFonts.roboto(
                              color: Colors.black87, fontSize: 15.0)),
                      const WidgetSpan(child: SizedBox(width: 5.0,)),
                      TextSpan(
                          text: "Log in",
                          style: GoogleFonts.roboto(
                              color: facebookColor, fontSize: 18.0))
                    ]),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

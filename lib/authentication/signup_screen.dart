import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myreceipeapp/api/register_api.dart';
import 'package:myreceipeapp/constants/colors.dart';
import 'package:myreceipeapp/constants/custom_button.dart';
import 'package:myreceipeapp/authentication/login_screen.dart';

import '../constants/customtextfield.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signUpScreen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  // TODO TextEditingControllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // TODO Email Validator Regex
  RegExp regExpEmail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\'
      r'[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)'
      r'+[a-zA-Z]{2,}))$');

  // TODO Password Validation Regex
  RegExp regexPassword =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  // TODO Form Validator Key
  final _formKey = GlobalKey<FormState>();

  // TODO Instance of ApiScreen
  ApiScreen apiScreen = ApiScreen();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10.0),
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
                    padding: const EdgeInsets.only(top: 5.0),
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
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      color: facebookLogoColor,
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
                const SizedBox(height: 10.0),
                CustomTextField(
                  myController: emailController,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "Field is required";
                    }else if(!regExpEmail.hasMatch(value)){
                      return "Please enter valid email";
                    }else{
                      return null;
                    }
                  },
                  text: "Mobile Number or Email",
                ),
                const SizedBox(height: 10.0),
                CustomTextField(
                  myController: fNameController,
                    validator: (String? value){
                    if(value!.isEmpty){
                      return "Field is required";
                    }else if(value.length < 3){
                      return "Characters should be at least 3";
                    }else{
                      return null;
                    }
                    },
                    text: "Full Name"
                ),
                const SizedBox(height: 10.0),
                CustomTextField(
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "Field is required";
                    }else{
                      return null;
                    }
                  },
                    myController: usernameController,
                    text: "Username"
                ),
                const SizedBox(height: 10.0),
                CustomTextField(
                    myController: passwordController,
                    validator: (String? value){
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }else if(!regexPassword.hasMatch(value)){
                        return "Enter valid password";
                      }else{
                        return null;
                      }
                    },
                    text: "Password"
                ),
                const SizedBox(height: 10.0),
                CustomTextField(
                    myController: confirmPasswordController,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return "Field is required";
                      }else if(value != passwordController.text){
                        return "Both passwords don't match";
                      }else{
                        return null;
                      }
                    },
                    text: "Confirm Password"
                ),
                const SizedBox(
                  height: 9.0,
                ),
                MaterialButton(
                  onPressed: () {
                    print(_formKey.currentState!.validate());
                    if(_formKey.currentState!.validate()) {
                      print(_formKey.currentState!.validate());
                      print("Success");
                      apiScreen.register(
                        usernameController.text.toString(),
                        emailController.text.toString(),
                        fNameController.text.toString(),
                        passwordController.text.toString(),
                        confirmPasswordController.text.toString(),
                        context,
                      );
                    }else{
                      print("Failed to validate");
                    }
                  },
                  splashColor: secondColor,
                  hoverColor: firstColor,
                  minWidth: 180,
                  color: firstColor.withOpacity(0.8),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.oswald(color: secondColor, fontSize: 15.0),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Divider(
                    thickness: 2.5,
                    color: firstColor,
                  ),
                ),
                InkWell(
                  onTap: () {
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
                          const WidgetSpan(
                              child: SizedBox(
                            width: 5.0,
                          )),
                          TextSpan(
                              text: "Log in",
                              style: GoogleFonts.roboto(
                                  color: facebookLogoColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0))
                        ]),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

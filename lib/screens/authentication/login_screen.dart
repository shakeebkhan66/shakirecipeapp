import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myreceipeapp/screens/authentication/signup_screen.dart';
import '../api/register_api.dart';
import '../constants/colors.dart';
import '../constants/customtextfield.dart';
import '../constants/spinkit_loading_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TODO TextEditingControllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // TODO Form Key
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPassword = true;

  // TODO Email Validator Regex
  RegExp regExpEmail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\'
      r'[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)'
      r'+[a-zA-Z]{2,}))$');

  // TODO Password Validation Regex
  RegExp regexPassword =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  // TODO Instance of ApiScreen
  ApiScreen apiScreen = ApiScreen();

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: secondColor,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 70.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Skabapp",
                      style: GoogleFonts.sofia(
                          fontSize: 38.0,
                          color: firstColor.withOpacity(0.9),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  CustomTextField(
                    myController: emailController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Field is required";
                      } else if (!regExpEmail.hasMatch(value)) {
                        return "Please enter valid email";
                      } else {
                        return null;
                      }
                    },
                    text: "Email",
                  ),
                  const SizedBox(
                    height: 7.0,
                  ),
                  CustomTextFieldPassword(
                      myController: passwordController,
                      isObscure: isPassword,
                      icon: IconButton(
                        onPressed: (){
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(
                          isPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: isPassword ? firstColor : Colors.blueGrey,
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        } else if (!regexPassword.hasMatch(value)) {
                          return 'Enter valid password';
                        } else {
                          return null;
                        }
                      },
                      text: "Password"),
                  MaterialButton(
                    splashColor: secondColor,
                    hoverColor: firstColor,
                    minWidth: 150.0,
                    height: 30.0,
                    color: firstColor.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    onPressed: () {
                      print(_formKey.currentState!.validate());
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = false;
                        });
                        apiScreen.login(emailController.text.toString(),
                            passwordController.text.toString(), context);
                        setState(() {
                          isLoading = true;
                        });
                        print("Validate");
                      } else {
                        print("Not Validate");
                      }
                      // Navigator.pushNamed(context, BottomNavigationBarScreen.routeName);
                    },
                    child: Text(
                      "Log in",
                      style: GoogleFonts.oswald(
                          color: secondColor, fontSize: 15.0),
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
                  Container(
                    height: 40,
                    width: 270,
                    margin: const EdgeInsets.only(top: 40.0),
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
                  const SizedBox(height: 25.0),
                  Text(
                    "Forgot password?",
                    style: GoogleFonts.openSans(
                        color: facebookLogoColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 35.0,
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
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    hoverColor: firstColor,
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 20.0),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Don't have an account?",
                                style: GoogleFonts.roboto(
                                    color: Colors.black87, fontSize: 15.0)),
                            const WidgetSpan(
                                child: SizedBox(
                              width: 5.0,
                            )),
                            TextSpan(
                                text: "Sign Up",
                                style: GoogleFonts.roboto(
                                    color: facebookLogoColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold))
                          ]),
                        )),
                  ),
                ],
              ),
            )),
          );
  }
}

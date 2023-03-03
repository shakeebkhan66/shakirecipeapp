import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/register_api.dart';
import '../constants/colors.dart';
import '../constants/customtextfield.dart';
import '../sharedpreference/sharedpref_class.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  // TODO TextEditingControllers
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var accessToken = MySharedPrefClass.preferences?.getString('Access_Token');
  bool isPassword = true;
  bool isConfirmPassword = true;

  // TODO Form Key
  final _formKey = GlobalKey<FormState>();
  // TODO Password Validation Regex
  RegExp regexPassword =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  // TODO Instance of ApiScreen
  ApiScreen apiScreen = ApiScreen();

  @override
  Widget build(BuildContext context) {
    print("Data ${accessToken}");
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(
        backgroundColor: secondColor,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        title: Text(
          "Change Password",
          style: GoogleFonts.audiowide(
              fontWeight: FontWeight.bold, color: darkJungleGreenColor),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: firstColor,
            )),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0, top: 100),
                child: const Text(
                  "To change password",
                  style: TextStyle(
                      color: firstColor, fontSize: 19, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: const Text(
                  "You need to enter details in given fields",
                  style: TextStyle(
                      color: darkJungleGreenColor, fontSize: 15),
                ),
              ),
              const SizedBox(height: 25.0,),
              CustomTextFieldPassword(
                isObscure: isPassword,
                myController: passwordController,
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
                validator: (String? value){
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }else if(!regexPassword.hasMatch(value)){
                    return "Enter valid password";
                  }else{
                    return null;
                  }
                },
                text: "Password",
              ),
              const SizedBox(height: 10.0),
              CustomTextFieldPassword(
                  isObscure: isConfirmPassword,
                  icon: IconButton(
                    onPressed: (){
                      setState(() {
                        isConfirmPassword = !isConfirmPassword;
                      });
                    },
                    icon: Icon(
                      isConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: isConfirmPassword ? firstColor : Colors.blueGrey,
                    ),
                  ),
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
              const SizedBox(height: 25.0,),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    print("Success");
                    apiScreen.changePassword(
                      passwordController.text.toString(),
                      confirmPasswordController.text.toString(),
                      accessToken,
                      context,
                    );
                    passwordController.clear();
                    confirmPasswordController.clear();
                  }else{
                    print("Failed to validate");
                  }
                },
                splashColor: secondColor,
                hoverColor: firstColor,
                minWidth: 180,
                color: darkJungleGreenColor.withOpacity(0.8),
                child: Text(
                  "Change",
                  style: GoogleFonts.oswald(color: secondColor, fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../api/register_api.dart';
import '../constants/colors.dart';
import '../constants/customtextfield.dart';
import 'login_screen.dart';
import 'dart:io';

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
  bool isPassword = true;
  bool isConfirmPassword = true;
  File? pickedImage;
  String? imagePath;


  // TODO Image Picker
  Future getImage(ImageSource source) async {

    PermissionStatus cameraStatus = await Permission.camera.request();
    if (cameraStatus == PermissionStatus.granted) {
      Fluttertoast.showToast(msg: "Permission Granted");
      await ImagePicker().pickImage(source: source).then((value) {
        if (value != null) {
          imageCropperView(File(value.path));
        }
      });
    }
    else if (cameraStatus == PermissionStatus.denied) {
      Fluttertoast.showToast(msg: "You need to give camera permission to pick image");
    }
    else if(cameraStatus == PermissionStatus.permanentlyDenied) {
      Fluttertoast.showToast(msg: "Now you should go in app setting to give permission");
      openAppSettings();
    }return;

  }

  // TODO Image Cropper
  imageCropperView(File path) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: path.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.green,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Crop Image',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );

    if (croppedImage != null) {
      imageCache.clear();
      setState(() {
        pickedImage = File(croppedImage.path);
        imagePath = base64Encode(pickedImage!.readAsBytesSync());
      });
    } else {
      log("not cropped image");
      return '';
    }
  }



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
                        fontSize: 30.0,
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
                  height: 30,
                  width: 230,
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
                        size: 20,
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
                const SizedBox(height: 10.0),
                CustomTextField(
                    myController: fNameController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Field is required";
                      } else if (value.length < 3) {
                        return "Characters should be at least 3";
                      } else {
                        return null;
                      }
                    },
                    text: "Full Name"
                ),
                const SizedBox(height: 10.0),
                CustomTextField(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Field is required";
                      } else {
                        return null;
                      }
                    },
                    myController: usernameController,
                    text: "Username"
                ),
                const SizedBox(height: 10.0),
                CustomTextFieldPassword(
                  isObscure: isPassword,
                  myController: passwordController,
                  icon: IconButton(
                    onPressed: () {
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
                      return "Enter valid password";
                    } else {
                      return null;
                    }
                  },
                  text: "Password",
                ),
                const SizedBox(height: 10.0),
                CustomTextFieldPassword(
                    isObscure: isConfirmPassword,
                    icon: IconButton(
                      onPressed: () {
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
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Field is required";
                      } else if (value != passwordController.text) {
                        return "Both passwords don't match";
                      } else {
                        return null;
                      }
                    },
                    text: "Confirm Password"
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       pickedImage != null ? const Text("Picked Done", style: TextStyle(
                          color: darkJungleGreenColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),) : const Text("Add Image", style: TextStyle(
                           color: darkJungleGreenColor,
                           fontWeight: FontWeight.w500,
                           fontSize: 17),),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) =>
                                AlertDialog(
                                  title: const Text("Select One",
                                    style: TextStyle(fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                        color: darkJungleGreenColor),),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              getImage(ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Camera",
                                              style: TextStyle(fontSize: 15.0,
                                                  color: Colors.black87),)
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              getImage(ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Gallery",
                                              style: TextStyle(fontSize: 15.0,
                                                  color: Colors.black87),)
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                          );
                        },
                        child: pickedImage != null ? CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                              child: Image.file(File(pickedImage!.path), fit: BoxFit.cover,)),
                        ) : CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/images/image.png"),
                        )
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 9.0,
                ),
                MaterialButton(
                  onPressed: () {
                    print(_formKey.currentState!.validate());
                    if (_formKey.currentState!.validate()) {
                      print(_formKey.currentState!.validate());
                      print("Success");
                      print("Image ${pickedImage!.path}");
                      apiScreen.register(
                        usernameController.text.toString(),
                        emailController.text.toString(),
                        fNameController.text.toString(),
                        passwordController.text.toString(),
                        confirmPasswordController.text.toString(),
                        imagePath,
                        context,
                      );
                      usernameController.clear();
                      emailController.clear();
                      fNameController.clear();
                      passwordController.clear();
                      confirmPasswordController.clear();
                    } else {
                      print("Failed to validate");
                    }
                  },
                  splashColor: secondColor,
                  hoverColor: firstColor,
                  minWidth: 150,
                  height: 30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  color: firstColor.withOpacity(0.8),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.oswald(
                        color: secondColor, fontSize: 13.0),
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

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myreceipeapp/screens/api/register_api.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import '../constants/colors.dart';
import '../constants/customtextfield.dart';
import '../sharedpreference/sharedpref_class.dart';

class AddPostScreen extends StatefulWidget {
  static const routeName = '/addPostScreen';
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  String? selectedCategory;
  bool value = false;
  File? pickedImage;
  String? imagePath;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ApiScreen apiScreen = ApiScreen();

  // TODO TextEditingControllers
  TextEditingController productNameController = TextEditingController();
  // TextEditingController usernameController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController howToMakeController = TextEditingController();

  // TODO Recipe Categories
  List<String> categoriesList = [
    "Tea",
    "Rice",
    "Pizza",
    "Karhai",
    "Cake",
    "Vegetable",
    "Salad",
    "Roti"
  ];

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
    } else if (cameraStatus == PermissionStatus.denied) {
      Fluttertoast.showToast(
          msg: "You need to give camera permission to pick image");
    } else if (cameraStatus == PermissionStatus.permanentlyDenied) {
      Fluttertoast.showToast(
          msg: "Now you should go in app setting to give permission");
      openAppSettings();
    }
    return;
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
        appBar: AppBar(
          backgroundColor: darkJungleGreenColor,
          elevation: 10.0,
          automaticallyImplyLeading: false,
          title: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Add Recipe",
                style: GoogleFonts.audiowide(
                    color: secondColor,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0),
              )),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text(
                                  "Select One",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: darkJungleGreenColor),
                                ),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            getImage(ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Camera",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black87),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            getImage(ImageSource.gallery);
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Gallery",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black87),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          child: pickedImage != null
                              ? CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                      child: Image.file(
                                    File(pickedImage!.path),
                                    fit: BoxFit.cover,
                                  )),
                                )
                              : CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.white,
                                  child: Image.asset("assets/images/image.png"),
                                ))),
                  const SizedBox(height: 10.0),
                  CustomTextField1(
                    hintText: "product name",
                    labelText: "ProductName",
                    icon: Icons.edit,
                    myController: productNameController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Field is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  // CustomTextField1(
                  //   hintText: "username",
                  //   labelText: "enter your username",
                  //   icon: Icons.person,
                  //   myController: usernameController,
                  //   validator: (String? value) {
                  //     if (value!.isEmpty) {
                  //       return "Field is required";
                  //     } else if (value.length < 3) {
                  //       return "Characters should be at least 3";
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  // ),
                  const SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.center,
                    // padding: const EdgeInsets.only(left: 15.0),
                    child: DropdownButton(
                      value: selectedCategory,
                      iconDisabledColor: Colors.black,
                      iconEnabledColor: firstColor,
                      focusColor: firstColor.withOpacity(0.4),
                      hint: Text(
                        "Please select a category",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            color: firstColor.withOpacity(0.9)),
                      ),
                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: firstColor,
                      ),

                      // Array list of items
                      items: categoriesList.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(
                                color: darkJungleGreenColor,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFieldIncreaseSize(
                    text: "Enter ingredients",
                    myController: ingredientsController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Field is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFieldIncreaseSize(
                    text: "How to make",
                    myController: howToMakeController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Field is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print(
                            "ProductName ${productNameController.text.toString()}");
                        print(
                            "ingredientsController ${ingredientsController.text.toString()}");
                        print(
                            "howToMakeController ${howToMakeController.text.toString()}");
                        print("selectedCategory ${selectedCategory}");
                        // print("Username ${usernameController.text.toString()}");
                        var username = MySharedPrefClass.preferences!
                            .getString("Username");
                        print("ProductName ${pickedImage!.path},");
                        apiScreen.createRecipe(
                          productNameController.text.toString(),
                          username,
                          ingredientsController.text.toString(),
                          howToMakeController.text.toString(),
                          selectedCategory,
                          pickedImage!.path,
                          context,
                        );
                      } else {
                        print("Failed to validate");
                      }
                    },
                    splashColor: secondColor,
                    hoverColor: firstColor,
                    minWidth: 150,
                    height: 35,
                    color: firstColor.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: Text(
                      "Publish",
                      style: GoogleFonts.oswald(
                          color: secondColor, fontSize: 15.0),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

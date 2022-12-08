import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myreceipeapp/constants/custom_button.dart';
import 'package:myreceipeapp/constants/customtextfield.dart';

import '../../constants/colors.dart';

class AddPostScreen extends StatefulWidget {
  static const routeName = '/addPostScreen';
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children:  [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 30.0, left: 95.0),
                child: Text("Add Recipe", style: GoogleFonts.audiowide(
                    color: firstColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0),)
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50,),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/image.png"),
                ),
              ),
              const SizedBox(height: 30.0),
              CustomTextField1(hintText: "product name", labelText: "ProductName", icon: Icons.edit,),
              const SizedBox(height: 15.0),
              CustomTextFieldIncreaseSize(text: "Enter ingredients"),
              const SizedBox(height: 15.0),
              CustomTextFieldIncreaseSize(text: "How to make"),
              const SizedBox(height: 25.0,),
              MaterialButton(
                onPressed: () {},
                splashColor: secondColor,
                hoverColor: firstColor,
                minWidth: 200,
                height: 45,
                color: firstColor.withOpacity(0.8),
                child: Text(
                  "Publish",
                  style: GoogleFonts.oswald(color: secondColor, fontSize: 15.0),
                ),
              ),
              const SizedBox(height: 10.0,),
            ],
          ),
        ),
      )
    );
  }
}

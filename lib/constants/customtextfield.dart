import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTextField extends StatelessWidget {
  String? text;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  CustomTextField({Key? key, required this.text, required this.myController, required this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        controller: myController,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: firstColor.withOpacity(0.5)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black54),
                borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: firstColor),
                borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}

class CustomTextFieldPassword extends StatelessWidget {
  String? text;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  Widget? icon;
  bool isObscure;
  CustomTextFieldPassword({Key? key, required this.isObscure, this.icon, required this.text, required this.myController, required this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        controller: myController,
        validator: validator,
        obscureText: isObscure,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          suffixIcon: icon,
            hintText: text,
            hintStyle: TextStyle(color: firstColor.withOpacity(0.5)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black54),
                borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: firstColor),
                borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}


class CustomTextField1 extends StatelessWidget {
  String? hintText;
  String? labelText;
  IconData? icon;

  CustomTextField1({Key? key, required this.hintText, this.labelText, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        cursorColor: firstColor,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: firstColor,),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
            labelText: labelText,
            labelStyle: const TextStyle(color: firstColor, fontSize: 12.0, fontWeight: FontWeight.w500),
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)),
            enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.black54),
                borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: firstColor),
                borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}

class CustomTextFieldIncreaseSize extends StatelessWidget {
  String? text;
  CustomTextFieldIncreaseSize({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        maxLines: 10,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: firstColor.withOpacity(0.5)),
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)),
            enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.black54),
                borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: firstColor),
                borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}



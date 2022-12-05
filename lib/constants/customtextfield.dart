import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTextField extends StatelessWidget {
  String? text;
  CustomTextField({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
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


class CustomTextField1 extends StatelessWidget {
  String? text;
  CustomTextField1({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
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



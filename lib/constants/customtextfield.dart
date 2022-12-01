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

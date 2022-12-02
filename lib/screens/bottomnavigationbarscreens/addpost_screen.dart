import 'package:flutter/material.dart';

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
      body: Center(
        child: Text("Add Post"),
      ),
    );
  }
}

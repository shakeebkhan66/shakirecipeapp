import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MyProfileScreen extends StatefulWidget {
  static const routeName = '/myProfileScreen';
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: secondColor,
      body: Center(
        child: Text("Profile Screen"),
      ),
    );
  }
}

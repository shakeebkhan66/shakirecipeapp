import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myreceipeapp/constants/colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: firstColor,
      // color: Color(0xffFdfcfa),
      // color: Color(0xff0b0704),
      child: const Center(
        child: SpinKitChasingDots(
          color: secondColor,
          duration:  Duration(milliseconds: 700),
          size: 40.0,
        ),
      ),
    );
  }
}
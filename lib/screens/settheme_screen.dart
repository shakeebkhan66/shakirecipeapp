import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';


class SetThemeScreen extends StatefulWidget {
  const SetThemeScreen({Key? key}) : super(key: key);

  @override
  State<SetThemeScreen> createState() => _SetThemeScreenState();
}

class _SetThemeScreenState extends State<SetThemeScreen> {

  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(
        backgroundColor: secondColor,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        title: Text(
          "Set Theme",
          style: GoogleFonts.audiowide(
              fontWeight: FontWeight.bold, color: darkJungleGreenColor),
        ),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_outlined, color: firstColor,)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text('Light'),
              value: valuefirst,
              onChanged: (bool? value) {
                setState(() {
                  valuefirst = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Dark'),
              value: valuesecond,
              onChanged: (bool? value) {
                setState(() {
                  valuefirst = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

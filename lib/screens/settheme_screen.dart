import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';
import 'models/model_theme.dart';


// class SetThemeScreen extends StatefulWidget {
//   const SetThemeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SetThemeScreen> createState() => _SetThemeScreenState();
// }
//
// class _SetThemeScreenState extends State<SetThemeScreen> {
//
//   bool valueFirst = false;
//   bool valueSecond = false;
//   bool isVisibility = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondColor,
//       appBar: AppBar(
//         backgroundColor: secondColor,
//         elevation: 0.5,
//         automaticallyImplyLeading: false,
//         title: Text(
//           "Set Theme",
//           style: GoogleFonts.audiowide(
//               fontWeight: FontWeight.bold, color: darkJungleGreenColor),
//         ),
//         leading: IconButton(
//             onPressed: (){
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back_ios_outlined, color: firstColor,)),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             CheckboxListTile(
//               title: const Text('Light'),
//               value: valueFirst,
//               onChanged: (bool? value) {
//                 setState(() {
//                   valueFirst = value!;
//                 });
//               },
//             ),
//             CheckboxListTile(
//               title: const Text('Dark'),
//               value: valueSecond,
//               onChanged: (bool? value) {
//                 setState(() {
//                   valueSecond = value!;
//                 });
//               },
//             ),
//             Row(
//               children: [
//                 MaterialButton(
//                   onPressed: (){
//                     setState(() {
//                       isVisibility = !isVisibility;
//                     });
//                   },
//                   child: Text("Press"),
//                 ),
//                 Visibility(
//                   visible: isVisibility,
//                     child: const Icon(Icons.check, color: Colors.green,))
//               ],
//             ),
//             Row(
//               children: [
//                 MaterialButton(
//                   onPressed: (){
//                     setState(() {
//                       isVisibility = !isVisibility;
//                     });
//                   },
//                   child: Text("Press"),
//                 ),
//                 Visibility(
//                     visible: isVisibility,
//                     child: const Icon(Icons.check, color: Colors.green,))
//               ],
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }

class SetThemeScreen extends StatefulWidget {
  const SetThemeScreen({super.key});

  @override
  State<SetThemeScreen> createState() => _SetThemeScreenState();
}

class _SetThemeScreenState extends State<SetThemeScreen> {
  var val;

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
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
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_outlined, color: firstColor,)),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Light',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: darkJungleGreenColor,
                          letterSpacing: -1.0
                      ),
                    ),
                    Radio(
                      value: "light",
                      groupValue: val,
                      activeColor: firstColor,
                      onChanged: (value) {
                        setState(() {
                          val = value;
                          themeNotifier.isDark = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dark',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: darkJungleGreenColor,
                          letterSpacing: -1.0
                      ),
                    ),
                    Radio(
                      value: "dark",
                      groupValue: val,
                      activeColor: firstColor,
                      onChanged: (value) {
                        setState(() {
                          val = value;
                          themeNotifier.isDark = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
  }
}

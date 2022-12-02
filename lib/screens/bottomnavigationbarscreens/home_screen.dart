import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myreceipeapp/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int? tappedIndex;

  List<String> namesList = ["Home", "Profile", "Product", "Logout"];
  List iconsList = [Icons.home, Icons.person, Icons.production_quantity_limits, Icons.logout];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      body: Column(
        children: [
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 65.0, left: 25.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Simple way to find",
                      style: GoogleFonts.forum(
                          color: darkJungleGreenColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1.0,
                          fontSize: 32.0)),
                  TextSpan(
                      text: "\nsweet recipes",
                      style: GoogleFonts.forum(
                          color: firstColor,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -1.0,
                          fontSize: 25.0))
                ]),
              )),
          Container(
            padding: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
            child: TextFormField(
              style: const TextStyle(color: darkJungleGreenColor),
              decoration: InputDecoration(
                  fillColor: firstColor.withOpacity(0.2),
                  filled: true,
                  hintText: "Recipe",
                  hintStyle:
                      TextStyle(color: darkJungleGreenColor.withOpacity(0.5)),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: darkJungleGreenColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(color: darkJungleGreenColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: firstColor))),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
              child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  "Recipes",
                  style: GoogleFonts.roboto(
                      fontSize: 15.0, color: darkJungleGreenColor, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200.0),
                child: Text(
                  "view all",
                  style: GoogleFonts.roboto(
                      fontSize: 15.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          )),
          const SizedBox(height: 25.0),
          Container(
            height: 100,
            width: 100,
            color: firstColor.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}

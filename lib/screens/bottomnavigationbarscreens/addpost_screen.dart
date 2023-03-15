import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/customtextfield.dart';

class AddPostScreen extends StatefulWidget {
  static const routeName = '/addPostScreen';
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  String? selectedCategory;
  bool value = false;

  // TODO TextEditingControllers
  TextEditingController productNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController howToMakeController = TextEditingController();

  // TODO Recipe Categories
  List<String> categoriesList = [
    "Tea",
    "Rice",
    "Pizza",
    "Karhai",
    "Cake",
    "Vegetable",
    "Salad",
    "Roti"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondColor,
        appBar: AppBar(
          backgroundColor: darkJungleGreenColor,
          elevation: 10.0,
          automaticallyImplyLeading: false,
          title: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Add Recipe",
                style: GoogleFonts.audiowide(
                    color: secondColor,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0),
              )),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/image.png"),
                  ),
                ),
                const SizedBox(height: 10.0),
                CustomTextField1(
                  hintText: "product name",
                  labelText: "ProductName",
                  icon: Icons.edit,
                  myController: productNameController,
                ),
                CustomTextField1(
                  hintText: "username",
                  labelText: "enter your username",
                  icon: Icons.person,
                  myController: usernameController,
                ),
                const SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.center,
                  // padding: const EdgeInsets.only(left: 15.0),
                  child: DropdownButton(
                    value: selectedCategory,
                    iconDisabledColor: Colors.black,
                    iconEnabledColor: firstColor,
                    focusColor: firstColor.withOpacity(0.4),
                    hint: Text(
                      "Please select a category",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          color: firstColor.withOpacity(0.9)),
                    ),
                    // Down Arrow Icon
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: firstColor,
                    ),

                    // Array list of items
                    items: categoriesList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: const TextStyle(
                              color: darkJungleGreenColor,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                CustomTextFieldIncreaseSize(
                  text: "Enter ingredients",
                  myController: ingredientsController,
                ),
                const SizedBox(height: 10.0),
                CustomTextFieldIncreaseSize(
                  text: "How to make",
                  myController: howToMakeController,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                MaterialButton(
                  onPressed: () {},
                  splashColor: secondColor,
                  hoverColor: firstColor,
                  minWidth: 150,
                  height: 35,
                  color: firstColor.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: Text(
                    "Publish",
                    style:
                        GoogleFonts.oswald(color: secondColor, fontSize: 15.0),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ));
  }
}

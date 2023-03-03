import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../allrecipescategories/allrecipes_screen.dart';
import '../allrecipescategories/biryanirecipe_screen.dart';
import '../allrecipescategories/cakerecipe_screen.dart';
import '../allrecipescategories/karhairecipe_screen.dart';
import '../allrecipescategories/rotirecipe_screen.dart';
import '../allrecipescategories/saladrecipe_screen.dart';
import '../allrecipescategories/tearecipe_screen.dart';
import '../allrecipescategories/vegatablesrecipe_screen.dart';
import '../constants/colors.dart';
import '../models/recipesmodel_class.dart';


class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TODO Recipes List
  List<RecipesModelClass> recipesList = [
    RecipesModelClass(text: "All", image: "assets/images/all.jpg"),
    RecipesModelClass(text: "Tea", image: "assets/images/tea.jpg"),
    RecipesModelClass(text: "Rice", image: "assets/images/biryani.jpg"),
    RecipesModelClass(text: "karhai", image: "assets/images/karhai.jpg"),
    RecipesModelClass(text: "Cake", image: "assets/images/cake.jpg"),
    RecipesModelClass(text: "Roti", image: "assets/images/roti.jpg"),
    RecipesModelClass(
        text: "Vegatables", image: "assets/images/vegetables.jpg"),
    RecipesModelClass(text: "Salad", image: "assets/images/salad.jpg"),
  ];

  // TODO To Check on Move Specific Recipe Screen on Click
  checkItemName(String recipeName) {
    if (recipeName == "All") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AllRecipes()));
    } else if (recipeName == "Rice") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const RiceRecipes()));
    } else if (recipeName == "Cake") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CakeRecipes()));
    } else if (recipeName == "karhai") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const KarhaiRecipes()));
    } else if (recipeName == "Roti") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const RotiRecipes()));
    } else if (recipeName == "Salad") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SaladRecipes()));
    } else if (recipeName == "Tea") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const TeaRecipes()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const VegatablesRecipes()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: secondColor,
      body: ListView(
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
                      fontSize: 15.0,
                      color: darkJungleGreenColor,
                      fontWeight: FontWeight.w700),
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
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: recipesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          checkItemName(recipesList[index].text.toString());
                        },
                        child: Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              border: Border.all(color: firstColor)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(80.0),
                              child: Image.asset(
                                recipesList[index].image!,
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        recipesList[index].text!,
                        style: GoogleFonts.roboto(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: darkJungleGreenColor),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
              child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(
                  "Specials for you",
                  style: GoogleFonts.roboto(
                      fontSize: 15.0,
                      color: darkJungleGreenColor,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 148.0),
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
          const SizedBox(height: 30.0),

          SizedBox(
            height: 255,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: recipesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          checkItemName(recipesList[index].text.toString());
                        },
                        child: Container(
                          height: 250,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: firstColor.withOpacity(0.2),
                              border: Border.all(color: darkJungleGreenColor)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                recipesList[index].image!,
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

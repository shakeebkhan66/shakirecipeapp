import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class FavouriteRecipesScreen extends StatefulWidget {
  static const routeName = '/favouriteRecipeScreen';
  const FavouriteRecipesScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteRecipesScreen> createState() => _FavouriteRecipesScreenState();
}

class _FavouriteRecipesScreenState extends State<FavouriteRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      body: Center(
        child: Text("Favourite Recipes Screen"),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AllRecipes extends StatefulWidget {
  static const routeName = '/allRecipesScreen';
  // final String itemName;
  const AllRecipes({Key? key}) : super(key: key);

  @override
  State<AllRecipes> createState() => _AllRecipesScreenState();
}

class _AllRecipesScreenState extends State<AllRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(title: const Text("All Recipes"),),
      body: Center(
        child: Text('You clicked on: ',),
      ),
    );
  }
}

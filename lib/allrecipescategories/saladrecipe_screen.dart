import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SaladRecipes extends StatefulWidget {
  const SaladRecipes({Key? key}) : super(key: key);

  @override
  State<SaladRecipes> createState() => _SaladRecipesState();
}

class _SaladRecipesState extends State<SaladRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(
        title: const Text("Salad Recipes"),
      ),
    );
  }
}

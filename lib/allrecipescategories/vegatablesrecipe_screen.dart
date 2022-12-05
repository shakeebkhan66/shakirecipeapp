import 'package:flutter/material.dart';

import '../constants/colors.dart';

class VegatablesRecipes extends StatefulWidget {
  const VegatablesRecipes({Key? key}) : super(key: key);

  @override
  State<VegatablesRecipes> createState() => _VegatablesRecipesState();
}

class _VegatablesRecipesState extends State<VegatablesRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(title: const Text("Vegatables Recipes"),),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BiryaniRecipes extends StatefulWidget {
  const BiryaniRecipes({Key? key}) : super(key: key);

  @override
  State<BiryaniRecipes> createState() => _BiryaniRecipesState();
}

class _BiryaniRecipesState extends State<BiryaniRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(title: const Text("Biryani Screen"),),
    );
  }
}

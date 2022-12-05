import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CakeRecipes extends StatefulWidget {
  const CakeRecipes({Key? key}) : super(key: key);

  @override
  State<CakeRecipes> createState() => _CakeRecipesState();
}

class _CakeRecipesState extends State<CakeRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(title: const Text("Cake Recipe"),),
    );
  }
}

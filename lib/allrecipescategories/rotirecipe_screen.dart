import 'package:flutter/material.dart';

import '../constants/colors.dart';

class RotiRecipes extends StatefulWidget {
  const RotiRecipes({Key? key}) : super(key: key);

  @override
  State<RotiRecipes> createState() => _RotiRecipesState();
}

class _RotiRecipesState extends State<RotiRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(title: const Text("Roti Recipe"),),
    );
  }
}

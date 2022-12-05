import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TeaRecipes extends StatefulWidget {
  const TeaRecipes({Key? key}) : super(key: key);

  @override
  State<TeaRecipes> createState() => _TeaRecipesState();
}

class _TeaRecipesState extends State<TeaRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(
        title: const Text("Tea Recipes"),
      ),
    );
  }
}

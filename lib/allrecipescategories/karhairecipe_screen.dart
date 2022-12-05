import 'package:flutter/material.dart';

import '../constants/colors.dart';

class KarhaiRecipes extends StatefulWidget {
  const KarhaiRecipes({Key? key}) : super(key: key);

  @override
  State<KarhaiRecipes> createState() => _KarhaiRecipesState();
}

class _KarhaiRecipesState extends State<KarhaiRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(title: const Text("Karhai Recipe"),),
    );
  }
}

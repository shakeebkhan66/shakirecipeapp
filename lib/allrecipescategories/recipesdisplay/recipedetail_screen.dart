import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myreceipeapp/constants/colors.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(
        backgroundColor: secondColor,
        elevation: 0.0,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new, color: firstColor,)),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.turned_in_not, color: firstColor, size: 25.0,))
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              color: firstColor,
            )
          ],
        ),
      ),
    );
  }
}

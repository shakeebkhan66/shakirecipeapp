import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: secondColor,
      body: Center(
        child: Text("Search"),
      ),
    );
  }
}

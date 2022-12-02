import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myreceipeapp/constants/colors.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/addpost_screen.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/home_screen.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/myfavouriterecipes_screen.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/search_screen.dart';
import 'bottomnavigationbarscreens/myprofile_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  static const routeName = '/bottomNavigationBarScreen';
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {

  int currentpage = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const AddPostScreen(),
    const FavouriteRecipesScreen(),
    const MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentpage],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: const <Widget>[
          Icon(Icons.home, size: 25, color: darkJungleGreenColor,),
          Icon(Icons.search, size: 25, color: darkJungleGreenColor,),
          Icon(Icons.add_box, size: 25, color: darkJungleGreenColor,),
          Icon(Icons.favorite, size: 25, color: darkJungleGreenColor,),
          Icon(Icons.perm_contact_cal, size: 25, color: darkJungleGreenColor,),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: firstColor.withOpacity(0.5),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            currentpage = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}

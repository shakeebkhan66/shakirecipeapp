import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myreceipeapp/constants/custom_circletabindicator.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/addpost_screen.dart';
import 'package:myreceipeapp/screens/editprofile_screen.dart';
import 'package:myreceipeapp/screens/welcome_screen.dart';

import '../../constants/colors.dart';
import '../../models/recipesmodel_class.dart';

class MyProfileScreen extends StatefulWidget {
  static const routeName = '/myProfileScreen';
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen>
    with TickerProviderStateMixin {
  // TODO Recipes List
  List<RecipesModelClass> recipesList = [
    RecipesModelClass(text: "All", image: "assets/images/all.jpg"),
    RecipesModelClass(text: "Tea", image: "assets/images/tea.jpg"),
    RecipesModelClass(text: "Biryani", image: "assets/images/biryani.jpg"),
    RecipesModelClass(text: "karhai", image: "assets/images/karhai.jpg"),
    RecipesModelClass(text: "Cake", image: "assets/images/cake.jpg"),
    RecipesModelClass(text: "Roti", image: "assets/images/roti.jpg"),
    RecipesModelClass(
        text: "Vegatables", image: "assets/images/vegetables.jpg"),
    RecipesModelClass(text: "Salad", image: "assets/images/salad.jpg"),
    RecipesModelClass(text: "Biryani", image: "assets/images/biryani.jpg"),
    RecipesModelClass(text: "karhai", image: "assets/images/karhai.jpg"),
    RecipesModelClass(text: "Cake", image: "assets/images/cake.jpg"),
    RecipesModelClass(text: "Roti", image: "assets/images/roti.jpg"),
    RecipesModelClass(
        text: "Vegatables", image: "assets/images/vegetables.jpg"),
    RecipesModelClass(text: "Salad", image: "assets/images/salad.jpg"),
  ];

  // TODO Logout Function
  logoutFunction() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "Do you want to logout?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                )),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      // Constants.preferences?.setBool("loggedIn", false);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const WelcomeScreen()));
                    },
                    child: const Text(
                      "Yes",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.green,
                    onPressed: () {
                      Navigator.pushNamed(context, MyProfileScreen.routeName);
                    },
                    child: const Text(
                      "No",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          );
        });
  }

  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondColor,
        appBar: AppBar(
          backgroundColor: secondColor,
          elevation: 0.9,
          automaticallyImplyLeading: false,
          title: Text(
            "shakeebkhancutie",
            style: GoogleFonts.roboto(
                color: darkJungleGreenColor,
                fontSize: 17.0,
                fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddPostScreen.routeName);
                },
                icon: const Icon(
                  Icons.add_box,
                  color: firstColor,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: IconButton(
                  onPressed: logoutFunction,
                  icon: const Icon(
                    Icons.exit_to_app_rounded,
                    color: firstColor,
                  )),
            )
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.8,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                          ),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("assets/images/image.png"),
                          ),
                        ),
                        Column(
                          children: [
                            Text("316",
                                style: GoogleFonts.acme(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                    color: darkJungleGreenColor)),
                            Text("Posts",
                                style: GoogleFonts.roboto(
                                    fontSize: 15.0,
                                    color: darkJungleGreenColor)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("294",
                                style: GoogleFonts.acme(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                    color: darkJungleGreenColor)),
                            Text("Followers",
                                style: GoogleFonts.roboto(
                                    fontSize: 15.0,
                                    color: darkJungleGreenColor)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("699",
                                style: GoogleFonts.acme(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                    color: darkJungleGreenColor)),
                            Text("Following",
                                style: GoogleFonts.roboto(
                                    fontSize: 15.0,
                                    color: darkJungleGreenColor)),
                          ],
                        )
                      ],
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 17.0, top: 10.0),
                        child: Text(
                          "Shakeeb Ahmed Khan",
                          style: GoogleFonts.acme(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                              letterSpacing: 0.5,
                              color: darkJungleGreenColor),
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 17.0, top: 10.0),
                        child: Text(
                          "Cars Lover...\nI'm a flutter developer having experience"
                          " of more than 1 year in industry. Have experience of "
                          "video editing, django rest framework api, python, "
                          "logo designing.",
                          style: GoogleFonts.roboto(
                              fontSize: 12.0, color: Colors.black87),
                        )),
                    const SizedBox(height: 20.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, EditProfileScreen.routeName);
                        },
                        splashColor: secondColor,
                        hoverColor: firstColor,
                        minWidth: 300,
                        height: 37,
                        color: firstColor.withOpacity(0.8),
                        child: Text(
                          "Edit Profile",
                          style: GoogleFonts.roboto(
                              color: secondColor, fontSize: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              Container(
                child: TabBar(
                    controller: _tabController,
                    unselectedLabelColor: Colors.black54,
                    labelColor: darkJungleGreenColor,
                    labelStyle: GoogleFonts.acme(
                        fontSize: 14, fontWeight: FontWeight.w400),
                    indicator: CircleTabIndicator(color: firstColor, radius: 4),
                    tabs: const [
                      Tab(
                        text: "My Recipes",
                      ),
                      Tab(
                        text: "Recipes Video",
                      ),
                    ]),
              ),
              const SizedBox(height: 10.0,),
              Container(
                width: double.maxFinite,
                height: 400,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    GridView.builder(
                      itemCount: recipesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0
                            ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)
                          ),
                          child: Card(
                            color: thirdColor,
                            shadowColor: Colors.black38,
                            child: Image.asset(recipesList[index].image!, fit: BoxFit.cover,),
                          ),
                        );
                      },
                    ),
                    Text("There"),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

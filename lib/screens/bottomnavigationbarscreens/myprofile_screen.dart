import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myreceipeapp/screens/api/register_api.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/addpost_screen.dart';
import 'package:myreceipeapp/screens/settheme_screen.dart';
import 'package:share_plus/share_plus.dart';
import '../authentication/change_password_screen.dart';
import '../authentication/login_screen.dart';
import '../constants/colors.dart';
import '../constants/custom_circletabindicator.dart';
import '../editprofile_screen.dart';
import '../models/ProfileDataModel.dart';
import '../models/popupmenumodel.dart';
import '../models/recipesmodel_class.dart';
import '../sharedpreference/sharedpref_class.dart';
import 'home_screen.dart';

class MyProfileScreen extends StatefulWidget {
  static const routeName = '/myProfileScreen';
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  // TODO Instance of Api Screen
  ApiScreen apiScreen = ApiScreen();

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
                      MySharedPrefClass.preferences?.setBool("loggedIn", false);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const LoginScreen()));
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
                      Navigator.pushNamed(context, HomeScreen.routeName);
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

  // TODO Modal Bottom Sheet
  bottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
                },
                leading: const Icon(Icons.password_rounded, color: darkJungleGreenColor,),
                title: const Text(
                  'Change Password',
                  style: TextStyle(
                      color: darkJungleGreenColor, letterSpacing: -1.0),
                ),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SetThemeScreen()));
                },
                leading: const Icon(Icons.color_lens_sharp, color: darkJungleGreenColor,),
                title: const Text(
                  'Change Theme',
                  style: TextStyle(
                      color: darkJungleGreenColor, letterSpacing: -1.0),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.language, color: darkJungleGreenColor,),
                title: Text(
                  'Change Language',
                  style: TextStyle(
                      color: darkJungleGreenColor, letterSpacing: -1.0),
                ),
              ),
              ListTile(
                onTap: logoutFunction,
                leading: const Icon(Icons.logout, color: firstColor,),
                title: const Text(
                  'Sign Out',
                  style: TextStyle(
                      color: darkJungleGreenColor, letterSpacing: -1.0),
                ),
              ),
            ],
          );
        });
  }

  // TODO Refresh List Function
  Future<void> refreshList() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      apiScreen.profileDataList.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    refreshList();

  }

  @override
  Widget build(BuildContext context) {
    print("object ${apiScreen.profileDataList}");
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
              child: PopupMenuButton<PopupMenuItemModel>(
                onSelected: (popupMenuItemModel) =>
                    onSelected(context, popupMenuItemModel),
                icon: const Icon(
                  Icons.more_vert,
                  color: firstColor,
                ),
                itemBuilder: (context) => [
                  ...MenuItems.itemsFirst.map(buildItem).toList(),
                  const PopupMenuDivider(),
                  ...MenuItems.itemsSecond.map(buildItem).toList(),
                ],
              ),
            )
          ],
        ),
        body: SafeArea(
          // child: ListView(
          //   children: [
          //     Container(
          //       height: MediaQuery.of(context).size.height / 2.8,
          //       child: Column(
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               const Padding(
          //                 padding: EdgeInsets.only(
          //                   top: 20,
          //                 ),
          //                 child: CircleAvatar(
          //                   radius: 40,
          //                   backgroundImage:
          //                       AssetImage("assets/images/image.png"),
          //                 ),
          //               ),
          //               Column(
          //                 children: [
          //                   Text("316",
          //                       style: GoogleFonts.acme(
          //                           fontWeight: FontWeight.w600,
          //                           fontSize: 20.0,
          //                           color: darkJungleGreenColor)),
          //                   Text("Posts",
          //                       style: GoogleFonts.roboto(
          //                           fontSize: 15.0,
          //                           color: darkJungleGreenColor)),
          //                 ],
          //               ),
          //               Column(
          //                 children: [
          //                   Text("294",
          //                       style: GoogleFonts.acme(
          //                           fontWeight: FontWeight.w600,
          //                           fontSize: 20.0,
          //                           color: darkJungleGreenColor)),
          //                   Text("Followers",
          //                       style: GoogleFonts.roboto(
          //                           fontSize: 15.0,
          //                           color: darkJungleGreenColor)),
          //                 ],
          //               ),
          //               Column(
          //                 children: [
          //                   Text("699",
          //                       style: GoogleFonts.acme(
          //                           fontWeight: FontWeight.w600,
          //                           fontSize: 20.0,
          //                           color: darkJungleGreenColor)),
          //                   Text("Following",
          //                       style: GoogleFonts.roboto(
          //                           fontSize: 15.0,
          //                           color: darkJungleGreenColor)),
          //                 ],
          //               )
          //             ],
          //           ),
          //           Container(
          //               alignment: Alignment.topLeft,
          //               padding: const EdgeInsets.only(left: 17.0, top: 10.0),
          //               child: Text(
          //                 "Shakeeb Ahmed Khan",
          //                 style: GoogleFonts.acme(
          //                     fontWeight: FontWeight.w600,
          //                     fontSize: 15.0,
          //                     letterSpacing: 0.5,
          //                     color: darkJungleGreenColor),
          //               )),
          //           Container(
          //               alignment: Alignment.topLeft,
          //               padding: const EdgeInsets.only(left: 17.0, top: 10.0),
          //               child: Text(
          //                 "Cars Lover...\nI'm a flutter developer having experience"
          //                 " of more than 1 year in industry. Have experience of "
          //                 "video editing, django rest framework api, python, "
          //                 "logo designing.",
          //                 style: GoogleFonts.roboto(
          //                     fontSize: 12.0, color: Colors.black87),
          //               )),
          //           const SizedBox(height: 20.0),
          //           Container(
          //             padding: const EdgeInsets.symmetric(horizontal: 30.0),
          //             child: MaterialButton(
          //               onPressed: () {
          //                 Navigator.pushNamed(
          //                     context, EditProfileScreen.routeName);
          //               },
          //               splashColor: secondColor,
          //               hoverColor: firstColor,
          //               minWidth: 300,
          //               height: 37,
          //               color: firstColor.withOpacity(0.8),
          //               child: Text(
          //                 "Edit Profile",
          //                 style: GoogleFonts.roboto(
          //                     color: secondColor, fontSize: 15.0),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     const SizedBox(height: 25.0),
          //     Container(
          //       child: TabBar(
          //           controller: _tabController,
          //           unselectedLabelColor: Colors.black54,
          //           labelColor: darkJungleGreenColor,
          //           labelStyle: GoogleFonts.acme(
          //               fontSize: 14, fontWeight: FontWeight.w400),
          //           indicator: CircleTabIndicator(color: firstColor, radius: 4),
          //           tabs: const [
          //             Tab(
          //               text: "My Recipes",
          //             ),
          //             Tab(
          //               text: "Recipes Video",
          //             ),
          //           ]),
          //     ),
          //     const SizedBox(
          //       height: 10.0,
          //     ),
          //     Container(
          //       width: double.maxFinite,
          //       height: 400,
          //       child: TabBarView(
          //         controller: _tabController,
          //         children: [
          //           GridView.builder(
          //             itemCount: recipesList.length,
          //             gridDelegate:
          //                 const SliverGridDelegateWithFixedCrossAxisCount(
          //                     crossAxisCount: 3,
          //                     crossAxisSpacing: 4.0,
          //                     mainAxisSpacing: 4.0),
          //             itemBuilder: (BuildContext context, int index) {
          //               return Container(
          //                 height: 150,
          //                 width: 120,
          //                 decoration: BoxDecoration(
          //                     border: Border.all(color: Colors.grey)),
          //                 child: Card(
          //                   color: thirdColor,
          //                   shadowColor: Colors.black38,
          //                   child: Image.asset(
          //                     recipesList[index].image!,
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //               );
          //             },
          //           ),
          //           const Text("There"),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: refreshList,
                  backgroundColor: firstColor,
                  color: Colors.white,
                  child: FutureBuilder(
                    future: apiScreen.getProfileData(context),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ProfileDataModel>> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: firstColor,
                          ),
                        );
                      } else {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            var name = snapshot.data![index].user!.fullname.toString();
                            var image = snapshot.data![index].user!.image.toString();
                            var bio = snapshot.data![index].user!.bio.toString();
                            print("Image $image");
                            var recipes = snapshot.data![index].recipes;
                            var length = snapshot.data?.length;
                            return Column(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height / 2.8,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                           Padding(
                                            padding: const EdgeInsets.only(
                                              top: 20,
                                            ),
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundColor: Colors.transparent,
                                              backgroundImage:
                                              NetworkImage("${apiScreen.baseUrl}  ${image}"),
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
                                          padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                                          child: Text(
                                            name,
                                            style: GoogleFonts.acme(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15.0,
                                                letterSpacing: 0.5,
                                                color: darkJungleGreenColor),
                                          )),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.only(left: 17.0, top: 10.0),
                                          child: Text(bio,
                                            style: GoogleFonts.roboto(
                                                fontSize: 12.0, color: Colors.black87),
                                          )),
                                      const SizedBox(height: 20.0),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                        child: MaterialButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, EditProfileScreen.routeName);
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
                                const SizedBox(height: 20.0),
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
                                        itemCount: recipes?.length,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 4.0,
                                            mainAxisSpacing: 4.0),
                                        itemBuilder: (BuildContext context, int index) {
                                          return Container(
                                            height: 150,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey)),
                                            child: Card(
                                              color: thirdColor,
                                              shadowColor: Colors.black38,
                                              child: Container(
                                                height: 270,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(boxShadow: [
                                                  BoxShadow(
                                                      color: firstColor.withOpacity(0.2),
                                                      offset: const Offset(0.0, 0.1),
                                                      blurRadius: 10.0)
                                                ]),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                  "${apiScreen.baseUrl}  ${recipes![index].image.toString()}",
                                                  imageBuilder: (context, imageProvider) =>
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: imageProvider,
                                                              fit: BoxFit.cover,
                                                              colorFilter:
                                                              const ColorFilter.mode(
                                                                  Colors.red,
                                                                  BlendMode.dstIn)),
                                                        ),
                                                      ),
                                                  placeholder: (context, url) =>
                                                  const Center(
                                                      child: CircularProgressIndicator(
                                                        color: firstColor,
                                                      )),
                                                  errorWidget: (context, url, error) =>
                                                  const Icon(Icons.error),
                                                ),

                                                // Image.network(
                                                //   baseUrl +
                                                //       snapshot.data![index].image
                                                //           .toString(),
                                                //   fit: BoxFit.cover,
                                                // )

                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      const Center(child: Text("Recipes Videos")),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }

  // TODO Popup Menu Item
  PopupMenuItem<PopupMenuItemModel> buildItem(
          PopupMenuItemModel popupMenuItemModel) =>
      PopupMenuItem(
          value: popupMenuItemModel,
          child: Row(
            children: [
              Icon(
                popupMenuItemModel.icon,
                color: darkJungleGreenColor,
                size: 20.0,
              ),
              const SizedBox(
                width: 12.0,
              ),
              Text(popupMenuItemModel.text!)
            ],
          ));

  // TODO Moving On Different Pages By Clicking the Option of Popup Menu Button
  onSelected(BuildContext context, PopupMenuItemModel popupMenuItemModel) {
    if (popupMenuItemModel == MenuItems.itemsSettings) {
      return bottomSheet();
    } else if (popupMenuItemModel == MenuItems.itemsShare) {
      return shareLink();
    } else {
      return logoutFunction();
    }
  }
  
  // TODO Share Link on Other Social Media Platforms
shareLink(){
    Share.share('check out my website https://example.com', subject: 'Look what I made!');
}
}

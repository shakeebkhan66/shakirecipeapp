import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myreceipeapp/allrecipescategories/recipesdisplay/recipedetail_screen.dart';
import 'package:myreceipeapp/api/register_api.dart';

import '../constants/colors.dart';
import '../models/AllRecipesModel.dart';

class AllRecipes extends StatefulWidget {
  static const routeName = '/allRecipesScreen';
  // final String itemName;
  const AllRecipes({Key? key}) : super(key: key);

  @override
  State<AllRecipes> createState() => _AllRecipesScreenState();
}

class _AllRecipesScreenState extends State<AllRecipes> {

  // TODO INSTANCE OF API SCREEN
  ApiScreen apiScreen = ApiScreen();

  String baseUrl ="http://192.168.42.145:8000";

  // TODO Refresh List Function
  Future<void> refreshList() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      apiScreen.allRecipes.clear();
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiScreen.getAllRecipes(context);
    refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondColor,
        appBar: AppBar(
          backgroundColor: secondColor,
          elevation: 0.5,
          automaticallyImplyLeading: false,
          title: Text(
            "Skabapp",
            style: GoogleFonts.audiowide(
                fontWeight: FontWeight.bold, color: firstColor),
          ),
        ),
        body: SafeArea(

          // child: ListView(
          //   physics: const BouncingScrollPhysics(),
          //   children: [
          //     const SizedBox(height: 15.0),
          //     Row(
          //       children: [
          //         const SizedBox(
          //           width: 8.0,
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //               border: Border.all(color: firstColor),
          //               borderRadius: BorderRadius.circular(25.0)),
          //           child: CircleAvatar(
          //             radius: 20.0,
          //             child: Image.asset("assets/images/image.png"),
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 8.0,
          //         ),
          //         Text(
          //           "shakeeb_khan",
          //           style: GoogleFonts.acme(
          //               fontSize: 13.0, fontWeight: FontWeight.w200),
          //         ),
          //         const SizedBox(
          //           width: 180.0,
          //         ),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               CupertinoIcons.ellipsis_vertical,
          //               color: firstColor,
          //             ))
          //       ],
          //     ),
          //     const SizedBox(height: 5.0),
          //     InkWell(
          //       onTap: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => const RecipeDetailsScreen()));
          //       },
          //       child: Container(
          //         height: 270,
          //         width: MediaQuery.of(context).size.width,
          //         decoration: BoxDecoration(boxShadow: [
          //           BoxShadow(
          //               color: firstColor.withOpacity(0.2),
          //               offset: const Offset(0.0, 0.1),
          //               blurRadius: 10.0)
          //         ]),
          //         child: Image.network(
          //           "",
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.favorite_outline_outlined,
          //               size: 25.0,
          //             )),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.share_rounded,
          //               size: 25.0,
          //             )),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.collections_bookmark,
          //               size: 25.0,
          //             ))
          //       ],
          //     ),
          //     Container(
          //       padding: const EdgeInsets.only(left: 10),
          //       child: Text(
          //         "100 likes",
          //         style: GoogleFonts.acme(fontWeight: FontWeight.w200),
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 8.0,
          //     ),
          //     Row(
          //       children: [
          //         const SizedBox(
          //           width: 8.0,
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //               border: Border.all(color: firstColor),
          //               borderRadius: BorderRadius.circular(25.0)),
          //           child: CircleAvatar(
          //             radius: 20.0,
          //             child: Image.asset("assets/images/image.png"),
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 8.0,
          //         ),
          //         Text(
          //           "shakeeb_khan",
          //           style: GoogleFonts.acme(
          //               fontSize: 13.0, fontWeight: FontWeight.w200),
          //         ),
          //         const SizedBox(
          //           width: 174.0,
          //         ),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               CupertinoIcons.ellipsis_vertical,
          //               color: firstColor,
          //             ))
          //       ],
          //     ),
          //     const SizedBox(height: 5.0),
          //     Container(
          //       height: 270,
          //       width: MediaQuery.of(context).size.width,
          //       decoration: BoxDecoration(boxShadow: [
          //         BoxShadow(
          //             color: firstColor.withOpacity(0.2),
          //             offset: const Offset(0.0, 0.1),
          //             blurRadius: 10.0)
          //       ]),
          //       child: Image.asset(
          //         "assets/images/roti.jpg",
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.favorite_outline_outlined,
          //               size: 25.0,
          //             )),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.share_rounded,
          //               size: 25.0,
          //             )),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.collections_bookmark,
          //               size: 25.0,
          //             ))
          //       ],
          //     ),
          //     Container(
          //       padding: const EdgeInsets.only(left: 10),
          //       child: Text(
          //         "110 likes",
          //         style: GoogleFonts.acme(fontWeight: FontWeight.w200),
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 8.0,
          //     ),
          //     Row(
          //       children: [
          //         const SizedBox(
          //           width: 8.0,
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //               border: Border.all(color: firstColor),
          //               borderRadius: BorderRadius.circular(25.0)),
          //           child: CircleAvatar(
          //             radius: 20.0,
          //             child: Image.asset("assets/images/image.png"),
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 8.0,
          //         ),
          //         Text(
          //           "aziz_bhutta",
          //           style: GoogleFonts.acme(
          //               fontSize: 13.0, fontWeight: FontWeight.w200),
          //         ),
          //         const SizedBox(
          //           width: 180.0,
          //         ),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               CupertinoIcons.ellipsis_vertical,
          //               color: firstColor,
          //             ))
          //       ],
          //     ),
          //     const SizedBox(height: 5.0),
          //     Container(
          //       height: 270,
          //       width: MediaQuery.of(context).size.width,
          //       decoration: BoxDecoration(boxShadow: [
          //         BoxShadow(
          //             color: firstColor.withOpacity(0.2),
          //             offset: Offset(0.0, 0.1),
          //             blurRadius: 10.0)
          //       ]),
          //       child: Image.asset(
          //         "assets/images/biryani.jpg",
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.favorite_outline_outlined,
          //               size: 25.0,
          //             )),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.share_rounded,
          //               size: 25.0,
          //             )),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.collections_bookmark,
          //               size: 25.0,
          //             ))
          //       ],
          //     ),
          //     Container(
          //       padding: const EdgeInsets.only(left: 10),
          //       child: Text(
          //         "100 likes",
          //         style: GoogleFonts.acme(fontWeight: FontWeight.w200),
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 8.0,
          //     ),
          //     Row(
          //       children: [
          //         const SizedBox(
          //           width: 8.0,
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //               border: Border.all(color: firstColor),
          //               borderRadius: BorderRadius.circular(25.0)),
          //           child: CircleAvatar(
          //             radius: 20.0,
          //             child: Image.asset("assets/images/image.png"),
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 8.0,
          //         ),
          //         Text(
          //           "abdurrehman",
          //           style: GoogleFonts.acme(
          //               fontSize: 13.0, fontWeight: FontWeight.w200),
          //         ),
          //         const SizedBox(
          //           width: 180.0,
          //         ),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               CupertinoIcons.ellipsis_vertical,
          //               color: firstColor,
          //             ))
          //       ],
          //     ),
          //     const SizedBox(height: 5.0),
          //     Container(
          //       height: 270,
          //       width: MediaQuery.of(context).size.width,
          //       decoration: BoxDecoration(boxShadow: [
          //         BoxShadow(
          //             color: firstColor.withOpacity(0.2),
          //             offset: const Offset(0.0, 0.1),
          //             blurRadius: 10.0)
          //       ]),
          //       child: Image.asset(
          //         "assets/images/salad.jpg",
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.favorite_outline_outlined,
          //               size: 25.0,
          //             )),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.share_rounded,
          //               size: 25.0,
          //             )),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.collections_bookmark,
          //               size: 25.0,
          //             ))
          //       ],
          //     ),
          //     Container(
          //       padding: const EdgeInsets.only(left: 10),
          //       child: Text(
          //         "100 likes",
          //         style: GoogleFonts.acme(fontWeight: FontWeight.w200),
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 8.0,
          //     ),
          //     Row(
          //       children: [
          //         const SizedBox(
          //           width: 8.0,
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //               border: Border.all(color: firstColor),
          //               borderRadius: BorderRadius.circular(25.0)),
          //           child: CircleAvatar(
          //             radius: 20.0,
          //             child: Image.asset("assets/images/image.png"),
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 8.0,
          //         ),
          //         Text(
          //           "wahid_ali",
          //           style: GoogleFonts.acme(
          //               fontSize: 13.0, fontWeight: FontWeight.w200),
          //         ),
          //         const SizedBox(
          //           width: 180.0,
          //         ),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               CupertinoIcons.ellipsis_vertical,
          //               color: firstColor,
          //             ))
          //       ],
          //     ),
          //     const SizedBox(height: 5.0),
          //     Container(
          //       height: 270,
          //       width: MediaQuery.of(context).size.width,
          //       decoration: BoxDecoration(boxShadow: [
          //         BoxShadow(
          //             color: firstColor.withOpacity(0.2),
          //             offset: const Offset(0.0, 0.1),
          //             blurRadius: 10.0)
          //       ]),
          //       child: Image.asset(
          //         "assets/images/cake.jpg",
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.favorite_outline_outlined,
          //               size: 25.0,
          //             )),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.share_rounded,
          //               size: 25.0,
          //             )),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.collections_bookmark,
          //               size: 25.0,
          //             ))
          //       ],
          //     ),
          //     Container(
          //       padding: const EdgeInsets.only(left: 10),
          //       child: Text(
          //         "100 likes",
          //         style: GoogleFonts.acme(fontWeight: FontWeight.w200),
          //       ),
          //     ),
          //   ],
          // ),



          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: refreshList,
                  child: FutureBuilder(
                    future: apiScreen.getAllRecipes(context),
                    builder: (BuildContext context, AsyncSnapshot<List<AllRecipesModel>> snapshot) {
                      if(!snapshot.hasData){
                        return const Center(
                          child: CircularProgressIndicator(
                            color: firstColor,
                          ),
                        );
                      }else {
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index){
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: firstColor),
                                          borderRadius: BorderRadius.circular(25.0)),
                                      child: CircleAvatar(
                                        radius: 20.0,
                                        child: Image.asset("assets/images/image.png"),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      snapshot.data![index].username!.username.toString(),
                                      style: GoogleFonts.acme(
                                          fontSize: 13.0, fontWeight: FontWeight.w200),
                                    ),
                                    const SizedBox(
                                      width: 180.0,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          CupertinoIcons.ellipsis_vertical,
                                          color: firstColor,
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 5.0),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const RecipeDetailsScreen()));
                                  },
                                  child: Container(
                                    height: 270,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: firstColor.withOpacity(0.2),
                                          offset: const Offset(0.0, 0.1),
                                          blurRadius: 10.0)
                                    ]),
                                    child: Image.network(baseUrl+snapshot.data![index].image.toString(), fit: BoxFit.cover,)
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite_outline_outlined,
                                          size: 25.0,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.share_rounded,
                                          size: 25.0,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.collections_bookmark,
                                          size: 25.0,
                                        ))
                                  ],
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
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myreceipeapp/screens/allrecipescategories/recipesdisplay/recipedetail_screen.dart';
import '../api/register_api.dart';
import '../constants/colors.dart';
import '../models/AllRecipesModel.dart';

class KarhaiRecipes extends StatefulWidget {
  const KarhaiRecipes({Key? key}) : super(key: key);

  @override
  State<KarhaiRecipes> createState() => _KarhaiRecipesState();
}

class _KarhaiRecipesState extends State<KarhaiRecipes> {

  // TODO INSTANCE OF API SCREEN
  ApiScreen apiScreen = ApiScreen();
  bool isLoaded = false;

  // TODO Refresh List Function
  Future<void> refreshList() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      apiScreen.allRecipes.clear();
    });
  }

  @override
  void initState() {
    super.initState();
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
            "Karhai",
            style: GoogleFonts.audiowide(
                fontWeight: FontWeight.bold, color: darkJungleGreenColor),
          ),
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_outlined, color: firstColor,)),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: refreshList,
                  backgroundColor: firstColor,
                  color: Colors.white,
                  child: FutureBuilder(
                    future: apiScreen.getAllRecipes(context),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<AllRecipesModel>> snapshot) {
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

                            var category = snapshot.data![index].categories.toString();
                            print(category);

                            return category == "Karhai" ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(color: firstColor),
                                                borderRadius:
                                                BorderRadius.circular(25.0)),
                                            child: CircleAvatar(
                                              radius: 20.0,
                                              child: Image.asset(
                                                  "assets/images/image.png"),
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Text(
                                            snapshot.data![index].username!.username
                                                .toString(),
                                            style: GoogleFonts.acme(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            CupertinoIcons.ellipsis_vertical,
                                            color: firstColor,
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const RecipeDetailsScreen()));
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
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      "${apiScreen.baseUrl}  ${snapshot.data![index].image.toString()}",
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
                            ) : Container();
                          },
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

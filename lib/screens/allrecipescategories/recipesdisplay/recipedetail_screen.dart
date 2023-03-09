import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myreceipeapp/screens/api/register_api.dart';
import 'package:myreceipeapp/screens/bottomnavigationbar.dart';

import '../../constants/colors.dart';

class RecipeDetailsScreen extends StatefulWidget {
  String image;
  String recipeName;
  String category;
  String ingredients;
  String howToMake;
  RecipeDetailsScreen(
      {Key? key,
      required this.image,
      required this.recipeName,
      required this.category,
      required this.ingredients,
      required this.howToMake})
      : super(key: key);

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {

  ApiScreen apiScreen = ApiScreen();


  // TODO My Modal Bottom Sheet
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: secondColor,
        isDismissible: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.0))),
        builder: (context) => DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.4,
            maxChildSize: 0.8,
            minChildSize: 0.4,
            builder: (context, scrollController) => SingleChildScrollView(
                  controller: scrollController,
                  child: MyModalBottomSheet(
                    recipeName: widget.recipeName,
                    category: widget.category,
                    ingredients: widget.ingredients,
                    howToMake: widget.howToMake,
                  ),
                )));
  }

  // TODO Refresh List Function
  Future<void> refreshList() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _showModalBottomSheet(context);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 0)).then((_) {
      _showModalBottomSheet(context);
      refreshList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(
        backgroundColor: secondColor,
        elevation: 0.0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new, color: firstColor,)),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.turned_in_not, color: firstColor, size: 25.0,))
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: refreshList,
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: Image.network(
                      "${apiScreen.baseUrl} ${widget.image}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  // InkWell(
                  //   onTap: (){
                  //     Navigator.pop(context);
                  //   },
                  //   child: Container(
                  //       padding: const EdgeInsets.only(top: 25.0, left: 13.0),
                  //       child: const CircleAvatar(
                  //           radius: 18.0,
                  //           backgroundColor: darkJungleGreenColor,
                  //           child: Icon(
                  //             Icons.arrow_back_ios_new,
                  //             size: 18.0,
                  //             color: firstColor,
                  //           ),
                  //       )),
                  // ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //       alignment: Alignment.topRight,
                  //       padding: const EdgeInsets.only(top: 25.0, right: 15.0),
                  //       child: const CircleAvatar(
                  //           radius: 18.0,
                  //           backgroundColor: darkJungleGreenColor,
                  //           child: Icon(
                  //             Icons.turned_in_not,
                  //             color: firstColor,
                  //             size: 18.0,
                  //           ))),
                  // ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 120.0, left: 25.0),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(milliseconds: 500),
                      animatedTexts: [
                        TyperAnimatedText(
                            'Pull page down to see bottom sheet of recipe again',
                            textStyle: GoogleFonts.atma(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.0),
                            speed: const Duration(milliseconds: 350),
                            curve: Curves.easeIn)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyModalBottomSheet extends StatelessWidget {
  String recipeName;
  String category;
  String ingredients;
  String howToMake;

  MyModalBottomSheet(
      {Key? key,
      required this.recipeName,
      required this.category,
      required this.ingredients,
      required this.howToMake})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15.0,
          child: Container(
            width: 60.0,
            height: 7.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: firstColor),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Text(
              recipeName,
              style: GoogleFonts.atma(
                  color: firstColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 28.0),
            ),
            Text(
              category,
              style: GoogleFonts.roboto(
                  color: darkJungleGreenColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.star_border,
                  color: darkJungleGreenColor,
                ),
                Icon(
                  Icons.star_border,
                  color: darkJungleGreenColor,
                ),
                Icon(
                  Icons.star_border,
                  color: darkJungleGreenColor,
                ),
                Icon(
                  Icons.star_border,
                  color: darkJungleGreenColor,
                ),
                Icon(
                  Icons.star_border,
                  color: darkJungleGreenColor,
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 25.0, left: 20.0),
              child: Text(
                "Ingredients",
                style: GoogleFonts.roboto(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1.0,
                    color: firstColor),
              ),
            ),
            Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "*",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w900,
                              color: firstColor,
                              fontSize: 12.0)),
                      const WidgetSpan(
                          child: SizedBox(
                        width: 4.0,
                      )),
                      TextSpan(
                          text: ingredients,
                          style: GoogleFonts.roboto(
                              color: darkJungleGreenColor, fontSize: 12.0))
                    ]))),
                // Container(
                //     alignment: Alignment.topLeft,
                //     padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                //     child: RichText(
                //         text: TextSpan(children: [
                //       TextSpan(
                //           text: "*",
                //           style: GoogleFonts.roboto(
                //               fontWeight: FontWeight.w900,
                //               color: firstColor,
                //               fontSize: 12.0)),
                //       const WidgetSpan(
                //           child: SizedBox(
                //         width: 4.0,
                //       )),
                //       TextSpan(
                //           text: "One Fresh Pomegranate",
                //           style: GoogleFonts.roboto(
                //               color: darkJungleGreenColor, fontSize: 12.0))
                //     ]))),
                // Container(
                //     alignment: Alignment.topLeft,
                //     padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                //     child: RichText(
                //         text: TextSpan(children: [
                //       TextSpan(
                //           text: "*",
                //           style: GoogleFonts.roboto(
                //               fontWeight: FontWeight.w900,
                //               color: firstColor,
                //               fontSize: 12.0)),
                //       const WidgetSpan(
                //           child: SizedBox(
                //         width: 4.0,
                //       )),
                //       TextSpan(
                //           text: "Two and half cup of milk",
                //           style: GoogleFonts.roboto(
                //               color: darkJungleGreenColor, fontSize: 12.0))
                //     ]))),
                // Container(
                //     alignment: Alignment.topLeft,
                //     padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                //     child: RichText(
                //         text: TextSpan(children: [
                //       TextSpan(
                //           text: "*",
                //           style: GoogleFonts.roboto(
                //               fontWeight: FontWeight.w900,
                //               color: firstColor,
                //               fontSize: 12.0)),
                //       const WidgetSpan(
                //           child: SizedBox(
                //         width: 4.0,
                //       )),
                //       TextSpan(
                //           text: "One and half cup of sugar",
                //           style: GoogleFonts.roboto(
                //               color: darkJungleGreenColor, fontSize: 12.0))
                //     ]))),
                // Container(
                //     alignment: Alignment.topLeft,
                //     padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                //     child: RichText(
                //         text: TextSpan(children: [
                //       TextSpan(
                //           text: "*",
                //           style: GoogleFonts.roboto(
                //               fontWeight: FontWeight.w900,
                //               color: firstColor,
                //               fontSize: 12.0)),
                //       const WidgetSpan(
                //           child: SizedBox(
                //         width: 4.0,
                //       )),
                //       TextSpan(
                //           text: "Two lemons",
                //           style: GoogleFonts.roboto(
                //               color: darkJungleGreenColor, fontSize: 12.0))
                //     ])))
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 25.0, left: 20.0),
              child: Text(
                "How To Make",
                style: GoogleFonts.roboto(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1.0,
                    color: firstColor),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10.0, left: 19.0),
                child: Text(
                  howToMake,
                  style: GoogleFonts.roboto(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: darkJungleGreenColor,
                  ),
                ))
          ],
        )
      ],
    );
  }
}

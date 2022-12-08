import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myreceipeapp/constants/colors.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/myprofile_screen.dart';

import '../constants/customtextfield.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/editProfileScreen';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(
        backgroundColor: secondColor,
        elevation: 0.5,
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, MyProfileScreen.routeName);
        }, icon: const Icon(Icons.arrow_back_ios_new_rounded, color: firstColor,)),
      ),
      body: SafeArea(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 60),
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage("assets/images/image.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                  child: Text(
                    "Edit Picture",
                    style: GoogleFonts.audiowide(
                        color: darkJungleGreenColor,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 40.0),
                CustomTextField1(hintText: 'full name', labelText: "Full Name", icon: Icons.person_add_alt_rounded,),
                const SizedBox(height: 20.0,),
                CustomTextField1(hintText: 'username', labelText: "Username", icon: Icons.person_add_alt_rounded,),
                const SizedBox(height: 20.0,),
                CustomTextField1(hintText: 'mobile no', labelText: "Phone", icon: Icons.phone,),
                const SizedBox(height: 20.0,),
                CustomTextField1(hintText: 'password', labelText: "Password", icon: Icons.password,),
                const SizedBox(height: 30.0,),
                MaterialButton(
                  onPressed: () {},
                  splashColor: secondColor,
                  hoverColor: firstColor,
                  minWidth: 200,
                  height: 35,
                  color: firstColor.withOpacity(0.8),
                  child: Text(
                    "Change",
                    style: GoogleFonts.oswald(color: secondColor, fontSize: 15.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

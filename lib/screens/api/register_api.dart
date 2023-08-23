import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/home_screen.dart';
import '../authentication/login_screen.dart';
import '../bottomnavigationbar.dart';
import '../models/AllRecipesModel.dart';
import '../models/ProfileDataModel.dart';
import '../sharedpreference/sharedpref_class.dart';

// TODO INSTANCE OF ALL RECIPE MODEL CLASS
AllRecipesModel allRecipesModel = AllRecipesModel();

class ApiScreen {
  String baseUrl = "http://192.168.163.185:8000";

  // TODO INSTANCE OF ALL RECIPE MODEL CLASS
  List<AllRecipesModel> allRecipes = [];

  // TODO INSTANCE OF PROFILE DATA MODEL CLASS
  List<ProfileDataModel> profileDataList = [];

// TODO Register APi
//   register(String username, email, fullName, password, confirmPassword,
//       File image,
//       context) async {
//     print("My username $username");
//     print("My username $email");
//     print("My username $fullName");
//     print("My username $password");
//     print("My username $confirmPassword");
//     print("Image $image");
//
//     Map<String, dynamic> registerBody = {
//       "username": username,
//       "email": email,
//       "fullname": fullName,
//       "password": password,
//       "confirmPassword": confirmPassword,
//       "image": image.toString(),
//     };
//
//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.1.39:8000/api/register/'),
//             body: {
//           "username": username,
//           "email": email,
//           "fullname": fullName,
//           "password": password,
//           "confirmPassword": confirmPassword,
//               "image": base64Encode(image.readAsBytesSync()),
//         },
//
//         // headers: <String, String>{'Content-Type': 'application/json'},
//         // body: jsonEncode(registerBody),
//       );
//
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body.toString());
//         print("Data $data");
//         print("Register Successfully");
//         Fluttertoast.showToast(
//             msg: "Register Successfully",
//             backgroundColor: Colors.green,
//             textColor: Colors.white,
//             fontSize: 18);
//         Navigator.pushNamed(context, LoginScreen.routeName);
//       } else {
//         print("Failed");
//         Fluttertoast.showToast(
//             msg: response.body,
//             backgroundColor: Colors.redAccent,
//             textColor: Colors.white,
//             fontSize: 18);
//       }
//     } catch (e) {
//       print(e.toString());
//       Fluttertoast.showToast(
//           msg: e.toString(),
//           backgroundColor: Colors.redAccent,
//           textColor: Colors.white,
//           fontSize: 18);
//     }
//   }

  // TODO Register Api with Image

  // TODO Register User Api

  // TODO REGISTER USER


  // TODO REGISTER USER API


  registerUser(username, email, fullname, password, confirmPassword, bio, image, context) async{
    var uri = Uri.parse('$baseUrl/api/register/');
    var request = http.MultipartRequest('POST', uri);
    request.fields['username'] = username.toString();
    request.fields['email'] = email.toString();
    request.fields['fullname'] = fullname.toString();
    request.fields['password'] = password.toString();
    request.fields['confirmPassword'] = confirmPassword.toString();
    request.fields['bio'] = bio.toString();

    request.files.add(await http.MultipartFile.fromPath(
        'image', image));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);

    try{
      if(responsed.statusCode == 200){
        final responsedData = json.decode(responsed.body);
        MySharedPrefClass.preferences
            ?.setString("Username", responsedData["data"]["detail"]);
        print("Data $responsedData");
        print("Register Successfully");
        Fluttertoast.showToast(
            msg: "Register Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        Navigator.pushNamed(context, LoginScreen.routeName);
      }else{
        print("Failed");
        Fluttertoast.showToast(
            msg: responsed.body,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);
      }
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);
    }
  }

  // TODO LOGIN API Hello
  login(String email, password, context) async {
    print("My Email $email");
    print("My Password $password");

    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/login/'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("Data $data");
        print("Login Successfully");
        print("Hello ${data["token"]["access"]}");
        print("Username ${data["details"]["username"]}");
        MySharedPrefClass.preferences!.setBool("loggedIn", true);
        MySharedPrefClass.preferences
            ?.setString("Access_Token", data["token"]["access"]);
        MySharedPrefClass.preferences!.setString("Username", data["details"]["username"]);
        Fluttertoast.showToast(
            msg: "Login Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavigationBarScreen()));
        // Navigator.pushNamed(context, BottomNavigationBarScreen.routeName);
      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: "Failed ${response.body}",
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);
    }
  }

  // TODO CHANGE PASSWORD API
  changePassword(String password, confirmPassword, token, context) async {
    print("My Password $password");
    print("My ConfirmPassword $confirmPassword");

    Map<String, dynamic> body = {
      "password": password,
      "confirmPassword": confirmPassword,
    };

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/change_password/'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("Data $data");
        print("Change Password Successfully");
        Fluttertoast.showToast(
            msg: "Change Password Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavigationBarScreen()));
        // Navigator.pushNamed(context, BottomNavigationBarScreen.routeName);
      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: "Failed ${response.body}",
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);
    }
  }

  // TODO GET ALL RECIPE API
  Future<List<AllRecipesModel>> getAllRecipes(context) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/allrecipes/'),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print("Data $data");
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data get successfully")));
      for (var i in data) {
        allRecipes.add(AllRecipesModel.fromJson(i));
      }
      return allRecipes;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed to get")));
      return allRecipes;
    }
  }

  // TODO PROFILE DATA OF USER
  Future<List<ProfileDataModel>> getProfileData(context) async {
    var accessToken = MySharedPrefClass.preferences?.getString('Access_Token');
    final response = await http.get(
      Uri.parse('$baseUrl/api/profile/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
    );
    var data = jsonDecode(response.body.toString());
    print("Profile $data");
    if (response.statusCode == 200) {
      print("Profile $data");
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data get successfully")));
      for (var i in data) {
        profileDataList.add(ProfileDataModel.fromJson(i));
        print("Kaka ${profileDataList}");
      }
      return profileDataList;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed to get")));
      return profileDataList;
    }
  }

  // TODO CREATE RECIPE API
  createRecipe(productName, username, ingredients, makeRecipe, categories, image, context) async{
    var uri = Uri.parse('$baseUrl/api/createrecipe/');
    var request = http.MultipartRequest('POST', uri);
    request.fields['productName'] = productName.toString();
    request.fields['ingredients'] = ingredients.toString();
    request.fields['makeRecipe'] = makeRecipe.toString();
    request.fields['categories'] = categories.toString();
    request.fields['username'] = username.toString();

    request.files.add(await http.MultipartFile.fromPath(
        'image', image));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);

    try{
      if(responsed.statusCode == 200){
        final responsedData = json.decode(responsed.body);
        print("Data $responsedData");
        print("Register Successfully");
        Fluttertoast.showToast(
            msg: "Created Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        Navigator.pushNamed(context, BottomNavigationBarScreen.routeName);
      }else{
        print("Failed");
        Fluttertoast.showToast(
            msg: responsed.body,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);
      }
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../authentication/login_screen.dart';
import '../bottomnavigationbar.dart';
import '../models/AllRecipesModel.dart';
import '../models/ProfileDataModel.dart';
import '../sharedpreference/sharedpref_class.dart';

// TODO INSTANCE OF ALL RECIPE MODEL CLASS
AllRecipesModel allRecipesModel = AllRecipesModel();

class ApiScreen {
  String baseUrl = "http://192.168.42.59:8000";

  // TODO INSTANCE OF ALL RECIPE MODEL CLASS
  List<AllRecipesModel> allRecipes = [];

  // TODO INSTANCE OF PROFILE DATA MODEL CLASS
  List<ProfileDataModel> profileDataList = [];

// TODO Register APi
  register(String username, email, fullName, password, confirmPassword,
      context) async {
    print("My username $username");
    print("My username $email");
    print("My username $fullName");
    print("My username $password");
    print("My username $confirmPassword");

    Map<String, dynamic> registerBody = {
      "username": username,
      "email": email,
      "fullname": fullName,
      "password": password,
      "confirmPassword": confirmPassword
    };

    try {
      final response = await http.post(
        Uri.parse('http://192.168.42.59:8000/api/register/'),
        //     body: {
        //   "username": username,
        //   "email": email,
        //   "fullname": fullName,
        //   "password": password,
        //   "confirmPassword": confirmPassword,
        // }

        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(registerBody),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("Data $data");
        print("Register Successfully");
        Fluttertoast.showToast(
            msg: "Register Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        Navigator.pushNamed(context, LoginScreen.routeName);
      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: response.body,
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

  // TODO Login APi
  login(String email, password, context) async {
    print("My Email $email");
    print("My Password $password");

    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };

    try {
      final response = await http.post(
        Uri.parse('http://192.168.42.59:8000/api/login/'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("Data $data");
        print("Login Successfully");
        print("Hello ${data["token"]["access"]}");
        MySharedPrefClass.preferences!.setBool("loggedIn", true);
        MySharedPrefClass.preferences
            ?.setString("Access_Token", data["token"]["access"]);
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

  // TODO Change Password Api
  changePassword(String password, confirmPassword, token, context) async {
    print("My Password $password");
    print("My ConfirmPassword $confirmPassword");

    Map<String, dynamic> body = {
      "password": password,
      "confirmPassword": confirmPassword,
    };

    try {
      final response = await http.post(
        Uri.parse('http://192.168.42.59:8000/api/change_password/'),
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

  // TODO Get All Recipes Api
  Future<List<AllRecipesModel>> getAllRecipes(context) async {
    final response = await http.get(
      Uri.parse('http://192.168.42.59:8000/api/allrecipes/'),
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

  // TODO Profile Data of User
  Future<List<ProfileDataModel>> getProfileData(context) async {
    var accessToken = MySharedPrefClass.preferences?.getString('Access_Token');
    final response = await http.get(
      Uri.parse('http://192.168.42.59:8000/api/profile/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
    );
    var data = jsonDecode(response.body.toString());
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
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:myreceipeapp/authentication/login_screen.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/home_screen.dart';

import '../screens/bottomnavigationbar.dart';

class ApiScreen {

// TODO Register APi
  register(String username, email, fullName, password, confirmPassword, context) async {
    print("My username $username");
    print("My username $email");
    print("My username $fullName");
    print("My username $password");
    print("My username $confirmPassword");

    try {
      final response = await http.post(
          Uri.parse('http://192.168.1.27:8000/api/register/'),
          body: {
            "username": username,
            "email": email,
            "fullname": fullName,
            "password": password,
            "confirmPassword": confirmPassword,
          }
      );

      if (response.statusCode == 201) {
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
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);
    }
  }

  // TODO Login APi
  login(String username, password,context) async {
    print("My username $username");
    print("My username $password");
    try {
      final response = await http.post(
          Uri.parse('http://192.168.1.27:8000/api/login/'),
          body: {
            "username": username,
            "password": password,
          }
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("Data $data");
        print("Login Successfully");
        Fluttertoast.showToast(
            msg: "Login Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()));
        // Navigator.pushNamed(context, BottomNavigationBarScreen.routeName);
      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: "Failed ${response.body}",
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

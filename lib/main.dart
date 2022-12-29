import 'package:flutter/material.dart';
import 'package:myreceipeapp/screens/bottomnavigationbar.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/addpost_screen.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/home_screen.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/myfavouriterecipes_screen.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/myprofile_screen.dart';
import 'package:myreceipeapp/screens/editprofile_screen.dart';
import 'package:myreceipeapp/authentication/login_screen.dart';
import 'package:myreceipeapp/authentication/signup_screen.dart';
import 'package:myreceipeapp/screens/welcome_screen.dart';

void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      routes: {
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        BottomNavigationBarScreen.routeName: (context) => const BottomNavigationBarScreen(),
        AddPostScreen.routeName: (context) => const AddPostScreen(),
        FavouriteRecipesScreen.routeName: (context) => const FavouriteRecipesScreen(),
        MyProfileScreen.routeName: (context) => const MyProfileScreen(),
        EditProfileScreen.routeName: (context) => const EditProfileScreen(),
        // AllRecipesScreen.routeName: (context) => const AllRecipesScreen(),
      },
      home: const WelcomeScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   void squareNumber(int n){
//     List myList = [];
//     int square;
//     print("Square of Number is ${square = n * n}");
//     myList.add(square);
//     print("List ${square}");
//   }
//
//   void fictorialNumber(int n){
//     for(int i = n - 1; i > 0; i--){
//       n = n * i;
//     }
//     print("Fictorial of Number is ${n}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             MaterialButton(
//               color: Colors.orangeAccent,
//               onPressed: (){
//                 squareNumber(5);
//               },
//               child: const Text("Take Square"),
//             ),
//             const SizedBox(height: 20.0,),
//             MaterialButton(
//               color: Colors.green,
//               onPressed: (){
//                 fictorialNumber(5);
//               },
//               child: const Text("Take Square"),
//             ),
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

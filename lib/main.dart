import 'package:flutter/material.dart';
import 'package:myreceipeapp/screens/authentication/login_screen.dart';
import 'package:myreceipeapp/screens/authentication/signup_screen.dart';
import 'package:myreceipeapp/screens/bottomnavigationbar.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/addpost_screen.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/home_screen.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/myfavouriterecipes_screen.dart';
import 'package:myreceipeapp/screens/bottomnavigationbarscreens/myprofile_screen.dart';
import 'package:myreceipeapp/screens/constants/colors.dart';
import 'package:myreceipeapp/screens/editprofile_screen.dart';
import 'package:myreceipeapp/screens/models/model_theme.dart';
import 'package:myreceipeapp/screens/sharedpreference/sharedpref_class.dart';
import 'package:myreceipeapp/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MySharedPrefClass.preferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ModelTheme(),
        child: Consumer<ModelTheme>(
            builder: (context, ModelTheme themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Recipe App',
            theme: themeNotifier.isDark
                ? ThemeData(
                    brightness: Brightness.dark,
                  )
                : ThemeData(
                    brightness: Brightness.light,
                    scaffoldBackgroundColor: secondColor,
                  ),
            routes: {
              SignUpScreen.routeName: (context) => const SignUpScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              BottomNavigationBarScreen.routeName: (context) =>
                  const BottomNavigationBarScreen(),
              AddPostScreen.routeName: (context) => const AddPostScreen(),
              FavouriteRecipesScreen.routeName: (context) =>
                  const FavouriteRecipesScreen(),
              MyProfileScreen.routeName: (context) => const MyProfileScreen(),
              EditProfileScreen.routeName: (context) =>
                  const EditProfileScreen(),
              // AllRecipesScreen.routeName: (context) => const AllRecipesScreen(),
            },
            home: MySharedPrefClass.preferences?.getBool("loggedIn") == true
                ? const BottomNavigationBarScreen()
                : const WelcomeScreen()
          );
        }));
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

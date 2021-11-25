
import 'package:bikes_app/screens/main_screen.dart';
import 'package:bikes_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserLoggedIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UserLoggedIn extends StatefulWidget {
  const UserLoggedIn({Key? key}) : super(key: key);

  @override
  _UserLoggedInState createState() => _UserLoggedInState();
}

class _UserLoggedInState extends State<UserLoggedIn> {
  @override
  late SharedPreferences logindata;
  late bool newuser;
  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    print("login data is {$logindata.text}");
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
    }
    else{
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SplashScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

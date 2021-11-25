import 'package:bikes_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
 late SharedPreferences logindata;
 late String phoneNumber;
 void initial() async {
   logindata = await SharedPreferences.getInstance();
   setState(() {
     phoneNumber = logindata.getString('phoneNumber');
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [Text("name is manan"),IconButton(onPressed: (){setState(() {
          logindata.setBool('login', true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        });}, icon: Icon(Icons.settings))],
      )),
    );
  }
}

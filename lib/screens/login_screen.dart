import 'package:bikes_app/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passenable = true; //boolean value to track password view enable disable.
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top-image
              Center(
                  child:
                      Image.asset("assets/images/red_racer.jpg", height: 250)),
              //title-motors
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 15),
                  child: Text(
                    "MOTORS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: Color(0xFF172B4D),
                    ),
                  ),
                ),
              ),
              //phone no input
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Row(
                  children: [
                    const Icon(Icons.phone),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            controller: phoneController,
                            decoration:
                                const InputDecoration(hintText: "Phone"),
                          )),
                    ),
                  ],
                ),
              ),
              //password input
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Row(
                  children: [
                    const Icon(Icons.lock_outlined),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          controller: passwordController,
                          obscureText: passenable,
                          decoration: InputDecoration(
                              hintText: "Password",
                              suffix: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      //refresh UI
                                      if (passenable) {
                                        passenable = false;
                                      } else {
                                        passenable = true;
                                      }
                                    });
                                  },
                                child: Icon(passenable == true
                                      ? Icons.remove_red_eye
                                      : Icons.password))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              //login button
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      if(phoneController.text!='' && passwordController.text!=''){
                        logindata.setBool('login', false);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 14, bottom: 14),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF0065FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                  ),
                ),
              ),
              //horizontal line with or
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 15.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 50,
                        ),
                      ),
                    ),
                    const Text("OR"),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 20.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Login with google
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Padding(
                      padding: EdgeInsets.only(top: 14, bottom: 14, left: 30),
                      child: Text(
                        'Login with Google',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFF1F5F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    icon: Image.asset(
                      "assets/images/google_logo.png",
                      height: 24,
                    ),
                  ),
                ),
              ),
              //new to motors signup
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'New to Motors? ',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                        print("button");
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0065FF),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

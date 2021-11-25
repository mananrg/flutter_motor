import 'package:bikes_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool _value = false;
  final _snackBar1 = SnackBar(
    content: const Text('Please enter the phone number'),
    duration: const Duration(seconds: 10),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        print('Action is clicked');
      },
      textColor: Colors.white,
      disabledTextColor: Colors.grey,
    ),
  );
  final _snackBar2 = SnackBar(
    content: const Text('Please enter the Email'),
    duration: const Duration(seconds: 10),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        print('Action is clicked');
      },
      textColor: Colors.white,
      disabledTextColor: Colors.grey,
    ),
  );
  final _snackBar3 = SnackBar(
    content: const Text('Please enter the password number'),
    duration: const Duration(seconds: 10),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        print('Action is clicked');
      },
      textColor: Colors.white,
      disabledTextColor: Colors.grey,
    ),
  );
  final _snackBar4 = SnackBar(
    content: const Text('Please agree to the Privacy Policy'),
    duration: const Duration(seconds: 10),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        print('Action is clicked');
      },
      textColor: Colors.white,
      disabledTextColor: Colors.grey,
    ),
  );


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
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 8),
              child: Column(
                children: [
                  //motors text
                  RichText(
                    textAlign: TextAlign.start,
                    text: const TextSpan(
                      text: 'M',
                      style: TextStyle(color: Color(0xFF0065FF), fontSize: 58),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'otors',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //other texts
                  const Center(
                    child: Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Center(
                    child: Text("Please sign up to enter "),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text("Enter via social networks:"),
                  ),
                  //sign up with google button
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          label: const Padding(
                            padding:
                                EdgeInsets.only(top: 14, bottom: 14, left: 22),
                            child: Text(
                              'Sign-Up with Google',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFF1F5F6),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          icon: Image.asset(
                            "assets/images/google_logo.png",
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //or sign up with phone text
                  const Center(
                    child: Text("or signup with phone"),
                  ),
                  //phone number input
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
                                decoration: const InputDecoration(
                                    hintText: "Phone",
                                    border: OutlineInputBorder()),
                              )),
                        ),
                      ],
                    ),
                  ),
                  //email
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Row(
                      children: [
                        const Icon(Icons.email),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                    hintText: "E-mail",
                                    border: OutlineInputBorder()),
                              )),
                        ),
                      ],
                    ),
                  ),
                  //password
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Row(
                      children: [
                        const Icon(Icons.lock_outlined),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextField(
                                controller: passwordController,
                                decoration: const InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder()),
                              )),
                        ),
                      ],
                    ),
                  ),
                  //i agree with the privacy policy
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 5),
                    child: SizedBox(
                      child: Center(
                        child: CheckboxListTile(
                          title: const Text('I agree with the Privacy Policy'),
                          autofocus: false,
                          activeColor: const Color(0xFF0065FF),
                          checkColor: Colors.white,
                          value: _value,
                          onChanged: (bool? value) {
                            setState(() {
                              _value = value!;
                            });
                          },
                        ),
                      ), //Center
                    ),
                  ),
                  //signup button
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          if (phoneController.text != '' &&
                              emailController.text != '' &&
                              passwordController.text != '' &&
                              _value == true) {
                            print("11111111111111");
                            logindata.setBool('login', false);
                            print("22222222222222");
                            logindata.setString(
                                'phoneNumber', phoneController.text);
                            print("Successfull");
                            print("email is ${emailController.text}");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()));
                          }
                          if (phoneController.text == '') {
                            // ScaffoldMessenger.of(context).showSnackBar(_snackBar1);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(_snackBar1);
                          } else if (emailController.text == '') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(_snackBar2);
                          } else if (passwordController.text == '') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(_snackBar3);
                          } else if (_value == false) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(_snackBar4);
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 14, bottom: 14),
                          child: Text(
                            'Sign-Up',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF0065FF),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                    ),
                  ),
                  //already have an account login
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an Account? ',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                            print("button");
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF0065FF),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordController.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:note/components/alert_component.dart';
import 'package:note/screen/main_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<String> username = [
    "demark",
    "dandrib",
    "mikedexter",
    "dick",
    "mariane",
  ];
  List<String> password = [
    "demark1",
    "dandrib2",
    "mikedexter3",
    "dick4",
    "mariane5",
  ];
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/bg.png",
                        height: 200,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Notes",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: Color.fromRGBO(34, 139, 34, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        height: 1,
                        color: Color.fromRGBO(34, 139, 34, 1),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (usernameController.text == "") {
                            showDialog(
                              context: context,
                              builder: (context) => AlertUser(
                                title: "Username is required.",
                                content: "Please fill the username field.",
                              ),
                            );
                          } else if (passwordController.text == "") {
                            showDialog(
                              context: context,
                              builder: (context) => AlertUser(
                                title: "Password is required.",
                                content: "Please fill the password field.",
                              ),
                            );
                          } else {
                            var valid = false;
                            for (int i = 0; i < 5; i++) {
                              if (usernameController.text == username[i] &&
                                  passwordController.text == password[i]) {
                                valid = true;
                                break;
                              }
                            }
                            if (valid) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertUser(
                                  title: "Invalid account",
                                  content:
                                      "Please check your username and password",
                                ),
                              );
                              usernameController.clear();
                              passwordController.clear();
                            }
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Color.fromRGBO(34, 139, 34, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

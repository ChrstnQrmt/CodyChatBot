import 'dart:convert';

import 'package:cody/classes/homepage.dart';
import 'package:cody/classes/register.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user.dart';
import '../styles/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userTEC = TextEditingController();
  final TextEditingController _passTEC = TextEditingController();
  final _loginbox = Hive.box("_loginbox");
  DatabaseReference dbReference =
      FirebaseDatabase.instance.ref().child("Users/");

  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/loginpage_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                height: 410,
                width: 360,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Learn something new \n today!',
                        style: TextStyle(
                          color: Color(0xFF579981),
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextField(
                          controller: _userTEC,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              color: Color(0xFF579981),
                            ),
                            hintText: 'enter your username',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF579981),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xFF579981),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextField(
                          controller: _passTEC,
                          obscureText: _hidePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Color(0xFF579981),
                            ),
                            hintText: 'enter your password',
                            hintStyle: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF579981),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.key,
                              color: Color(0xFF579981),
                            ),
                            suffixIcon: IconButton(
                              color: const Color(0xFF579981),
                              icon: _hidePassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _hidePassword = !_hidePassword;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      Container(
                        padding: const EdgeInsets.only(left: 25.0, right: 25),
                        width: 355,
                        height: 50,
                        child: ElevatedButton(
                          style: buttonPrimary,
                          onPressed: () {
                            dbReference.get().then((snapshot) {
                              for (final data in snapshot.children) {
                                if (data.key == _userTEC.text) {
                                  Map<String, dynamic> myObj =
                                      jsonDecode(jsonEncode(data.value));
                                  User myUserobj = User.fromJson(myObj);
                                  if (myUserobj.password == _passTEC.text) {
                                    _loginbox.put("isLoggedIn", true);
                                    _loginbox.put("User", _userTEC.text);
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const HomePage(),
                                      ),
                                    );
                                  } else {
                                    debugPrint("Wrong Password");
                                  }
                                } else {
                                  debugPrint("Does not Exist");
                                  continue;
                                }
                              }
                            });
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const RegisterPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF579981),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

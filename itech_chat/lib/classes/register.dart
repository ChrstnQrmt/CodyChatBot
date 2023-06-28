import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../styles/button.dart';
import 'loginpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool hidepass1 = true;
  bool hidepass2 = true;
  final TextEditingController _user1 = TextEditingController();
  final TextEditingController _user2 = TextEditingController();
  final TextEditingController _pass1 = TextEditingController();
  final TextEditingController _pass2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: (100),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: const EdgeInsets.only(top: 10, left: 25),
          iconSize: 35,
          color: const Color(0xFF579981),
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage(),
              ),
            );
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/register_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                height: 500,
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
                        'Create an account',
                        style: TextStyle(
                          color: Color(0xFF579981),
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      // unang first textfield
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            controller: _user1,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xFF579981),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF579981),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF579981),
                              ),
                              hintText: 'enter your username',
                              hintStyle:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      // textfield din e2
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _user2,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.assignment_ind_rounded,
                                color: Color(0xFF579981),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF579981),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              hintText: 'enter your student id number',
                              labelText: 'Student ID',
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF579981),
                              ),
                              hintStyle:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      //eto yon ed unang pass textfield
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            controller: _pass1,
                            obscureText: hidepass1,
                            decoration: InputDecoration(
                              labelText: 'Enroll a password',
                              labelStyle: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF579981),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF579981),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              hintText: 'enter a strong password',
                              hintStyle: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                              prefixIcon: const Icon(
                                Icons.key,
                                color: Color(0xFF579981),
                              ),
                              iconColor: const Color(0xFF579981),
                              suffixIcon: IconButton(
                                color: const Color(0xFF579981),
                                icon: hidepass1
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    hidepass1 = !hidepass1;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            controller: _pass2,
                            obscureText: hidepass2,
                            decoration: InputDecoration(
                              labelText: 'Enroll a password',
                              labelStyle: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF579981),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF579981),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              hintText: 'enter a strong password',
                              hintStyle: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                              prefixIcon: const Icon(
                                Icons.key,
                                color: Color(0xFF579981),
                              ),
                              iconColor: const Color(0xFF579981),
                              suffixIcon: IconButton(
                                color: const Color(0xFF579981),
                                icon: hidepass2
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    hidepass2 = !hidepass2;
                                  });
                                },
                              ),
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
                          onPressed: () async {
                            DatabaseReference dbReference = FirebaseDatabase
                                .instance
                                .ref()
                                .child("Users/${_user1.text}/");
                            await dbReference
                                .child("username")
                                .set(_user1.text);
                            await dbReference
                                .child("studentid")
                                .set(_user2.text);
                            await dbReference
                                .child("password")
                                .set(_pass1.text);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign up',
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

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user.dart';
import '../util/alert_dialog.dart';
import 'homepage.dart';
import 'loginpage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _loginbox = Hive.box("_loginbox");
  late var username = _loginbox.get("User");
  String title = 'AlertDialog';
  bool tappedYes = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: (100),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20),
          child: IconButton(
            iconSize: 35,
            color: const Color(0xFF579981),
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 20),
            child: IconButton(
              iconSize: 40,
              onPressed: () async {
                final action = await AlertDialogs.yesCancelDialog(
                    context,
                    'Logout this account?',
                    'you can always come back any time.');
                if (action == DialogsAction.yes) {
                  setState(() => tappedYes = true);
                  _loginbox.put("isLoggedIn", false);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const LoginPage(),
                    ),
                  );
                } else {
                  setState(() => tappedYes = false);
                }
              },
              icon: const Icon(Icons.exit_to_app_rounded),
              color: const Color(0xFF579981),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 140,
          left: 100,
          right: 100,
        ),
        child: FutureBuilder(
            future: getUser(),
            builder: (context, AsyncSnapshot<List<User>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          color: Color(0xFF579981),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Loading..."),
                    ],
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.warning_amber_rounded,
                    ),
                    Text(
                      "Something went wrong",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF579981),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Please Try again.",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF579981),
                      ),
                    )
                  ],
                ));
              }
              return Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage('assets/male hihi.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    snapshot.data!.first.username,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF579981),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    'Student',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 35,
                    width: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.200),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        snapshot.data!.first.studentid,
                        style:
                            const TextStyle(fontSize: 12, letterSpacing: 0.8),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Future<List<User>> getUser() async {
    List<User> myUser = [];
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child("Users/$username");
    try {
      await databaseReference.get().then((snapshot) {
        Map<String, dynamic> myObj = jsonDecode(jsonEncode(snapshot.value));
        User myUserObj = User.fromJson(myObj);
        myUser.add(myUserObj);
      });
      return myUser;
    } catch (error) {
      rethrow;
    }
  }
}

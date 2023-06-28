import 'package:cody/classes/homepage.dart';
import 'package:cody/classes/welcomescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

bool? userLoggedIn;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  var _loginbox = await Hive.openBox("_loginbox");

  userLoggedIn = await _loginbox.get("isLoggedIn");

  userLoggedIn ??= false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot',
      theme: ThemeData(
        primaryColor: Colors.white,
        splashColor: Colors.white,
        highlightColor: Colors.black.withOpacity(0.5),
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      home: userLoggedIn! ? const HomePage() : const WelcomePage(),
    );
  }
}

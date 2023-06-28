import 'package:flutter/material.dart';

import 'loginpage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 110.0),
          ),
          Image.asset('assets/welcome.jpg'),
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          const Text(
            "Four languages, one app",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 6),
          ),
          const Text(
            "You are one tap away from having a\n learning companion!",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            width: 215,
            height: 50,
            child: Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF579981),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Explore now',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

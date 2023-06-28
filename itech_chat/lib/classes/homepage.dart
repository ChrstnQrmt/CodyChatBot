import 'package:cody/classes/javol.dart';
import 'package:cody/classes/profilepage.dart';
import 'package:cody/classes/python.dart';
import 'package:cody/classes/seahush.dart';
import 'package:cody/classes/seaplus.dart';
import 'package:cody/util/my_card.dart';
import 'package:cody/util/my_card_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final _controller = PageController();

class _HomePageState extends State<HomePage> {
  DateTime backPressedTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _onBackButtonDoubleClicked(context),
        child: Scaffold(
          //bottom nav
          resizeToAvoidBottomInset: false,
          floatingActionButton: SizedBox(
            height: 90,
            width: 90,
            child: FloatingActionButton(
              elevation: 10,
              onPressed: () {},
              backgroundColor: const Color(0xFF579981),
              child: const Image(
                color: Colors.white,
                height: 35,
                width: 35,
                image: AssetImage('assets/send.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            elevation: 200,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.home_rounded),
                    color: const Color(0xFF579981),
                    iconSize: 40,
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ProfilePage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.person_rounded),
                    iconSize: 40,
                    color: const Color(0xFF579981),
                  ),
                ],
              ),
            ),
          ),
          //main body
          //your chat sa taas eto code non ehe labyu tian
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Your',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Chats',
                              style: TextStyle(fontSize: 28),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //ano to pre eto yung mga cards sa taas ehe
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 205,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      children: const [
                        MyCard(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                        ),
                        MyCardEmpty(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 2,
                    effect: const ExpandingDotsEffect(
                      dotWidth: 15,
                      dotColor: Color(0xFFC7E6C9),
                      activeDotColor: Color(0xFF579981),
                    ),
                  ),
                  // java convo container eto inaayos mo
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, top: 17),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 60,
                                width: 65,
                                padding: const EdgeInsets.all(22),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.10),
                                        blurRadius: 4,
                                      )
                                    ]),
                                child: Image.asset(
                                  'assets/j.png',
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                width: 220,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Java',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    SizedBox(height: 4),
                                    Text(
                                      'A study lab dedicated for java fanboys.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                iconSize: 25,
                                color: const Color(0xFF579981),
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Home(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // c++ convo container
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, top: 14),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 60,
                                width: 65,
                                padding: const EdgeInsets.all(22),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.10),
                                        blurRadius: 4,
                                      )
                                    ]),
                                child: Image.asset(
                                  'assets/c.png',
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                width: 220,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('C++',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    SizedBox(height: 4),
                                    Text(
                                      'A study lab dedicated for C++ peeps.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                iconSize: 25,
                                color: const Color(0xFF579981),
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Seaplus(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // python convo container
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, top: 14),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 65,
                                padding: const EdgeInsets.all(22),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.10),
                                        blurRadius: 4,
                                      )
                                    ]),
                                child: Image.asset(
                                  'assets/p.png',
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                width: 220,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Python',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    SizedBox(height: 4),
                                    Text(
                                      'A study lab dedicated for python stans.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                iconSize: 25,
                                color: const Color(0xFF579981),
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Python(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //c# convo container
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 14, bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 65,
                                padding: const EdgeInsets.all(22),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.10),
                                        blurRadius: 4,
                                      )
                                    ]),
                                child: Image.asset(
                                  'assets/c.png',
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                width: 220,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('C#',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    SizedBox(height: 4),
                                    Text(
                                      'A study lab dedicated for C# sluts.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                iconSize: 25,
                                color: const Color(0xFF579981),
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Seahush(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      width: 200,
      backgroundColor: Colors.grey,
      duration: const Duration(milliseconds: 1000),
    ));
  }

  Future<bool> _onBackButtonDoubleClicked(BuildContext context) async {
    final difference = DateTime.now().difference(backPressedTime);
    backPressedTime = DateTime.now();

    if (difference >= const Duration(seconds: 1)) {
      toast(context, "Press again to exit");
      return false;
    } else {
      SystemNavigator.pop(animated: true);
      return true;
    }
  }
}

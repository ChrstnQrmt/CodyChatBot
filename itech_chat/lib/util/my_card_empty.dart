import 'package:flutter/material.dart';

class MyCardEmpty extends StatefulWidget {
  const MyCardEmpty({super.key});

  @override
  State<MyCardEmpty> createState() => _MyCardEmptyState();
}

class _MyCardEmptyState extends State<MyCardEmpty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      width: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: const DecorationImage(
          alignment: Alignment.centerRight,
          image: AssetImage('assets/woman.png'),
        ),
        color: const Color(0xFFC7E6C9),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 10),
            child: Text(
              'Want to be \na developer?',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF579981),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 6, left: 10, bottom: 10),
            child: Text(
              'think again.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF579981),
              ),
            ),
          ),
          Container(
            width: 90,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26),
            ),
            child: const Center(
              child: Text(
                'choose wisely',
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF579981),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

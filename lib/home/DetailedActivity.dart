import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  Map<String, dynamic> activities = {
    'name': 'bodypump',
    'image': 'assets/swimming.png',
    'description': 'Training for beginner'
  };
  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
      Container(
      width: 393,
      height: 270,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assert/yoga.png"),
            fit: BoxFit.cover,
          ),
        ),
    ),
        Container(
          width: 361,
          height: 403,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 31,
                child: SizedBox(
                  width: 361,
                  height: 74,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: activities['description'],
                          style: TextStyle(
                            color: Color(0xFF0C1A30),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                            letterSpacing: 0.20,
                          ),
                        ),
                        TextSpan(
                          text: 'read more ',
                          style: TextStyle(
                            color: Color(0xFFF34E3A),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            height: 0.11,

                            letterSpacing: 0.20,
                          ),
                        ),
    ],
    ),
    ),
    ),
    ),
    Positioned(
    left: 0,
    top: 0,
    child: Container(
    width: 119,
    height: 24,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(
    width: 318,
    child: Text.rich(
    TextSpan(
    children: [
    TextSpan(
    text: 'Description',
    style: TextStyle(
    color: Color(0xFF0C1A30),
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 0.06,
    letterSpacing: 0.20,
    ),
    ),
    TextSpan(
    text: ' ',
    style: TextStyle(
    color: Color(0xFF0C1A30),
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 0.09,
    letterSpacing: 0.20,
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    Positioned(
    left: 0,
    top: 225,
    child: Container(
    width: 318,
    height: 178,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(
    width: 318,
    child: Text(
    'Trainers',
    style: TextStyle(
    color: Color(0xFF0C1A30),
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 0.06,
    letterSpacing: 0.20,
    ),
    ),
    ),
    const SizedBox(height: 13),
    Container(
    width: double.infinity,
    child: Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    const SizedBox(width: 21),
    Container(
    width: 122,
    height: 41.63,
    child: Stack(
    children: [
    Positioned(
    left: 0,
    top: 0,
    child: SizedBox(
    width: 101,
    height: 18,
    child: Text(
    'Ahmed Ali',
    style: TextStyle(
    color: Color(0xFF170F49),
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    height: 0.06,
    ),
    ),
    ),
    ),
    Positioned(
    left: 0,
    top: 23.71,
    child: SizedBox(
    width: 122,
    height: 17.92,
    child: Text(
    'coach de yoga',
    style: TextStyle(
    color: Color(0xFF6E6B8F),
    fontSize: 15,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    height: 0.09,
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    const SizedBox(height: 13),
    Container(
    width: double.infinity,
    child: Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    const SizedBox(width: 21),
    Container(
    width: 122,
    height: 41.63,
    child: Stack(
    children: [
    Positioned(
    left: 0,
    top: 0,
    child: SizedBox(
    width: 101,
    height: 18,
    child: Text(
    'Mariem',
    style: TextStyle(
    color: Color(0xFF170F49),
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    height: 0.06,
    ),
    ),
    ),
    ),
    Positioned(
    left: 0,
    top: 23.71,
    child: SizedBox(
    width: 122,
    height: 17.92,
    child: Text(
    'coach de yoga',
    style: TextStyle(
    color: Color(0xFF6E6B8F),
    fontSize: 15,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    height: 0.09,
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    ),

      ],
    );
  }
}
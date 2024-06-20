import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Onboarding4 extends StatefulWidget {
  const Onboarding4({super.key});

  @override
  State<Onboarding4> createState() => _Intro1State();
}

class _Intro1State extends State<Onboarding4> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.black),
          child: Stack(
            children: [
      
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width/3,
                    height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF262A2F), Colors.black.withOpacity(0)],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 293,
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0x2BF34D39), Colors.black.withOpacity(0)],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 157,
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF413F3F), Colors.black.withOpacity(0)],
                    ),
                  ),
                ),
              ),
              Center(
      
                child:SizedBox(
      
                  height: 127,
                  width: 193,
                  child: Container(
                    decoration: BoxDecoration(
      
                      image: DecorationImage(
                        image: AssetImage("assets/intro4.png"),
      
      
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Intro1State();
}

class _Intro1State extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/intro2.png"),
          fit: BoxFit.cover,


        ),

      ),
      child: Center(

          child:  Column(children: [
            SizedBox(height: 480,),
            SizedBox(
              width: 302,
              child: Text(
                'Build Your Mind and Body',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 32,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Be an Inspiration',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
                height: 0,
              ),
            ),
            SizedBox(height: 10,),

          ],)

      ),

    );
  }
}

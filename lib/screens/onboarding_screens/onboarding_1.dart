import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/intro1.png"),
          fit: BoxFit.cover,


        ),

      ),
      child: Center(


          child:  Column(children: [
            SizedBox(height: 480,),
            SizedBox(
              width: 302,
              child: Text(
                'Get Stronger for Preparation',
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
            10.h.verticalSpace,
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
import 'package:flutter/material.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key});

  @override
  State<Onboarding3> createState() => _Intro1State();
}

class _Intro1State extends State<Onboarding3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/intro3.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(

          child:  Column(children: [
            SizedBox(height: 480,),
            SizedBox(
              width: 302,
              child: Text(
                'Running to Your Dream',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Poppins',
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
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontFamily: 'Poppins',
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

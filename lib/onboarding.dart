import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gymproconnect_flutter/home/login.dart';
import 'package:gymproconnect_flutter/onboarding_screens/onboarding_1.dart';
import 'package:gymproconnect_flutter/onboarding_screens/onboarding_2.dart';
import 'package:gymproconnect_flutter/onboarding_screens/onboarding_3.dart';
import 'package:gymproconnect_flutter/onboarding_screens/onboarding_4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _IntroductionState();
}

class _IntroductionState extends State<Onboarding> {
  PageController _controller = PageController();
  bool onLastPage = false;
  bool Page3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      onLastPage = (index == 3);
                      Page3 = (index == 2);
                      if (onLastPage) {
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.pushReplacementNamed(context, '/login');
                        });
                      }
                    });
                  },
                  children: [
                    Onboarding1(),
                    Onboarding2(),
                    Onboarding3(),
                    Onboarding4(),
                  ],
                ),
                Container(
                  alignment: Alignment(0, 0),
                  child: Stack(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.7),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.width * 0.95,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [Colors.black.withOpacity(0), Colors.black],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 600,
                            ),
                            SmoothPageIndicator(
                              controller: _controller,
                              count: 4,
                              effect: ScaleEffect(
                                dotWidth: 10,
                                dotHeight: 5,
                              ),
                            ),
                            SizedBox(height: 40),
                            onLastPage
                                ? SizedBox(
                              width: 398,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'GYMPRO',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                        letterSpacing: 10,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'CONNECT',
                                      style: TextStyle(
                                        color: Color(0xFFF34E3A),
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                        letterSpacing: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                                : Page3
                                ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFf34e3a),
                                minimumSize: Size(285, 49),
                              ),
                              onPressed: () {
                                _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: Text(
                                "Get started",
                                style: TextStyle(fontSize: 18.0, color: Colors.white),
                              ),
                            )
                                : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(
                                    width: 2,
                                    color: Color(0xFFF34E3A),
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                minimumSize: Size(285, 49),
                              ),
                              onPressed: () {
                                _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(fontSize: 18.0, color: Color(0xFFF34E3A)),
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
        ],
      ),
    );
  }
}
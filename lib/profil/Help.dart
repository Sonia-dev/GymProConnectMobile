import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HelpCenter extends StatelessWidget {
  @override
  String searchText = '';
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile',style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
              },
          ),
        ),
      body: SingleChildScrollView(
      child:Center(
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:
          Column(
            children: [
              TextFormField(
                  onChanged: (value) {


                  },

                  decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    floatingLabelStyle: const TextStyle(color: Colors.black),
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search),
                    filled:true,
                    fillColor: Color(0xffF7F9FD),
                    labelStyle: TextStyle( color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(width: 1, color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(width: 1, color: Colors.white)),
                  )






              ),
              Container(

                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        height: 852,
                        padding: const EdgeInsets.only(bottom: 21),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      Container(
                        width: double.infinity,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.75),
                          border: Border(
                            left: BorderSide(),
                            top: BorderSide(),
                            right: BorderSide(),
                            bottom: BorderSide(width: 0.33),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 393,
                              height: 54,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
                                      padding: const EdgeInsets.only(top: 18.34, bottom: 13.66),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '9:41',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              height: 0.08,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 112),
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
                                      padding: const EdgeInsets.only(
                                        top: 23,
                                        left: 30,
                                        right: 32.17,
                                        bottom: 18,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 7.50),
                                          const SizedBox(width: 7.50),
                                          Container(
                                            width: 27.33,
                                            height: 13,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Opacity(
                                                    opacity: 0.35,
                                                    child: Container(
                                                      width: 25,
                                                      height: 13,
                                                      decoration: ShapeDecoration(
                                                        shape: RoundedRectangleBorder(
                                                          side: BorderSide(width: 1),
                                                          borderRadius: BorderRadius.circular(4.30),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 2,
                                                  top: 2,
                                                  child: Container(
                                                    width: 21,
                                                    height: 9,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(2.50),
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 393,
                        height: 777,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 393,
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Positioned(
                                        left: 129,
                                        top: 2,
                                        child: Text(
                                          'Help Center',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF181D27),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0.10,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(width: 22, height: 22),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 44,
                              height: 44,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 44,
                                      height: 44,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFF6F8FC),
                                        shape: OvalBorder(
                                          side: BorderSide(width: 1, color: Color(0xFFEDF1FA)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 343,
                                    height: 185,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 71,
                                          child: Container(
                                            width: 343,
                                            height: 114,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 46,
                                                  top: 12,
                                                  child: SizedBox(
                                                    width: 276,
                                                    height: 38,
                                                    child: Text(
                                                      'WhatsApp',
                                                      style: TextStyle(
                                                        color: Color(0xFF555555),
                                                        fontSize: 11,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w300,
                                                        height: 0.14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 8,
                                                  top: 14,
                                                  child: Container(
                                                    width: 26,
                                                    height: 26,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: BoxDecoration(),
                                                    child: Stack(children: [

                                                        ]),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 9.50,
                                          top: 11.50,
                                          child: Container(
                                            width: 26,
                                            height: 26,
                                            padding: const EdgeInsets.symmetric(horizontal: 2.89),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 20.22,
                                                  height: 26,
                                                  child: Stack(children: [

                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 45.50,
                                          top: 21.50,
                                          child: SizedBox(
                                            width: 276,
                                            height: 18,
                                            child: Text(
                                              'Technical Hotline',
                                              style: TextStyle(
                                                color: Color(0xFF555555),
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w300,
                                                height: 0.14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 17),
                                  Container(
                                    width: 343,
                                    height: 54,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 45.50,
                                          top: 21.50,
                                          child: SizedBox(
                                            width: 276,
                                            height: 18,
                                            child: Text(
                                              'Website',
                                              style: TextStyle(
                                                color: Color(0xFF555555),
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w300,
                                                height: 0.14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 8,
                                          top: 14,
                                          child: Container(
                                            width: 26,
                                            height: 26,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 17),
                                  Container(
                                    width: 343,
                                    height: 54,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 9,
                                          top: 15,
                                          child: Container(
                                            width: 26,
                                            height: 26,
                                            padding: const EdgeInsets.symmetric(horizontal: 0.82, vertical: 0.89),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 45.50,
                                          top: 21.50,
                                          child: SizedBox(
                                            width: 276,
                                            height: 18,
                                            child: Text(
                                              'Facebook',
                                              style: TextStyle(
                                                color: Color(0xFF555555),
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w300,
                                                height: 0.14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 17),
                                  Container(
                                    width: 343,
                                    height: 54,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 8,
                                          top: 15,
                                          child: Container(
                                            width: 26,
                                            height: 26,
                                            child: Stack(children: [

                                                ]),
                                          ),
                                        ),
                                        Positioned(
                                          left: 45.50,
                                          top: 21.50,
                                          child: SizedBox(
                                            width: 276,
                                            height: 18,
                                            child: Text(
                                              'Instagram',
                                              style: TextStyle(
                                                color: Color(0xFF555555),
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w300,
                                                height: 0.14,
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
                            SizedBox(
                              width: 221,
                              height: 18,
                              child: Text(
                                '(00 216) 27 500 258',
                                style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                ),
                              ),
                            ),
                            Container(
                              width: 5,
                              height: 5,
                              decoration: ShapeDecoration(
                                color: Color(0xFFF34E3A),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 2, color: Color(0xFFF34E3A)),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                        ),
                      ),
                    ),
                    Positioned(
                left: 315,
                top: 174,
                child: Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.all(3),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                    ],
                  ),
                ),
              ),
                    Positioned(
                left: 0,
                top: 206,
                child: Container(
                  width: 393,
                  height: 204.50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: -0,
                        top: 29,
                        child: Container(
                          width: 393,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.60,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0x44212121),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 29,
                        child: Container(
                          width: 393,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.60,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0x44E8E8E8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 262,
                        top: 27,
                        child: Container(
                          width: 59.74,
                          height: 3,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF34E3A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 54.50,
                        top: 0,
                        child: SizedBox(
                          width: 88.03,
                          height: 20,
                          child: Text(
                            'FAQ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF555555),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0.10,
                              letterSpacing: -0.41,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 228.46,
                        top: 0,
                        child: SizedBox(
                          width: 113.18,
                          height: 20,
                          child: Text(
                            'Contact Us',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0x7FF34E3A),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0.10,
                              letterSpacing: -0.41,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                    Positioned(
                left: 16,
                top: 136,
                child: Container(
                  width: 343,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 343,
                          height: 50,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF6F8FC),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFFEDF1F9)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 21.44,
                        top: 16,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Search',
                                style: TextStyle(
                                  color: Color(0xFFB7C4E0),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 0.26,
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  color: Color(0xFFB7C4E0),
                                  fontSize: 13,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 0.26,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 307.42,
                        top: 17.25,
                        child: Container(
                          width: 13.82,
                          height: 13.50,
                          child: Stack(children: [

                              ]),
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
          ),
        ),
      ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymproconnect_flutter/data/controllers/details_activity_controller.dart';
import 'package:gymproconnect_flutter/screens/home/reviews.dart';

import '../payment/payment_methods.dart';


class Pack extends GetView<ActivityDetailsController> {
  @override
  Widget build(BuildContext context) {
    final activity = Get.arguments;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Column(
                          children: [
                            Container(
                              width: 393,
                              height: 270,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      activity.image), // Utilisation de NetworkImage
                                  fit: BoxFit.cover,
                                ),
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  SizedBox(height: 200,),
                                  Positioned(
                                    left: -160,
                                    bottom: -140,
                                    child: SizedBox(
                                      width: 100,
                                      height: 20,
                                      child: Text(
                                        activity.category.name.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFF34E3A),
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 0.10,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    left: -80,
                                    bottom: -150,
                                    child: SizedBox(
                                      width: 150,
                                      height: 20,
                                      child: Text(
                                        activity.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),],
                              ),

                            ),



                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'About',
                                    style: TextStyle(
                                      color: Color(0xFFF8A69C),
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => reviews()),
                                      );
                                    },
                                    child: Text(
                                      'Reviews',
                                      style: TextStyle(
                                        color: Color(0xFF555555),
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                activity.description.toString(),
                                style: TextStyle(
                                  color: Color(0xFF0C1A30),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                      color: Color(0xFFABABAB),
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Spacer(flex: 10),
                                  Text(
                                    'Durée',
                                    style: TextStyle(
                                      color: Color(0xFFABABAB),
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Monday & Friday',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '45 min',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Capacité',
                                    style: TextStyle(
                                      color: Color(0xFFABABAB),
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '30',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Trainers',
                                    style: TextStyle(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              height: 200.0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 32,
                                          child: Image.network(
                                            activity.coach.image,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return SizedBox(
                                                  child: Image.asset(
                                                      "assets/no_image.jpg"));
                                            },
                                            loadingBuilder:
                                                (context, child, loadingProgress) {
                                              if (loadingProgress
                                                  ?.expectedTotalBytes ==
                                                  loadingProgress
                                                      ?.cumulativeBytesLoaded) {
                                                return child;
                                              }
                                              return const CircularProgressIndicator();
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        // Ajoute un espace entre l'image et le texte
                                        Column(
                                          children: [
                                            Text(
                                              activity.coach.name.toString(),
                                              style: TextStyle(
                                                color: Color(0xFF170F49),
                                                fontSize: 18,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),

                                            SizedBox(height: 5),
                                            // Ajoute un espace vertical entre les deux textes
                                            Text(
                                              activity.coach.title.toString(),
                                              style: TextStyle(
                                                color: Color(0xFF6E6B8F),
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ])),
            ),
          ],
        ),
      ),
      // body: ListView(
      // scrollDirection: Axis.vertical,
      //
      //

      //    ),
      //   );
      //
      // ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 76,
                height: 21,
                child: Text(
                  'Prix',
                  style: TextStyle(
                    color: Color(0xFF838589),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.13,
                  ),
                ),
              ),
              SizedBox(
                width: 76,
                height: 21,
                child: Text(
                  '120 dt',
                  style: TextStyle(
                    color: Color(0xFFF34E3A),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0.06,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFf34e3a),
              minimumSize: Size(145, 49),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => payment_methods(),
                ),
              );
            },
            child: Text(
              'Réserver',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

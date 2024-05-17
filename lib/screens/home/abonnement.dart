import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/booking_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/planning_controller.dart';
import 'package:gymproconnect_flutter/screens/home/menu_screen.dart';

import 'package:gymproconnect_flutter/screens/home/planning.dart';
import 'package:gymproconnect_flutter/screens/home/reviews.dart';

import '../payment/payment_methods.dart';
import 'Profil.dart';
import 'main_home.dart';


class ImageInfo {
  final String path;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;

  ImageInfo({
    required this.path,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
  });
}
List<ImageInfo> images = [
  ImageInfo(
    path: 'assets/no_image.png',
    title: 'Image 1',
    subtitle1: 'Information 1-1',
    subtitle2: 'Information 1-2',
    subtitle3: 'Information 1-3',
  ),
  ImageInfo(
    path: 'assets/no_image.png',
    title: 'Image 2',
    subtitle1: 'Information 2-1',
    subtitle2: 'Information 2-2',
    subtitle3: 'Information 2-3',
  ),
  ImageInfo(
    path: 'assets/no_image.png',
    title: 'Image 3',
    subtitle1: 'Information 3-1',
    subtitle2: 'Information 3-2',
    subtitle3: 'Information 3-3',
  ),
];

class abonnement extends GetView<PlanningController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        appBar: AppBar(
            backgroundColor: Colors.white,
          title: Center(child: const Text("My membership")),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(

                shape: BoxShape.circle,

                color: Color(0xFFF7F9FD),
              ),
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Action lorsque le bouton de recherche est pressé
                },
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xFFF34E3A),
            labelColor: Color(0xFFF8A69C),
            tabs: [
              Tab(
                text: "Active",
              ),
              Tab(
                text: "Completed",
              ),
              Tab(
                text: "Cancelled",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.activeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final booking =controller.activeList.value[index];
                        return Card(
                          margin: EdgeInsets.all(20.0),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child: Image.network(booking.activity!.image.toString()), // Chemin de l'image
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            booking.activity!.name.toString(), // Titre de l'image
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(booking.description.toString()), // Sous-titre 1
                                          Text("${booking.pack!.price.toString()} dt"), // Sous-titre 2
                                          Text("${booking.pack!.nbrOfSession.toString()} séances"), // Sous-titre 3
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Action lorsque le bouton est pressé
                                    },

                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFE5E7EB),
                                        minimumSize: Size(350, 50),
                                      ),
                                    child: Text('Cancel', style: TextStyle(fontSize: 18.0, color:Color(0xFF1C2A3A))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.CompletedList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final booking =controller.CompletedList.value[index];
                        return Card(
                        color: Colors.white,
                          margin: EdgeInsets.all(20.0),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(booking.activity!.image.toString()), // Chemin de l'image
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          booking.activity!.name.toString(), // Titre de l'image
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      //  SizedBox(height: 5.0),
                                        Text(booking.description.toString()), // Sous-titre 1
                                        Text("${booking.pack!.price.toString()} dt"), // Sous-titre 2
                                        Text("${booking.pack!.nbrOfSession.toString()} séances"), // Sous-titre 3
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Action lorsque le bouton est pressé
                                  },

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFE5E7EB),
                                    minimumSize: Size(350, 50),
                                  ),
                                  child: Text('Re-Book', style: TextStyle(fontSize: 18.0, color:Color(0xFF1C2A3A))),
                                ),
                              ),
                            ],
                          ),
                        ),
                                                  );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.CancelledList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final booking =controller.CancelledList.value[index];
                        return Card(
                          margin: EdgeInsets.all(20.0),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child: Image.network(booking.activity!.image.toString()), // Chemin de l'image
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            booking.activity!.name.toString(), // Titre de l'image
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          Text(booking.description.toString()), // Sous-titre 1
                                          Text("${booking.pack!.price.toString()} dt"), // Sous-titre 2
                                          Text("${booking.pack!.nbrOfSession.toString()} séances"), // Sous-titre 3
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Action lorsque le bouton est pressé
                                    },

                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFE5E7EB),
                                      minimumSize: Size(350, 50),
                                    ),
                                    child: Text('Re-Book', style: TextStyle(fontSize: 18.0, color:Color(0xFF1C2A3A))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: BottomAppBar(
              color: Color(0xFFFFFFFF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: IconButton(
                            icon: Icon(Icons.home, color: Color(0xFFA5A5A7)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainHome()),
                              );
                            },
                          ),
                        ),
                        Text(
                          'Home',
                          style:
                              TextStyle(color: Color(0xFFA2A2A2), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: IconButton(
                            icon: Icon(Icons.calendar_today_rounded,
                                color: Color(0xFFA5A5A7)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Planning()),
                              );
                            },
                          ),
                        ),
                        Text(
                          'Planning',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFFA5A5A7)),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: IconButton(
                            icon: Icon(Icons.access_time,
                                color:  Color(0xFFf34e3a)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => abonnement()),
                              );
                            },
                          ),
                        ),
                        Text(
                          'Abonnement',
                          style:
                              TextStyle(fontSize: 12, color:  Color(0xFFf34e3a)),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: IconButton(
                            icon: Icon(
                              Icons.person,
                              color: Color(0xFFA5A5A7),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profil()),
                              );
                            },
                          ),
                        ),
                        Text(
                          'Profil',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFFA5A5A7)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
                height: kToolbarHeight /
                    6, // Utilise kToolbarHeight pour la hauteur de la barre d'applications
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [
                      Color(0xFFDCDCDC),
                      Color(0xFFDCDCDC).withOpacity(0)
                    ],
                  ),
                )),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFf34e3a),
          onPressed: () {},
          child: Image.asset(
            "assets/scanner.jfif",
            width: 30,
            height: 30,
          ),
          shape: CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}


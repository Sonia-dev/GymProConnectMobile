import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gymproconnect_flutter/home/Abonnement.dart';
import 'package:gymproconnect_flutter/home/Profil.dart';
import 'package:gymproconnect_flutter/home/activities.dart';
import 'package:gymproconnect_flutter/home/planning.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';


class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  String searchText = '';

  List<Map<String, String>> categories = [
    {'name': ' yoga', 'image': 'assert/yoga.png'},
    {'name': ' Swimming', 'image': 'assert/swimming.png'},
    {'name': ' gymnastique', 'image': 'assert/gymnastique.png'},
    // {'name': '4', 'image': 'assert/bodyCombat.jpg'},
    //{'name': ' 5', 'image': 'assert/bodyCombat.jpg'},
    // {'name': ' 6', 'image': 'assert/bodyCombat.jpg'},
    //{'name': ' 7', 'image': 'assert/bodyCombat.jpg'},
  ];

  List<Map<String, String>> activities = [
    {'name': 'bodypump', 'image': 'assert/swimming.png', 'description': 'Training for beginner'},
     {'name': '2', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
     {'name': '3', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
    {'name': '4', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
    {'name': '5', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
    {'name': '6', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
    {'name': '7', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
  ];
  List<Map<String, String>> trainers = [
    {'name': ' Ahmed', 'image': 'assert/ahmed.png'},
    {'name': ' Ali', 'image': 'assert/bodyCombat.jpg'},
    {'name': ' Anis', 'image': 'assert/bodyCombat.jpg'},
    {'name': ' Anis', 'image': 'assert/bodyCombat.jpg'},
    {'name': ' Anis', 'image': 'assert/bodyCombat.jpg'},
    {'name': ' Anis', 'image': 'assert/bodyCombat.jpg'},
    // {'name': ' 5', 'image': 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'},
    // {'name': ' 6', 'image': 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'},
    //{'name': ' 7', 'image': 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'},
  ];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<String> weekdays = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];
    List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June', 'July',
      'August', 'September', 'October', 'November', 'December'
    ];
    String dayOfWeek = weekdays[now.weekday - 1];
    String dayOfMonth = now.day.toString();
    String month = months[now.month - 1];
    String year = now.year.toString();

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 45, bottom: 15),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "welcome Ahmed !",
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$dayOfWeek, $dayOfMonth $month $year',
              style: TextStyle(
                fontSize: 11,
                color: Color(0xFFf34e3a),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                }
                );
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categorie',
                  style: TextStyle(fontSize:18.0,fontWeight:FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Action lorsque le bouton "See All" est pressé
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFFf34e3a)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 60.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (var category in categories)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: 60.0,
                              height: 60,
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,

                                border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0),
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(category['image']!),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            category['name'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Activities",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'choose your program',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF545454),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                TextButton(

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ActivityList()),
                    );

                  },
                  child: Text(
                    'See All',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFFf34e3a)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Flexible(
              child: Container(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var activity in activities)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          width: 300.0,
                          height: 300.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            shape: BoxShape.rectangle,
                            color: Colors.black12,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(activity['image']!,
                                    width: 300,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )


                              ),

                              ClipRRect(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)), // Adjust the radius as needed
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/2,
                                    padding: EdgeInsets.all(8.0), // Adjust padding as needed
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          activity['description']!,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                      Icons.star
                                        ),
                                      ],
                                    ),
                                  ),
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trainers",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'choose your Trainer',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF545454),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Action lorsque le bouton "See All" est pressé
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFFf34e3a)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 60.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (var trainer in trainers)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: 54.0,
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.grey, // Couleur du cercle gris
                                    width: 1.0),
                              ),
                              child: CircleAvatar(
                                backgroundImage:
                                AssetImage(trainer['image']!),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            trainer['name'].toString(),
                            textAlign: TextAlign.center,
                            style:  GoogleFonts.poppins(color: Colors.black,fontSize: 12),

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
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    icon: Icon(Icons.home, color: Color(0xFFf34e3a)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainHome()),
                      );
                    },
                  ),
                ),
                Text('Home', style: TextStyle(color: Color(0xFFf34e3a),fontSize: 12), ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: IconButton(
                    icon: Icon(Icons.calendar_today_rounded),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Planning()),
                      );
                    },
                  ),
                ),
                Text('Planning', style: TextStyle(fontSize: 12),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

              ),
              child: CircleAvatar(
                backgroundColor: Color(0xFFf34e3a),
                child: Icon(
                  Icons.qr_code_scanner_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => abonnement()),
                      );
                    },
                  ),
                ),

                Text('Abonnement',style: TextStyle(fontSize: 12),),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => profil()),
                      );
                    },
                  ),
                ),
                Text('Profil',style: TextStyle(fontSize: 12),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


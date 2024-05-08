import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Seances.dart';

class HomeCoach extends StatefulWidget {
  const HomeCoach({super.key});

  @override
  State<HomeCoach> createState() => _HomeCoachState();
}

class _HomeCoachState extends State<HomeCoach> {
  String searchText = '';
  List<Map<String, String>> seances = [
    {
      'name': 'bodypump',
      'image': 'assets/swimming.png',
      'description': 'Training for beginner'
    },
    {
      'name': '2',
      'image': 'assets/bodyCombat.jpg',
      'description': 'Training for beginner'
    },
    {
      'name': '3',
      'image': 'assets/bodyCombat.jpg',
      'description': 'Training for beginner'
    },
    {
      'name': '4',
      'image': 'assets/bodyCombat.jpg',
      'description': 'Training for beginner'
    },
    {
      'name': '5',
      'image': 'assets/bodyCombat.jpg',
      'description': 'Training for beginner'
    },
    {
      'name': '6',
      'image': 'assets/bodyCombat.jpg',
      'description': 'Training for beginner'
    },
    {
      'name': '7',
      'image': 'assets/bodyCombat.jpg',
      'description': 'Training for beginner'
    },
  ];
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    String dayOfWeek = weekdays[now.weekday - 1];
    String dayOfMonth = now.day.toString();
    String month = months[now.month - 1];
    String year = now.year.toString();

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 45, bottom: 15),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                });
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                floatingLabelStyle: const TextStyle(color: Colors.black),
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Color(0xffF7F9FD),
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 1, color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 1, color: Colors.white)),
              )),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mes Séances',
                style: TextStyle(fontSize:18.0,fontWeight:FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MesSeances()),
                  );                  },
                child: Text(
                  'See All',
                  style: TextStyle(fontSize: 18.0, color: Color(0xFFf34e3a)),
                ),
              ),

            ],
          ),
          Flexible(
            child: Container(
             // height: 200.0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  for (var activity in seances)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          shape: BoxShape.rectangle,
                          color: Colors.black12,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => seances()),
                                // );
                              },
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(activity['image']!,

                                    fit: BoxFit.cover,

                                  )


                              ),
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
        ]),
      ),
    );
  }
}

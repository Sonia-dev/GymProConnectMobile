import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainersAgent extends StatefulWidget {
  const TrainersAgent({super.key});

  @override
  State<TrainersAgent> createState() => _TrainersState();
}

class _TrainersState extends State<TrainersAgent> {
  @override
  String searchText = '';
  List<Map<String, String>> trainers = [
    {
      'name': ' Ahmed Ali',
      'image': 'assets/ahmed.png',
      'titre': 'coach de fitness '
    },
    {
      'name': ' Ali Nour',
      'image': 'assets/bodyCombat.jpg',
      'titre': 'coach de yoga '
    },
    {
      'name': ' Anis Mohamed',
      'image': 'assets/bodyCombat.jpg',
      'titre': 'coach de yoga'
    },
    {
      'name': ' Ahmed Ali',
      'image': 'assets/ahmed.png',
      'titre': 'coach de fitness '
    },
    {
      'name': ' Ahmed Ali',
      'image': 'assets/ahmed.png',
      'titre': 'coach de fitness '
    },
    {
      'name': ' Ahmed Ali',
      'image': 'assets/ahmed.png',
      'titre': 'coach de fitness '
    },
    {
      'name': ' Ahmed Ali',
      'image': 'assets/ahmed.png',
      'titre': 'coach de fitness '
    },{
      'name': ' Ahmed Ali',
      'image': 'assets/ahmed.png',
      'titre': 'coach de fitness '
    },{
      'name': ' Ahmed Ali',
      'image': 'assets/ahmed.png',
      'titre': 'coach de fitness '
    },{
      'name': ' Ahmed Ali',
      'image': 'assets/ahmed.png',
      'titre': 'coach de fitness '
    },{
      'name': ' Ahmed Ali',
      'image': 'assets/ahmed.png',
      'titre': 'coach de fitness '
    },




  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainers',
          style: GoogleFonts.poppins(
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
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Ajoutez ici la logique pour la recherche
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              SizedBox(height: 10.0),
              Expanded(
                child:
                Container(
                  // height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      for (var trainer in trainers)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child:Column(
                            children: [ Row(
                                children: [
                                  CircleAvatar(
                                    radius: 32,
                                    backgroundImage: AssetImage(
                                        trainer['image']!),
                                  ),
                                  SizedBox(width: 20),

                                  Column(
                                      children: [

                                        Text(
                                          trainer['name']!,
                                          style: TextStyle(
                                            color: Color(0xFF170F49),
                                            fontSize: 18,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),

                                        SizedBox(height: 5),

                                        Text(
                                          trainer['titre']!,
                                          style: TextStyle(
                                            color: Color(0xFF6E6B8F),
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ]
                                  ),
                                ]
                            ),SizedBox(height: 10,)],
                          ),


                        ),
                    ],
                  ),
                ),

              ),]),),

    );
  }
}

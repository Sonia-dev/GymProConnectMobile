import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Trainers extends StatefulWidget {
  const Trainers({super.key});

  @override
  State<Trainers> createState() => _TrainersState();
}

class _TrainersState extends State<Trainers> {
  @override
  String searchText = '';
  List<Map<String, String>> trainers = [
    {'name': ' Ahmed', 'image': 'assets/ahmed.png'},
    {'name': ' Ali', 'image': 'assets/bodyCombat.jpg'},
    {'name': ' Anis', 'image': 'assets/bodyCombat.jpg'},
    {'name': ' Anis', 'image': 'assets/bodyCombat.jpg'},
    {'name': ' Anis', 'image': 'assets/bodyCombat.jpg'},
    {'name': ' Anis', 'image': 'assets/bodyCombat.jpg'},
    // {'name': ' 5', 'image': 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'},
    // {'name': ' 6', 'image': 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'},
    //{'name': ' 7', 'image': 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'},
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Expanded(
                    /* child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),*/
                    child:TextFormField(
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
                  ),


                ],
              ),
              SizedBox(height: 10.0),
              Expanded(
                child:
                Column(children: [
                  Row(children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 100,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,

                        ),
                        child: CircleAvatar(
                          backgroundImage:
                          AssetImage(trainers.first['image']!),
                        ),
                      ),
                    ),
                    Column(children:[
                      Text(trainers.first['name']!)
                    ])

                  ],),
                ],)

              ),]),),

    );
  }
}

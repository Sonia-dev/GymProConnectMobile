import 'package:flutter/material.dart';
import 'package:gymproconnect_flutter/home/abonnement.dart';
import 'package:gymproconnect_flutter/home/Profil.dart';
import 'package:gymproconnect_flutter/home/filtre.dart';
import 'package:gymproconnect_flutter/home/main_home.dart';
import 'package:gymproconnect_flutter/home/planning.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';


class Categories extends StatefulWidget {
  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<Categories> {
  final _formKey = GlobalKey<FormState>();
  String searchText = '';
  List<Map<String, String>> activities = [
    {
      'name': 'bodypump',
      'image': 'assets/yoga.png',
      'description': 'Training for beginner',
    },
    {'name': '2', 'image': 'assets/bodyCombat.jpg', 'description': 'Training for beginner'},
    {'name': '3', 'image': 'assets/bodypump.jpg', 'description': 'Training for beginner'},
    {'name': '4', 'image': 'assets/gymnastique.png', 'description': 'Training for beginner'},
    {'name': '5', 'image': 'assets/rpm.jpg', 'description': 'Training for beginner'},
    {'name': '6', 'image': 'assets/swimming.png', 'description': 'Training for beginner'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories',
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

                  IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/filtre.png'),
                      size: 24,

                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => filtre()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: activities.length,
                  itemBuilder: (BuildContext context, int index) {
                    final activity = activities[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: 150,
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                activity['image']!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 150,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,

                              child: Text(
                                activity['description']!,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),

                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          activity['description']!,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(Icons.star, color: Colors.white),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),]),),
    //  bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
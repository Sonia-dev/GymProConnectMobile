import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymproconnect_flutter/payment/payment_methods.dart';
import 'package:gymproconnect_flutter/home/reviews.dart';


class Activity extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final List<Map<String, String>> activitie = [
      {'category': 'Yoga',
        'name': 'Yoga Body Stretching',
        'image': 'assets/yoga.png',
        'description': 'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger ',
        'prix':'120 dt'
      },
    ];
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
    ];
    //String image = premierElement['image'];
    return
      Scaffold(
        body: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                Stack(
                  children: [
                    Container(
                      width: 393,
                      height: 270,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(activitie.first['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: -160,
                      bottom: -140,
                      child: SizedBox(
                        width: 393,
                        height: 200,
                        child: Text(
                          activitie.first['category']!,
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
                        width: 393,
                        height: 200,
                        child: Text(
                          activitie.first['name']!,
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
                    ),
                  ],
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
                        ),),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => reviews()),
                          );
                        },
                        child: Text(
                          'Reviews',
                          style: TextStyle(
                            color: Color(0xFF555555),
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,),
                        ),
                      ),
                    ],
                  ),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      color: Color(0xFF0C1A30),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),),),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    activitie.first['description']!,
                    style: TextStyle(
                      color: Color(0xFF0C1A30),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),),),
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
                        ),),
                      Spacer(flex: 10),
                      Text(
                        'Durée',
                        style: TextStyle(
                          color: Color(0xFFABABAB),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,),

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
                        ),),
                      Text(
                        '45 min',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,),

                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Capacité',
                    style: TextStyle(
                      color: Color(0xFFABABAB),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '30',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),),),
                SizedBox(height: 10,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Trainers',
                    style: TextStyle(
                      color: Color(0xFF0C1A30),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,

                    ),),),
                SizedBox(height: 10,),


                Container(
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      for (var trainer in trainers)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundImage: AssetImage(
                                      trainer['image']!),
                                ),
                                SizedBox(width: 10),
                                // Ajoute un espace entre l'image et le texte
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
                                      // Ajoute un espace vertical entre les deux textes
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
                          ),


                        ),
                    ],
                  ),
                ),


              ]),
        ),
        ),
        bottomNavigationBar: CustomBottomAppBar(),
      ); //trainers
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
        SizedBox(height: 10,),
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

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> payment_methods(),
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


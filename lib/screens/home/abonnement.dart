import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/screens/home/menu_screen.dart';

import 'package:gymproconnect_flutter/screens/home/planning.dart';
import 'package:gymproconnect_flutter/screens/home/reviews.dart';

import '../payment/payment_methods.dart';
import 'Profil.dart';
import 'main_home.dart';

class abonnement extends StatefulWidget {
  const abonnement({super.key});

  @override
  State<abonnement> createState() => _abonnementState();
}

class _abonnementState extends State<abonnement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My membership',style: GoogleFonts.poppins(
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
              // Action de recherche
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => reviews()),
                      );
                    },
                    child: Text(
                      'Active',
                      style: TextStyle(
                        color: Color(0xFFF8A69C),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
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
                      'Completed',
                      style: TextStyle(
                        color: Color(0xFF555555),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
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
                      'Cancelled',
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
            // Expanded(
            //   child:
            //   Container(
            //     height: 200.0,
            //     child: ListView.builder(
            //         itemCount: controller.trainers.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           final coach = controller.trainers[index];
            //           return
            //             //Padding(
            //             // scrollDirection: Axis.vertical,
            //             // children: [
            //
            //             Padding(
            //               padding: EdgeInsets.symmetric(vertical: 10),
            //               child: Column(
            //                 children: [
            //                   Row(
            //                     children: [
            //                       Container(
            //                         width: 64, // Largeur du conteneur
            //                         height: 64, // Hauteur du conteneur
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(8), // Bord arrondi du conteneur
            //                           image: DecorationImage(
            //                             image: NetworkImage(
            //                               coach.image,
            //                             ),
            //                             fit: BoxFit.cover,
            //                           ),
            //                         ),
            //                       ),
            //
            //
            //                     SizedBox(width: 20),
            //                     Column(children: [
            //                       Text(
            //                         coach.name.toString(),
            //                         style: TextStyle(
            //                           color: Color(0xFF170F49),
            //                           fontSize: 18,
            //                           fontFamily: 'Poppins',
            //                           fontWeight: FontWeight.w700,
            //                         ),
            //                       ),
            //                       SizedBox(height: 5),
            //                       Text(
            //                         coach.title.toString(),
            //                         style: TextStyle(
            //                           color: Color(0xFF6E6B8F),
            //                           fontSize: 15,
            //                           fontFamily: 'Poppins',
            //                           fontWeight: FontWeight.w400,
            //                         ),
            //                       ),
            //                     ]),
            //                   ]),
            //                   SizedBox(
            //                     height: 10,
            //                   )
            //                 ],
            //               ),
            //             );
            //         }),
            //   ),
            // ),
      ],
        ),),


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
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuScreen()),
                      );
                    },
                  ),
                ),
                Text('Home',style: TextStyle(fontSize: 12)  ),
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
                    icon: Icon(Icons.access_time, color: Color(0xFFf34e3a)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => abonnement()),
                      );
                    },
                  ),
                ),

                Text('Abonnement',style: TextStyle(color: Color(0xFFf34e3a),fontSize: 12),),
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


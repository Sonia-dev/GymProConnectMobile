import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/profil_controller.dart';
import 'package:gymproconnect_flutter/screens/home/menu_screen.dart';
import 'package:gymproconnect_flutter/screens/home/planning.dart';

import '../../constants/constants.dart';
import '../../data/controllers/auth_controller.dart';
import '../../globals.dart';
import '../../routes/routes_helper.dart';
import '../profil/Help.dart';
import '../profil/MyAccount.dart';
import '../profil/MyMembership.dart';
import '../profil/Settings.dart';
import '../profil/edit.dart';
import 'abonnement.dart';
import 'main_home.dart';


class Profil extends StatelessWidget {
  const Profil({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Container(
                width: 101.0,
                height: 101.0,
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child:Stack(
        children: [
          CircleAvatar(
            radius: 50,
            /* backgroundImage: NetworkImage(
              "profil.image.toString()",
             ),*/
            backgroundColor: Colors.red,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => update()),
                );
              },
              child: Image.asset(
                'assets/edit.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      )
              ),
              SizedBox(height: 10),
              Text(
                "$surName  $userName ",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              ListTile(
                leading:
                    Image.asset('assets/MyAccount.png', width: 38, height: 38),
                title: Text(
                  'My Account',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded,
                    color: Color(0xFFABABAB), size: 15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                },
              ),
              ListTile(
                leading: Image.asset('assets/MyMembership.png',
                    width: 35, height: 35),
                title: Text(
                  'My Membership',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded,
                    color: Color(0xFFABABAB), size: 15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyMembership()),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading:
                    Image.asset('assets/Setting.png', width: 35, height: 35),
                title: Text(
                  'Settings',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded,
                    color: Color(0xFFABABAB), size: 15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => settings()),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading:
                    Image.asset('assets/helpcenter.png', width: 35, height: 35),
                title: Text(
                  'Help Center',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded,
                    color: Color(0xFFABABAB), size: 15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpCenter()),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading:
                    Image.asset('assets/logout.png', width: 35, height: 35),
                title: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded,
                    color: Color(0xFFABABAB), size: 15),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Logout'),
                        content: Text('Are you sure you want to log out?'),
                        actions: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Yes, Logout'),
                            onPressed: () {
                              // Implement logout logic here.
                              Get.find<AuthController>().clearData();

                              Get.offNamed(RouteHelper.getSignUpPage());

                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
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
                              color:   Color(0xFFA5A5A7)),
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
                          icon: Icon(
                            Icons.person,
                            color: Color(0xFFf34e3a),
                          ),
                          onPressed: () {
                            Get.toNamed(RouteHelper.getProfil());
                          },
                        ),
                      ),
                      Text(
                        'Profil',
                        style:
                        TextStyle(fontSize: 12, color: Color(0xFFf34e3a)),
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
    );
  }
}

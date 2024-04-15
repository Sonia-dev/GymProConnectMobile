import 'package:flutter/material.dart';
import 'package:gymproconnect_flutter/home/Abonnement.dart';
import 'package:gymproconnect_flutter/home/main_home.dart';
import 'package:gymproconnect_flutter/home/planning.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/profil/Help.dart';
import 'package:gymproconnect_flutter/profil/MyAccount.dart';
import 'package:gymproconnect_flutter/profil/MyMembership.dart';
import 'package:gymproconnect_flutter/profil/Settings.dart';
import 'package:gymproconnect_flutter/profil/edit.dart';


class profil extends StatefulWidget {
  const profil({super.key});

  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  Map<String, dynamic> Profil = {'name': 'Ahmed', 'image': 'assert/yoga.png'};

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
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        Profil['image']!,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => edit()),
                          );
                        },
                        child: Image.asset(
                          'assert/edit.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                Profil['name']!,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              ListTile(
                leading: Image.asset(
                    'assert/MyAccount.png', width: 38, height: 38),
                title: Text(
                  'My Account',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                    Icons.arrow_forward_ios_rounded, color: Color(0xFFABABAB),
                    size: 15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                },
              ),
              ListTile(
                leading: Image.asset(
                    'assert/MyMembership.png', width: 35, height: 35),
                title: Text(
                  'My Membership',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                    Icons.arrow_forward_ios_rounded, color: Color(0xFFABABAB),
                    size: 15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyMembership()),
                  );
                },
              ),
              SizedBox(height: 10,),
              ListTile(
                leading: Image.asset(
                    'assert/Setting.png', width: 35, height: 35),
                title: Text(
                  'Settings',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                    Icons.arrow_forward_ios_rounded, color: Color(0xFFABABAB),
                    size: 15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => settings()),
                  );
                },
              ),
              SizedBox(height: 10,),
              ListTile(
                leading: Image.asset(
                    'assert/helpcenter.png', width: 35, height: 35),
                title: Text(
                  'Help Center',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                    Icons.arrow_forward_ios_rounded, color: Color(0xFFABABAB),
                    size: 15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpCenter()),
                  );
                },
              ),
              SizedBox(height: 10,),
              ListTile(
                leading: Image.asset(
                    'assert/logout.png', width: 35, height: 35),
                title: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                    Icons.arrow_forward_ios_rounded, color: Color(0xFFABABAB),
                    size: 15),
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
                              Navigator.of(context).pop();
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
                      MaterialPageRoute(builder: (context) => MainHome()),
                    );
                    },
                ),
              ),
              Text('Home',style:TextStyle(fontSize: 12) ),
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
                  icon: Icon(Icons.person, color: Color(0xFFf34e3a)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profil()),
                    );
                    },
                ),
              ),
              Text('Profil',style: TextStyle(fontSize: 12, color: Color(0xFFf34e3a)),),
            ],
          ),
        ),
      ],
    ),
  );
  }
}


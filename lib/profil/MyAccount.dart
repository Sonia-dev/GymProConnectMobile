import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Map<String, dynamic> Profil = {'name': 'Ahmed', 'image': 'assets/yoga.png'};
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  width: 101.0,
                  height: 101.0,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    Profil['image']!,
                  ),
                  backgroundColor: Colors.transparent,
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
              ]
          ),
        ),
        ),
    );
  }
}

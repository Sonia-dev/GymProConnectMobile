import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',style: GoogleFonts.poppins(
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
      body: Center(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  leading: Image.asset(
                      'assets/notification.png', width: 16, height: 20),
                  title: Text(
                    'Notification settings',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF555555),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(
                      Icons.arrow_forward_ios_rounded, color: Color(0xFFABABAB),
                      size: 15),
                  onTap: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyAccount()),
                    );*/
                  },
                ),
                ListTile(
                  leading: Image.asset(
                      'assets/deleteAccount.png', width: 16, height: 20),
                  title: Text(
                    'Delete Account',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF555555),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(
                      Icons.arrow_forward_ios_rounded, color: Color(0xFFABABAB),
                      size: 15),
                  onTap: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyAccount()),
                    );*/
                  },
                ),
              ]
          ),
        ),
      ),
    );
  }
}

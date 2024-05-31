import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/profil_controller.dart';
import '../../data/controllers/auth_controller.dart';
import '../../routes/routes_helper.dart';
import '../profil/Help.dart';
import '../profil/MyAccount.dart';
import '../profil/MyMembership.dart';
import '../profil/Settings.dart';
import '../profil/edit.dart';


class Profil extends GetView<ProfilController> {
   Profil({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfilController>(builder: (controller) {
      return Obx(() => controller.isLoading.value
          ? const Center(
          child: SpinKitDoubleBounce(
            color: Colors.orange,
          ))
          : Center(
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
             backgroundImage: NetworkImage(
             controller.user.user?.image.toString()??"",
             ),
           // backgroundColor: Colors.red,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.user.user?.name.toString()??"",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    controller.user.user?.surname.toString()??"",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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

                              final box = GetStorage();
                              box.erase();
                              print('box ${box}');
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

      );}
    ));
  }
}

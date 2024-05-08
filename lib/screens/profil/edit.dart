import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/repository/update_user_repo.dart';
import '../../data/api/api_client.dart';
import '../../data/controllers/update_user_controller.dart';
import '../../globals.dart';




class update extends GetView<UpDateController> {
  @override
  Map<String, dynamic> Profil = {'name': 'Ahmed','email': 'Itunuoluwa Abidoye@yahoo.fr','number':'99654753','dateofbirth':"21/02/2000" ,'image': 'assets/yoga.png','gender':"female"};

  Widget build(BuildContext context) {
    Get.put(ApiClient(appBaseUrl: "http://192.168.1.107:8000/api/"));
    //Get.put(UpdateRepo( apiClient: Get.find(),));
   // Get.put(UpDateController(updateRepo: Get.find()));

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile',style: GoogleFonts.poppins(
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
        child:
 //   itemCount: updatecontroller.activities.length,
 //    itemBuilder: (BuildContext context, int index) {
 //    final activity = updatecontroller.activities[index];
 //    return
    Padding(

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
              color: Color(0xFFF34E3A),
            ),
              child: Container(
                width: 97.0,
                height: 97.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
            child:CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  Profil['image']!,
                ),
                backgroundColor: Colors.transparent,
              ),

              ),
          ),
                Text('change Picture', style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                ),
                SizedBox(height: 20,),
                TextField(
                  onChanged: (value) {

                      userName  = value;

                  },
                  controller: TextEditingController(
                    text: "$userName ",
                  ),
                  style: GoogleFonts.poppins(
                    color: Color(0xFF555555),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,                  ),
                    decoration: InputDecoration(

                      suffix: Image.asset('assets/profil.png',
                        width: 25,
                        height: 20,),),
                ),
                SizedBox(height: 10,),
                TextField(
                  onChanged: (value) {

                      surName   = value;

                  },
                  controller: TextEditingController(
                    text: surName  ,
                  ),
                  style: GoogleFonts.poppins(
                    color: Color(0xFF555555),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,                  ),
                  decoration: InputDecoration(

                    suffix: Image.asset('assets/profil.png',
                      width: 25,
                      height: 20,),),
                ),
                SizedBox(height: 10,),
                TextField(
                  onChanged: (value) {

                      Profil['email']  = value;

                  },
                  controller: TextEditingController(
                    text: Profil['email'],
                  ),
                  style: GoogleFonts.poppins(
                    color: Color(0xFF555555),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,                  ),
                  decoration: InputDecoration(

                    suffix: Image.asset('assets/gmail.png',
                      width: 25,
                      height: 20,),),
                ),
                SizedBox(height: 10,),
                TextField(
                  onChanged: (value) {

                      Profil['number']  = value;

                  },
                  controller: TextEditingController(
                    text: Profil['number'],
                  ),
                  style: GoogleFonts.poppins(
                    color: Color(0xFF555555),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,                  ),
                  decoration: InputDecoration(

                    prefix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      Image.asset(
                      'assets/tunisie.png',
                      width: 24,
                      height: 16,
                    ),
                    VerticalDivider(
                        color: Colors.grey,
                    ),
                    ]),
                       suffix: Image.asset('assets/téléphone.png',
                      width: 25,
                      height: 25,),
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  onChanged: (value) {

                      Profil['dateofbirth']  = value;

                  },
                  controller: TextEditingController(
                    text: Profil['dateofbirth'],
                  ),
                  style: GoogleFonts.poppins(
                    color: Color(0xFF555555),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,                  ),
                  decoration: InputDecoration(

                    suffix: Image.asset('assets/calendrie.png',
                      width: 25,
                      height: 20,),),
                ),
                SizedBox(height: 10,),
          Container(
            width: 400,
              child:DropdownButton<String>(
                onChanged: (String? newValue) {

                Profil['gender'] = newValue!;

            },

            items: <String>['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(

                value: value,
                child: Text(value),
              );
            }).toList(),
          ),),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFf34e3a),
                    minimumSize: Size(285, 49),
                  ),
                  onPressed: () {


                  },
                  child: Text(
                    'update profil',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
          ]

          ),
        ),
      ),
    );
  }
}

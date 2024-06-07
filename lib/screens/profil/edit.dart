import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/controllers/profil_controller.dart';
import '../../models/update_user_model.dart';

final _updateKey = GlobalKey<FormState>();

class update extends GetView<ProfilController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editer le profil',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child:

            Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                child: CircleAvatar(
                  radius: 50.w,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        50.w), // Match the CircleAvatar's radius
                    child: controller.user.user?.image?.isNotEmpty == true
                        ? Image.network(
                            controller.user.user!.image.toString(),
                            fit: BoxFit
                                .cover, // Use BoxFit.cover to fill the circle
                            width: double.infinity,
                            height: double
                                .infinity, // Set the height to infinity to fill the circle
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: SpinKitDoubleBounce(
                                  size: 10,
                                  color: Colors.orange,
                                ),
                              );
                            },
                          )
                        : Image.asset(
                            'assets/no_image.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                  ),
                ),
              ),
            ),
            Text(
              'change Picture',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                controller.user.user?.image = value;
              },
              controller: TextEditingController(
                text: controller.user.user?.name.toString() ?? "",
              ),
              style: GoogleFonts.poppins(
                color: Color(0xFF555555),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                suffix: Image.asset(
                  'assets/profil.png',
                  width: 25,
                  height: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                controller.user.user?.surname = value;
              },
              controller: TextEditingController(
                text: controller.user.user?.surname.toString() ?? "",
              ),
              style: GoogleFonts.poppins(
                color: Color(0xFF555555),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                suffix: Image.asset(
                  'assets/profil.png',
                  width: 25,
                  height: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                controller.user.user?.email = value;
              },
              controller: TextEditingController(
                text: controller.user.user?.email.toString() ?? "",
              ),
              style: GoogleFonts.poppins(
                color: Color(0xFF555555),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                suffix: Image.asset(
                  'assets/gmail.png',
                  width: 25,
                  height: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                controller.user.user?.phone = value;

              },
              controller: TextEditingController(
                text: controller.user.user?.phone.toString() ?? "",
              ),
              style: GoogleFonts.poppins(
                color: Color(0xFF555555),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                prefix: Row(mainAxisSize: MainAxisSize.min, children: [
                  Image.asset(
                    'assets/tunisie.png',
                    width: 24,
                    height: 16,
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                  ),
                ]),
                suffix: Image.asset(
                  'assets/téléphone.png',
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                controller.user.user?.birthDate = value;
              },
              controller: TextEditingController(
                text: controller.user.user?.birthDate.toString() ?? "",
              ),
              style: GoogleFonts.poppins(
                color: Color(0xFF555555),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                suffix: Image.asset(
                  'assets/calendrie.png',
                  width: 25,
                  height: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                controller.user.user?.adress = value;
              },
              controller: TextEditingController(
                text: controller.user.user?.adress.toString() ?? "",
              ),
              style: GoogleFonts.poppins(
                color: Color(0xFF555555),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.location_on,
                  color: Color(0xFFf34e3a),
                  // Changez la couleur ici
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFf34e3a),
                minimumSize: Size(285, 49),
              ),
              onPressed: () async {
                if (_updateKey.currentState!.validate()) {
                  _updateKey.currentState!.save();


                  UpdateModel updateData = UpdateModel(
                    name: controller.user.user?.name,
                    surname: controller.user.user?.surname,
                    email: controller.user.user?.email,
                    phone: controller.user.user?.phone,
                    birthDate: controller.user.user?.birthDate,
                    adress: controller.user.user?.adress,
                  );
                  await controller.UpdateProfil(updateData, context);
                }
              },
              child: Text(
                'Mettre à jour',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

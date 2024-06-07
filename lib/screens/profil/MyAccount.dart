import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/controllers/profil_controller.dart';

final _updateKey = GlobalKey<FormState>();

class MyAccount extends GetView<ProfilController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Mon compte',
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
        body: Padding(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.user?.user?.name.toString() ?? "",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                10.w.horizontalSpace,
                Text(
                  controller.user?.user?.surname.toString() ?? "",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: controller.user.user?.email.toString() ?? "",
                hintStyle: GoogleFonts.poppins(
                  color: Color(0xFF555555),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: Image.asset(
                  'assets/gmail.png',
                  width: 5,
                  height: 10,
                ),

              ),
            ),
            SizedBox(
              height: 10,
            ),
          TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: controller.user.user?.phone.toString() ?? "",
              hintStyle: GoogleFonts.poppins(
                color: Color(0xFF555555),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
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
                  ],
                ),
              ),
              suffixIcon: Image.asset(
                'assets/téléphone.png',
                width: 25,
                height: 25,
              ),

            ),
          ),

                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: controller.user.user?.birthDate?.toString() ?? "",
                    hintStyle: GoogleFonts.poppins(
                      color: Color(0xFF555555),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: Image.asset(
                      'assets/calendrie.png',
                      width: 25,
                      height: 20,
                    ),
                  ),
                ),
            SizedBox(
              height: 10,
            ),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: controller.user.user?.adress?.toString() ?? "",
                    hintStyle: GoogleFonts.poppins(
                      color: Color(0xFF555555),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: Icon(
                      Icons.location_on,
                      color: Color(0xFFf34e3a),
                      // Changez la couleur ici
                    ),
                  ),
                ),

          ]),
        ),
      ),
    );
  }
}

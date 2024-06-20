import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/adherent_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/attendance_controller.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/circle_avatar_widget.dart';

class Adherents extends GetView<AdherentsController> {
  final AttendanceController attendanceController =
      Get.find<AttendanceController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Les adhérents"),
              _buildPresenceIndicator()
            ],
          ),

          bottom:  TabBar(
            indicatorColor: Color(0xFFF34E3A),
            labelColor: Color(0xFFF8A69C),
            onTap: (index){

              print('print index ${index}');
              attendanceController.getMembers();

            },
            tabs: [
              Tab(
                text: "Tout",
              ),
              Tab(
                text: "Présent",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.adherentsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final adherent = controller.adherentsList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 90,
                              child: buildCircleAvatarPhone(
                                imagePath: adherent.image.toString(),
                                name: adherent.name.toString(),
                                title: adherent.surname.toString(),
                                phoneNumber: adherent.phone.toString(),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child:GetBuilder<AttendanceController>(
    builder: (controller) {
    return  Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                      itemCount: attendanceController
                          .memberslist
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        final member = attendanceController
                            .memberslist
                            .value[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    height: 100,
                                    child: buildCircleAvatarPhone(
                                      imagePath:
                                          member.user?.image != null ? member.user?.image.toString() ??
    ""
                                              : "assets/no_image.jpg",
                                      name:
                                          member.user?.name.toString() ??
                                              "",
                                      title: member.user?.surname
                                              .toString() ??
                                          "",
                                      phoneNumber: member.user?.phone
                                          .toString()??"",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ));}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget _buildPresenceIndicator( ) {

  final DateTime today = DateTime.now();
  String formattedDate = DateFormat('dd/MM/yyyy').format(today); // Format date as dd/mm/yyyy
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
    decoration: BoxDecoration(
      color:Colors.deepOrange, // Green for today, grey for others
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      'le $formattedDate', // Display formatted date for today, otherwise "Autre jour"
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 10,
      ),

    ),
  );}

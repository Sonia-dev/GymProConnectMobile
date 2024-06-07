import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/adherent_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/trainers_controller.dart';
import '../../data/controllers/attendance_controller.dart';
import '../../widgets/circle_avatar_widget.dart';

class TrainersAgent extends StatelessWidget {
  final TrainersController controller = Get.find<TrainersController>();
  final AttendanceController coachcontroller = Get.find<AttendanceController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: const Text("Les coaches")),
          bottom: const TabBar(
            indicatorColor: Color(0xFFF34E3A),
            labelColor: Color(0xFFF8A69C),
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
                    itemCount: controller.trainersAgentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final coach = controller.trainersAgentList[index];
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
                                  child: buildCircleAvatarhor(
                                  //  imagePath: controller.packsData.activity?.coach?.image!= null?controller.packsData.activity?.coach?.image.toString() ?? "":"assets/no_image.jpg",

                                    imagePath: coach.image != null? coach.image.toString()??"":"assets/no_image.jpg",
                                    name: coach.name.toString(),
                                    title: coach.surname.toString(),
                                  ),
                                ),
                              ),
                            ],
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
                child: Obx(
                      () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: coachcontroller.coachslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      final coach = coachcontroller.coachslist[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 100,
                              child: buildCircleAvatarhor(
                                imagePath: coach.user?.image !=null ? coach.user?.image.toString()??"":"assets/no_image.jpg",
                                name: coach.user?.name.toString()??"",
                                title: coach.user?.surname.toString()??"",
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
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/adherent_controller.dart';
import '../../widgets/circle_avatar_widget.dart';

class Adherents extends StatelessWidget {
  final AdherentsController controller = Get.find<AdherentsController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: const Text("Members")),
          bottom: const TabBar(
            indicatorColor: Color(0xFFF34E3A),
            labelColor: Color(0xFFF8A69C),
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Present",
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
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 100,
                                  child: buildCircleAvatarhor(
                                    imagePath: adherent.image.toString(),
                                    name: adherent.name.toString(),
                                    title: adherent.surname.toString(),
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
                    itemCount: controller.adherentsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final adherent = controller.adherentsList[index];
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
                                    imagePath: adherent.image.toString(),
                                    name: adherent.name.toString(),
                                    title: adherent.surname.toString(),
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
          ],
        ),
      ),
    );
  }
}

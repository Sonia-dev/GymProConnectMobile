import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/repository/trainers_repo.dart';
import 'package:gymproconnect_flutter/models/trainers_model.dart';
import 'package:gymproconnect_flutter/screens/home/planning.dart';

import '../../data/api/api_client.dart';
import '../../data/controllers/trainers_controller.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/circle_avatar_widget.dart';
import 'Profil.dart';
import 'abonnement.dart';
import 'main_home.dart';

class TrainersList extends GetView<TrainersController> {
  @override
  String searchText = '';

  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coaches',
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
      body:
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child:Obx(
                              () => ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.trainersList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final coach = controller.trainersList[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    RouteHelper.trainerById,
                                  );
                                  Get.find<TrainersController>()
                                      .getTrainerByID(coach.id!);
                                },
                                child: Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        height: 100,
                                        child: buildCircleAvatarhor(
                                          imagePath: coach.image != null? coach.image.toString()??"":"assets/no_image.jpg",
                                          name: coach.name.toString(),
                                          title: coach.surname.toString(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      
                      
                      
                          ),
                    ));
  }
}

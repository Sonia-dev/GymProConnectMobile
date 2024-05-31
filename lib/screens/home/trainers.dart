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
import 'Profil.dart';
import 'abonnement.dart';
import 'main_home.dart';

class TrainersList extends GetView<TrainersController> {
  @override
  String searchText = '';

  Widget build(BuildContext context) {


    Get.put(TrainersRepo(
      apiClient: Get.find(),
    ));
    Get.put(TrainersController(trainersRepo: Get.find()));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trainers',
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
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Ajoutez ici la logique pour la recherche
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(height: 10.0),
          Expanded(
             child:
             Container(
             height: 200.0,
            child: Obx(()=>ListView.builder(
                itemCount: controller.trainersList.length,
                itemBuilder: (BuildContext context, int index) {
                  final coach = controller.trainersList[index];
                  return
                    //Padding(
                    // scrollDirection: Axis.vertical,
                    // children: [

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Row(children: [
                            CircleAvatar(
                              radius: 32,
                              child: Image.network(
                                coach.image !,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return SizedBox(
                                      child: Image.asset(
                                          "assets/images/no_image.jpg"));
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress?.expectedTotalBytes ==
                                      loadingProgress?.cumulativeBytesLoaded) {
                                    return child;
                                  }
                                  return const CircularProgressIndicator();
                                },
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(children: [
                              Text(
                                coach.name.toString(),
                                style: TextStyle(
                                  color: Color(0xFF170F49),
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                coach.title.toString(),
                                style: TextStyle(
                                  color: Color(0xFF6E6B8F),
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]),
                          ]),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    );
                }),)
          ),
          ),
        ]),
      ),

    );
  }
}

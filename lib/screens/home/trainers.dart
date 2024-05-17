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
    Get.put(ApiClient(appBaseUrl: "http://192.168.1.191:8000/api/"));
    Get.put(TrainersRepo( apiClient: Get.find(),));
    Get.put(TrainersController(trainersRepo: Get.find()));


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
      bottomNavigationBar: Stack(
          children: [

            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: BottomAppBar(
                color: Color(0xFFFFFFFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: IconButton(
                              icon: Icon(Icons.home, color: Color(0xFFf34e3a)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MainHome()),
                                );
                              },
                            ),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(color: Color(0xFFf34e3a), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: IconButton(
                              icon: Icon(Icons.calendar_today_rounded,color: Color(0xFFA5A5A7)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Planning()),
                                );
                              },
                            ),
                          ),
                          Text(
                            'Planning',
                            style: TextStyle(fontSize: 12,color: Color(0xFFA2A2A2)),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: IconButton(
                              icon: Icon(Icons.access_time,color: Color(0xFFA5A5A7)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => abonnement()),
                                );
                              },
                            ),
                          ),
                          Text(
                            'Abonnement',
                            style: TextStyle(fontSize: 12,color: Color(0xFFA5A5A7)),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: IconButton(
                              icon: Icon(Icons.person,color: Color(0xFFA5A5A7),),
                              onPressed: () {
                                Get.toNamed(RouteHelper.getProfil());
                              },
                            ),
                          ),
                          Text(
                            'Profil',
                            style: TextStyle(fontSize: 12,color: Color(0xFFA5A5A7)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                  height: kToolbarHeight/6, // Utilise kToolbarHeight pour la hauteur de la barre d'applications
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),

                    ),
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [

                        Color(0xFFDCDCDC),
                        Color(0xFFDCDCDC).withOpacity(0)
                      ],
                    ),
                  )
              ),
            ),
          ]
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFf34e3a),
        onPressed: () {},
        child: Image.asset("assets/scanner.jfif",width: 30,height: 30,),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/controllers/packs_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/trainers_controller.dart';
import 'package:gymproconnect_flutter/data/repository/trainers_repo.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/screens/home/detailed_pack.dart';
import 'package:gymproconnect_flutter/screens/home/planning.dart';

import '../../constants/constants.dart';
import '../../data/api/api_client.dart';
import '../../data/controllers/activities_controller.dart';
import '../../data/controllers/auth_controller.dart';
import '../../data/controllers/categories_controller.dart';
import '../../data/repository/activities_repo.dart';
import '../../data/repository/auth_repo.dart';
import '../../data/repository/categories_repo.dart';
import '../../data/repository/packs_repo.dart';
import '../../globals.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/circle_avatar_widget.dart';
import 'Profil.dart';
import 'abonnement.dart';
import 'detailed_activity.dart';

class MainHome extends StatelessWidget{
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    Get.put(AuthRepo(apiClient: Get.find()));
    Get.put(AuthController(authRepo: Get.find()));

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                20.h.verticalSpace,
                Text(
                  "welcome $userName !",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20.spMin,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.h.verticalSpace,
                Text('$dayOfWeek, $dayOfMonth $month $year',
                    style: GoogleFonts.poppins(
                      color: Color(0xFFf34e3a),
                      fontSize: 11.spMin,
                      fontWeight: FontWeight.w500,
                    )),
                10.h.verticalSpace,
                TextFormField(
                    onChanged: (value) {
                      searchText = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 12),
                      floatingLabelStyle: GoogleFonts.poppins(
                        color: Color(0xFFB7C4E0),
                        fontSize: 11.spMin,
                        fontWeight: FontWeight.w400,
                      ),
                      labelText: 'Search',
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xffB7C4E0),
                      ),
                      filled: true,
                      fillColor: Color(0xffF7F9FD),
                      labelStyle: GoogleFonts.poppins(
                        color: Color(0xFFB7C4E0),
                        fontSize: 11.spMin,
                        fontWeight: FontWeight.w400,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFf34e3a))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.white)),
                    )),
                20.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Catégorie',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteHelper.getCategories());
                        Get.find<CategoriesController>().getCategories();
                      },
                      child: Text(
                        'SEE ALL',
                        style: GoogleFonts.poppins(
                          color: Color(0xFFf34e3a),
                          fontSize: 10.spMax,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                10.h.verticalSpace,
                SizedBox(
                  height: 100.h,
                  child: Obx(() => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Get.find<CategoriesController>().categoriesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final category = Get.find<CategoriesController>()
                            .categoriesList
                            .value[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              RouteHelper.categorieById,
                            );

                            Get.find<CategoriesController>()
                                .getCategorieByID(category.id!);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: buildCircleAvatar(
                                imagePath: category.image.toString(),
                                text: category.name.toString()),
                          ),
                        );
                      })),
                ),
                10.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Activities',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteHelper.getActivities());
                      },
                      child: Text(
                        'SEE ALL',
                        style: GoogleFonts.poppins(
                          color: Color(0xFFf34e3a),
                          fontSize: 10.spMax,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                10.h.verticalSpace,
                SizedBox(
                  height: 100.h,
                  child: Obx(() => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Get.find<ActivitiesController>()
                          .activitiesList
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        final activity = Get.find<ActivitiesController>()
                            .activitiesList
                            .value[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                RouteHelper.activitieById,
                              );

                              Get.find<ActivitiesController>()
                                  .getActivityByID(activity.id!);
                            },
                            child: buildCircleAvatar(
                                imagePath: activity.image.toString(),
                                text: activity.name.toString()),
                          ),
                        );
                      })),
                ),
               Get.find<AuthController>().userRole == admin?Container(height: 20,

                 color:Colors.orange,
                 width: 50,) :Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Packs',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print("tessst ");
                        Get.toNamed(RouteHelper.getPacks());
                      },
                      child: Text(
                        'SEE ALL',
                        style: GoogleFonts.poppins(
                          color: Color(0xFFf34e3a),
                          fontSize: 10.spMax,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                10.h.verticalSpace,
                SizedBox(
                  height: 150.h,
                  child: Obx(() => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Get.find<PacksController>().packsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final pack =
                            Get.find<PacksController>().packsList.value[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                RouteHelper.packById,
                              );

                              Get.find<PacksController>().getPackByID(pack.id!);
                            },
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        pack.activity!.image.toString(),
                                        width: MediaQuery.of(context).size.width / 1.2,
                                        fit: BoxFit.cover, loadingBuilder:
                                            (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: SpinKitDoubleBounce(
                                          size: 10,
                                          color: Colors.orange,
                                        ),
                                      );
                                    })),
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15)),
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      padding: EdgeInsets.all(8.0),
                                      // Adjust padding as needed
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 20.h,
                                              child: Text(

                                                pack.price! + " dt",
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 16.spMin,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                //   TextStyle(
                                                //       color: Colors.white),
                                                //   overflow: TextOverflow
                                                //    .ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
                ),



                10.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trainers",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteHelper.getTrainers());
                      },
                      child: Text(
                        'SEE ALL',
                        style: GoogleFonts.poppins(
                          color: Color(0xFFf34e3a),
                          fontSize: 10.spMax,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                10.h.verticalSpace,
                SizedBox(
                  height: 100.h,
                  child: Obx(() => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          Get.find<TrainersController>().trainersList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final trainer = Get.find<TrainersController>()
                            .trainersList
                            .value[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              RouteHelper.trainerById,
                            );
                            Get.find<TrainersController>()
                                .getTrainerByID(trainer.id!);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: buildCircleAvatar(
                                imagePath: trainer.image.toString(),
                                text: trainer.name.toString()),
                          ),
                        );
                      })),
                ),
              ],
            ),
          ),
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
          onPressed: () {

              Get.toNamed(RouteHelper.getQrCode());

          },
          child: Image.asset("assets/scanner.jfif",width: 30,height: 30,),
          shape: CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

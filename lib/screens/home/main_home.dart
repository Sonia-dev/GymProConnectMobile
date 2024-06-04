import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/controllers/packs_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/trainers_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/constants.dart';
import '../../data/controllers/activities_controller.dart';
import '../../data/controllers/categories_controller.dart';
import '../../data/controllers/profil_controller.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/circle_avatar_widget.dart';



class MainHome extends StatelessWidget{
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ProfilController>(builder: (controller) {
      return Obx(() => controller.isLoading.value
          ? const Center(
          child: SpinKitDoubleBounce(
            color: Colors.orange,
          ))
          : SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(left: 16.0,right:16.w,bottom:50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                20.h.verticalSpace,
                Row(
                  children: [
                    Text(
                      "welcome ${controller.user.user?.name.toString()??""} !",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20.spMin,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
                10.h.verticalSpace,
                Text('$dayOfWeek, $dayOfMonth $month $year',
                    style: GoogleFonts.poppins(
                      color: Color(0xFFf34e3a),
                      fontSize: 11.spMin,
                      fontWeight: FontWeight.w500,
                    )),
                10.h.verticalSpace,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () async  {
                        Get.toNamed(RouteHelper.getCategories());
                        await Get.find<CategoriesController>().getCategories();
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
                        imagePath: category.image != null ? category.image.toString() : "assets/no_image.jpg",
                        text: category.name.toString(),
                        ),));
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
                                imagePath: activity.image != null ? activity.image.toString() : "assets/no_image.jpg",
                                text: activity.name.toString()),
                          ),
                        );
                      })),
                ),
               Row(
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
                  height: 170.h,
                  child: Obx(() => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Get.find<PacksController>().packsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final pack =
                            Get.find<PacksController>().packsList.value[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () async {

                              await Get.find<PacksController>().getPackByID(pack.id!);
                              Get.toNamed(
                                RouteHelper.getPackById(),
                              );

                            },
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: pack.image != null
                                      ? Image.network(
                                    pack.image.toString(),
                                    width: MediaQuery.of(context).size.width / 1.2,
                                    fit: BoxFit.cover,
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
                                    "assets/no_image.jpg",
                                    width: MediaQuery.of(context).size.width / 1.2,
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                                imagePath:  trainer.image != null ? trainer.image.toString() : "assets/no_image.jpg",
                                text: trainer.name.toString()),
                          ),
                        );
                      })),
                ),
              ],
            ),
          ),
        ),
      );}
      ),
    ));
  }
}

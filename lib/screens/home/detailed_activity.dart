import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/activities_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/categories_controller.dart';
import 'package:gymproconnect_flutter/screens/home/reviews.dart';

import '../../data/controllers/packs_controller.dart';
import '../../data/controllers/trainers_controller.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/circle_avatar_widget.dart';
import '../payment/payment_methods.dart';

class ActivityDetail extends GetView<ActivitiesController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        Scaffold(body: GetBuilder<ActivitiesController>(builder: (controller) {
      return Obx(() => controller.isLoading.value
          ? const Center(
              child: SpinKitDoubleBounce(
              color: Colors.orange,
            ))
          : SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Stack(
                    children: [
                      Image.network(
                        controller.activityDetails.image.toString(),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height / 3,
                        errorBuilder: (context, error, stackTrace) {
                          return SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset("assets/no_image.jpg",
                                  fit: BoxFit.cover));
                        },
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
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF7F9FD),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 8,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [
                                Colors.black.withOpacity(0),
                                Colors.black
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  controller.activityDetails.category?.name
                                          .toString() ??
                                      "",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFFF34E3A),
                                    fontSize: 14.spMin,
                                    fontWeight: FontWeight.w500,
                                  )),
                              10.h.verticalSpace,
                              Text(controller.activityDetails.name.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20.spMin,
                                    fontWeight: FontWeight.w500,
                                  )),
                              10.h.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.h.verticalSpace,
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Description",
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF0C1A30),
                                  fontSize: 20.spMin,
                                  fontWeight: FontWeight.w600,
                                )),
                            10.h.verticalSpace,
                            Text(
                                controller.activityDetails.description
                                    .toString(),
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF0C1A30),
                                  fontSize: 14.spMin,
                                  fontWeight: FontWeight.w400,
                                )),
                            10.h.verticalSpace,
                            Text('muscle groups',
                                style: GoogleFonts.poppins(
                                  color: Color(0xFFABABAB),
                                  fontSize: 16.spMin,
                                  fontWeight: FontWeight.w300,
                                )),
                            Text(
                                controller.activityDetails.muscleGroups
                                    .toString(),
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF0C1A30),
                                  fontSize: 14.spMin,
                                  fontWeight: FontWeight.w400,
                                )),
                            10.h.verticalSpace,
                            Text('tenue recommandée',
                                style: GoogleFonts.poppins(
                                  color: Color(0xFFABABAB),
                                  fontSize: 16.spMin,
                                  fontWeight: FontWeight.w300,
                                )),
                            10.h.verticalSpace,
                            Text(
                              controller.activityDetails.recommendedOutfit
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            10.h.verticalSpace,
                            Text('Recommandations',
                                style: GoogleFonts.poppins(
                                  color: Color(0xFFABABAB),
                                  fontSize: 16.spMin,
                                  fontWeight: FontWeight.w300,
                                )),
                            10.h.verticalSpace,
                            Text(
                              controller.activityDetails.recommendations
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            10.h.verticalSpace,
                            Text('Trainers',
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF0C1A30),
                                  fontSize: 20.spMin,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: 100.h,
                              child: buildCircleAvatarhor(
                                  imagePath: controller
                                              .activityDetails.coach?.image !=
                                          null
                                      ? controller.activityDetails?.coach?.image
                                              .toString() ??
                                          ""
                                      : "assets/no_image.jpg",
                                  name: controller.activityDetails.coach?.name
                                          .toString() ??
                                      "",
                                  title: controller.activityDetails.coach?.title
                                          .toString() ??
                                      ""),
                            ),
                            Text('Categories',
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF0C1A30),
                                  fontSize: 20.spMin,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: 100.h,
                              child: GestureDetector(
                                onTap: () async {
                                  await Get.find<
                                      CategoriesController>()
                                      .getCategorieByID(
                                      controller.activityDetails?.category?.id??1);
                                  Get.toNamed(
                                    RouteHelper.getActivitieById(),
                                  );

                                },
                                child: buildCircleAvatarhor(
                                  imagePath: controller.activityDetails.category?.image != null
                                      ? controller.activityDetails?.coach?.image.toString() ?? ""
                                      : "assets/no_image.jpg",
                                  name: controller.activityDetails.category?.name.toString() ?? "",
                                  title: controller.activityDetails.category?.description.toString() ?? "",
                                ),
                              ),
                            ),


                            Text('Packs',
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF0C1A30),
                                  fontSize: 20.spMin,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: 100.h,
                              child: controller.activityDetails?.packs != null
                                  ? ListView.builder!(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller
                                          .activityDetails?.packs?.length,
                                      itemBuilder: (context, index) {
                                        var pack = controller
                                            .activityDetails?.packs?[index];
                                        return InkWell(onTap: () async {
                                          await Get.find<PacksController>()
                                              .getPackByID(pack!.id!);
                                          Get.toNamed(
                                            RouteHelper.getPackById(),
                                          );
                                          child:buildCircleAvatar(
                                            imagePath:
                                                pack?.image.toString() ?? "",
                                            text: pack?.name.toString() ?? "",
                                          );
                                        });
                                      },
                                    )
                                  : Center(
                                      child: Text(
                                          "Il n'y a pas de packs disponibles pour cette activité.",
                                          style: GoogleFonts.poppins(
                                            color: Color(0xFF6D6A8E),
                                            fontSize: 16.spMin,
                                            fontWeight: FontWeight.w300,
                                          )),
                                    ),
                            ),
                          ]))
                ])));
    })));
  }
}

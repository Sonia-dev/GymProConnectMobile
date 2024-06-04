import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/activities_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/packs_controller.dart';

import '../../data/controllers/categories_controller.dart';
import '../../models/book_model.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/circle_avatar_widget.dart';

class PackDetail extends GetView<PacksController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<PacksController>(builder: (controller) {
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
                            controller.packsData.image.toString(),
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height / 3,
                            errorBuilder: (context, error, stackTrace) {
                              return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
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
                            bottom: 20,
                            left: 20,
                            child: Text(
                              controller.packsData.name.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20.spMin,
                                fontWeight: FontWeight.w500,
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
                                Text("Nombre de séances",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                10.h.verticalSpace,
                                Text(controller.packsData.sessionCount.toString(),
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 14.spMin,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text("Durée ",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                10.h.verticalSpace,
                                Text(
                                    "${controller.packsData.id.toString()} jours",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 14.spMin,
                                      fontWeight: FontWeight.w400,
                                    )),
                                10.h.verticalSpace,
                                Text('Catégorie',
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
                                            controller.packsData.activity?.category?.id??1);
                                        Get.toNamed(
                                          RouteHelper.getCategorieById(),
                                        );

                                      },
                                  child: buildCircleAvatarhor(
                                      imagePath: controller.packsData.activity?.category?.image != null ? controller.packsData?.activity?.category?.image.toString()??"": "assets/no_image.jpg",
                                      name:
                                      controller.packsData.activity?.category?.name ?? "".toString(),
                                      title: controller.packsData.activity?.category?.description ?? "".toString()),
                                ),),
                                Text('Activitie',
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
                                            ActivitiesController>()
                                            .getActivityByID(
                                            controller.packsData.activity?.id??1);
                                        Get.toNamed(
                                          RouteHelper.getActivitieById(),
                                        );

                                      },
                                  child: buildCircleAvatarhor(
                                      imagePath: controller.packsData.activity?.image != null ? controller.packsData!.activity!.image.toString(): "assets/no_image.jpg",
                                      name:
                                          controller.packsData.activity?.name ??
                                              "".toString(),
                                      title: controller.packsData.activity
                                              ?.category?.name ??
                                          "".toString()),
                                ),),
                                Text('Coach',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(
                                  height: 100.h,

                                  child: buildCircleAvatarhor(
                                      imagePath: controller.packsData.activity?.coach?.image != null ? controller.packsData?.activity?.coach?.image.toString()??"": "assets/no_image.jpg",

                                      name: controller.packsData.activity?.coach
                                              ?.name ??
                                          " ".toString(),
                                      title: controller.packsData.activity
                                              ?.coach?.description ??
                                          " ".toString()),
                                ),

                              ]))
                    ])));
        }),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomAppBar(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      10.h.verticalSpace,
                      SizedBox(
                        width: 76,
                        height: 21,
                        child: Text(
                          'Prix',
                          style: TextStyle(
                            color: Color(0xFF838589),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0.13,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 90,
                        height: 21,
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                "${controller.packsData.price.toString()}",
                                style: TextStyle(
                                  color: Color(0xFFF34E3A),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 0.06,
                                ),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              "dt",
                              style: TextStyle(
                                color: Color(0xFFF34E3A),
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 0.06,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFf34e3a),
                      minimumSize: Size(145, 49),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmer la réservation'),
                            content: Text(
                                'Souhaitez-vous confirmer la réservation de ce pack ?'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Annuler'),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Fermer la boîte de dialogue
                                },
                              ),
                              TextButton(
                                child: Text('Confirmer'),
                                onPressed: () async {
                                  await controller.book(
                                      BookRequest(
                                          pack_id:
                                              controller.packsData.id!.toInt(),
                                          status: 1),
                                      context);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'Réserver',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

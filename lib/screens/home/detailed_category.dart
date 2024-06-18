import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/controllers/activities_controller.dart';
import '../../data/controllers/categories_controller.dart';
import '../../models/categories_model.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/grid_view.dart';

class detailCategory extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<CategoriesController>(
          builder: (controller) {
            return Obx(
                  () =>
              controller.isLoading.value
                  ? Center(
                child: SpinKitDoubleBounce(
                  color: Colors.orange,
                ),
              )
                  : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          controller.categoryDetail.image.toString(),
                          width: double.infinity,
                          height: 250.h,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                              child: Image.asset("assets/no_image.jpg"),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress?.expectedTotalBytes ==
                                loadingProgress?.cumulativeBytesLoaded) {
                              return child;
                            }
                            return Center(
                                child: Container(
                                width: double.infinity,
                                height: 250.h,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                            ));
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
                                icon: Icon(
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
                                  Colors.black,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: SizedBox(
                            height: 15.h,
                            child: Text(
                              controller.categoryDetail.name.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0.10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.all(20.w),
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
                          SizedBox(height: 10.h),
                          Text(
                              controller.categoryDetail.description
                                  .toString(),
                              style: GoogleFonts.poppins(
                                color: Color(0xFF0C1A30),
                                fontSize: 14.spMin,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(height: 10.h),
                          Text("Pour qui ?",
                              style: GoogleFonts.poppins(
                                color: Color(0xFFABABAB),
                                fontSize: 16.spMin,
                                fontWeight: FontWeight.w300,
                              )),
                          SizedBox(height: 10.h),
                          Text(
                              controller.categoryDetail.forWho.toString(),
                              style: GoogleFonts.poppins(
                                color: Color(0xFF0C1A30),
                                fontSize: 14.spMin,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(height: 10.h),
                          Text('Sexe',
                              style: GoogleFonts.poppins(
                                color: Color(0xFFABABAB),
                                fontSize: 16.spMin,
                                fontWeight: FontWeight.w300,
                              )),
                          SizedBox(height: 10.h),
                          Text(
                            controller.categoryDetail.gender.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text("Activités",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF0C1A30),
                                fontSize: 20.spMin,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 10.h),
                          if (controller.isLoading.value)
                            Center(
                              child: SpinKitDoubleBounce(
                                color: Colors.orange,
                              ),
                            )
                          else
            Column(
            children: [
            if (controller.categoryDetail.activities != null && controller.categoryDetail.activities!.isNotEmpty)
            MyGridView(
            activitiesList: controller.categoryDetail.activities!,
            )
            else
            Text(
            "Il n'y a pas d'activités disponibles pour cette catégorie.",
            style: GoogleFonts.poppins(
            color: Color(0xFF6D6A8E),
            fontSize: 16.spMin,
            fontWeight: FontWeight.w300,
            ),
            ),

                              ],
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget MyGridView({required List<Activities> activitiesList}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: activitiesList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          var activity = activitiesList[index];
          return GestureDetector(
            onTap: () async {
              await Get.find<ActivitiesController>().getActivityByID(activity.id!);
              Get.toNamed(RouteHelper.getActivitieById());
            },
            child: GridTile(
              child: Container(
                color: Colors.blue[100],
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    ClipRRect(
                      child: activity.image != null
                          ? Image.network(
                        activity.image.toString(),
                        width: MediaQuery.of(context).size.width  ,
                        height: MediaQuery.of(context).size.height,
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
                        width: MediaQuery.of(context).size.width   ,
                        height: MediaQuery.of(context).size.height,

                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(

                      child: BackdropFilter(
                        filter:
                        ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(
                          width:
                          MediaQuery.of(context).size.width ,
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

                                    activity.name! ,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 16.spMin,
                                      fontWeight: FontWeight.w700,
                                    ),

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
            ),
          );
        },
      ),
    );
  }}
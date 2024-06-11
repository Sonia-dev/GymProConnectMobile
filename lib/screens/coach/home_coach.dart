import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/activities_coach_controller.dart';

import '../../constants/constants.dart';
import '../../data/controllers/activities_controller.dart';
import '../../data/controllers/profil_controller.dart';
import '../../routes/routes_helper.dart';
import 'Seances.dart';


class HomeCoach extends GetView<ActivitiesCoachController> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      body:GetBuilder<ProfilController>(builder: (controller) {
      return Obx(() => controller.isLoading.value
          ? const Center(
          child: SpinKitDoubleBounce(
            color: Colors.orange,
          ))
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          SizedBox(height: 10),
          Text(
            "Bienvenue ${controller.user.user?.name.toString()??""} !",
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),
          Text(
            '$dayOfWeek, $dayOfMonth $month $year',
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFFf34e3a),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),

          Text(
            'Mes activités',
            style: TextStyle(fontSize:18.0,fontWeight:FontWeight.bold),
          ),
          Expanded(
            child: Obx(()=>ListView.builder(
              itemCount: Get.find<ActivitiesCoachController>().ActivitiescoachList.length,
              itemBuilder: (BuildContext context, int index) {
                final activity =
                Get.find<ActivitiesCoachController>().ActivitiescoachList[index];

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          RouteHelper.activitieCoachById,
                        );
                        Get.find<ActivitiesController>()
                            .getActivityByID(activity.id!);
                        Get.find<ActivitiesController>().getReviews(activity.id!);

                      },
                      child: Container(
                        height: 200,
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  activity.image!,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return SizedBox(
                                      height: 200,
                                        width: double.infinity,
                                        child: Image.asset(
                                            "assets/no_image.jpg",height: 200,fit: BoxFit.cover,));
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress?.expectedTotalBytes ==
                                        loadingProgress
                                            ?.cumulativeBytesLoaded) {
                                      return child;
                                    }
                                    return const CircularProgressIndicator();
                                  },
                                )),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15)),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      activity.name.toString(),
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12.spMax,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
            ),)
          ),
        ]),
      ),

    );}
    ));
  }
}


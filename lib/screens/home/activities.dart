import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../data/controllers/activities_controller.dart';
import '../agent/detailed_activity_agent.dart';
import 'detailed_activity.dart';
import 'filtre.dart';

class ActivityList extends GetView<ActivitiesController> {
  @override
  Widget build(BuildContext context) {
    var role = GetStorage().read('userRole');

    return WillPopScope(
      onWillPop: () async {
        await controller.getActivities();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Activities',
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
            onPressed: () async {
              await controller.getActivities();
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(

            onRefresh: () async {
              await controller.getActivities();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          onChanged: (value) {
                            controller.filterActivities(value);
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 12),
                            floatingLabelStyle: GoogleFonts.poppins(
                              color: Color(0xFFB7C4E0),
                              fontSize: 11.spMin,
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'Nom de l\'activité',
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
                                  width: 1, color: Color(0xFFf34e3a)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const ImageIcon(
                        AssetImage('assets/filtre.png'),
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Filtre()),
                        );
                      },
                    ),
                  ],
                ),
                10.h.verticalSpace,
                Expanded(
                  child: Obx(() {
                    return controller.filteredActivityList.isEmpty
                        ? SizedBox(
                            height: 90.h,
                            width: 90.w,
                            child: Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Lottie.asset(
                                        'assets/lotties/no_activity_found.json'),
                                    Text('Pas d\'activité'),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.filteredActivityList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final activity =
                                  controller.filteredActivityList[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    if (role == "adherent") {
                                      await Get.find<ActivitiesController>()
                                          .getActivityByID(activity.id!);
                                      Get.to(ActivityDetail());
                                    } else if (role == "agent") {
                                      await Get.find<ActivitiesController>()
                                          .getActivityByID(activity.id!);
                                      Get.to(ActivityDetailAgent());
                                    }
                                    ;
                                  },
                                  child: Container(
                                    height: 200,
                                    child: Stack(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                           "http://192.168.1.199:8000/${activity.image.toString()}",
                                            width: double.infinity,
                                            height: 200,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return SizedBox(
                                                height: 200,
                                                width: double.infinity,
                                                child: Image.asset(
                                                  "assets/no_image.jpg",
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            },
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress
                                                      ?.expectedTotalBytes ==
                                                  loadingProgress
                                                      ?.cumulativeBytesLoaded) {
                                                return child;
                                              }
                                              return const CircularProgressIndicator();
                                            },
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          bottom: 0,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15)),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 3, sigmaY: 3),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                padding: EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      activity.name.toString(),
                                                      style: GoogleFonts.poppins(
                                                        color: Color(0xFFf34e3a),
                                                        fontSize: 12.spMax,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      activity.description
                                                          .toString(),
                                                      style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 12.spMax,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
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
                          );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

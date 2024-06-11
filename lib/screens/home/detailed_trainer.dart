import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/trainers_controller.dart';

import '../../data/controllers/categories_controller.dart';


class detailTrainer extends GetView<TrainersController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(body: GetBuilder<TrainersController>(builder: (controller) {
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
                      controller.trainerDetail.image.toString(),
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height / 3,
                      errorBuilder: (context, error, stackTrace) {
                        return SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset("assets/no_image.jpg"));
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress?.expectedTotalBytes ==
                            loadingProgress?.cumulativeBytesLoaded) {
                          return child;
                        }
                        return const CircularProgressIndicator();
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
                                controller.trainerDetail.surname
                                    .toString() ??
                                    "",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Color(0xFFF34E3A),
                                  fontSize: 14.spMin,
                                  fontWeight: FontWeight.w500,
                                )),
                            10.h.verticalSpace,
                            Text(controller.trainerDetail.name.toString(),
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
                          Text("Titre",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF0C1A30),
                                fontSize: 20.spMin,
                                fontWeight: FontWeight.w600,
                              )),
                          10.h.verticalSpace,
                          Text(
                              controller.trainerDetail?.title?.toString()??"Membre de la salle",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF0C1A30),
                                fontSize: 14.spMin,
                                fontWeight: FontWeight.w400,
                              )),
                          10.h.verticalSpace,
                          Text('Numéro de téléphone',
                              style: GoogleFonts.poppins(
                                color: Color(0xFFABABAB),
                                fontSize: 16.spMin,
                                fontWeight: FontWeight.w300,
                              )),
                          10.h.verticalSpace,
                          Text(
                              controller.trainerDetail?.phone?.toString()??"",
                              style:  GoogleFonts.poppins(
                                color: Color(0xFF0C1A30),
                                fontSize: 14.spMin,
                                fontWeight: FontWeight.w400,
                              )
                          ),
                          10.h.verticalSpace,
                          Text('E-mail',
                              style: GoogleFonts.poppins(
                                color: Color(0xFFABABAB),
                                fontSize: 16.spMin,
                                fontWeight: FontWeight.w300,
                              )),
                          10.h.verticalSpace,
                          Text(
                            controller.trainerDetail?.email?.toString()??"",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          10.h.verticalSpace,
                          Text('Adresse',
                              style: GoogleFonts.poppins(
                                color: Color(0xFFABABAB),
                                fontSize: 16.spMin,
                                fontWeight: FontWeight.w300,
                              )),
                          10.h.verticalSpace,
                          Text(
                            controller.trainerDetail?.adress?.toString()??"",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),



                        ]))
              ])));
    })));
  }
}



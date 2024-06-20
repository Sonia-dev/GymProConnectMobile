import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/controllers/trainers_controller.dart';
import '../../models/review_model.dart';
import '../../widgets/circle_avatar_widget.dart';

class DetailedAdherent extends GetView<TrainersController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<TrainersController>(
          builder: (controller) {
            return Obx(
                  () => controller.isLoading.value
                  ? Center(
                child: SpinKitDoubleBounce(
                  color: Colors.orange,
                ),
              )
                  : Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                    MediaQuery.of(context).size.height / 2.5-50,
                  ),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    flexibleSpace: Stack(
                      children: [
                        Image.network("http://192.168.1.199:8000/${controller.trainerDetail.image.toString()}",

                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          height:
                          (MediaQuery.of(context).size.height / 2.5-50) ,
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                              height:
                              (MediaQuery.of(context).size.height /
                                  2.5-50),
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                "assets/no_image.jpg",
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                          loadingBuilder:
                              (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: Container(
                                width: double.infinity,
                                height: 200.h,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
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
                            height:
                            MediaQuery.of(context).size.height / 8,
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
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.trainerDetail.surname
                                      .toString().toUpperCase() ,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFFf34e3a),
                                    fontSize: 20.spMin,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                5.w.horizontalSpace,
                                Text(
                                  controller.trainerDetail.name
                                      .toString().toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20.spMin,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
10.h.verticalSpace,
                      Text(
                        "Titre",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF0C1A30),
                          fontSize: 20.spMin,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      10.h.verticalSpace,
                      Text(
                        controller.trainerDetail?.title?.toString() ??
                            "Membre de la salle",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF0C1A30),
                          fontSize: 14.spMin,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      10.h.verticalSpace,
                      Text(
                        'Numéro de téléphone',
                        style: GoogleFonts.poppins(
                          color: Color(0xFFABABAB),
                          fontSize: 16.spMin,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      10.h.verticalSpace,
                      Text(
                        controller.trainerDetail?.phone?.toString() ?? "",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF0C1A30),
                          fontSize: 14.spMin,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      10.h.verticalSpace,
                      Text(
                        'E-mail',
                        style: GoogleFonts.poppins(
                          color: Color(0xFFABABAB),
                          fontSize: 16.spMin,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      10.h.verticalSpace,
                      Text(
                        controller.trainerDetail?.email?.toString() ?? "",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      10.h.verticalSpace,
                      Text(
                        'Adresse',
                        style: GoogleFonts.poppins(
                          color: Color(0xFFABABAB),
                          fontSize: 16.spMin,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      10.h.verticalSpace,
                      Text(
                        controller.trainerDetail?.adress?.toString() ?? "",
                        style:  GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,

                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

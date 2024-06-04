import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/planning_controller.dart';
import 'package:lottie/lottie.dart';
import '../../data/repository/planning_repo.dart';

class abonnement extends GetView<PlanningController> {
  @override
  Widget build(BuildContext context) {
    Get.put(PlanningRepo(apiClient: Get.find()));
    Get.put(PlanningController(
      planningRepo: Get.find(),
    ));
    return GetBuilder<PlanningController>(builder: (controller) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(child: const Text("My membership")),
            bottom: const TabBar(
              indicatorColor: Color(0xFFF34E3A),
              labelColor: Color(0xFFF8A69C),
              tabs: [
                Tab(
                  text: "Active",
                ),
                Tab(
                  text: "Completed",
                ),
                Tab(
                  text: "Cancelled",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Obx(
                        () => controller.activeList.value.isEmpty
                        ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 80.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200.h,
                            width: 200.w,
                            child: Lottie.asset(
                                'assets/lotties/no_membership.json'),
                          ),
                          Text('Pas de réservation en cours ... ')
                        ],
                      ),
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.activeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final booking =
                        controller.activeList.value[index];
                        return Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    booking.pack!.image.toString() != null
                                        ? Container(
                                      width: 92.w,
                                      height: 87.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: booking.pack
                                              ?.image !=
                                              null
                                              ? NetworkImage(booking
                                              .pack?.image
                                              .toString() ??
                                              "")
                                              : AssetImage(
                                              'assets/no_image.png')
                                          as ImageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4),
                                      ),
                                    )
                                        : Container(
                                      width: 92.w,
                                      height: 87.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/no_image.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            booking.pack?.name
                                                .toString() ??
                                                "",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              height: 0,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          5.h.verticalSpace,
                                          Text(
                                            booking.paymentStatus ?? "",
                                            style: GoogleFonts.rubik(
                                              color: Color(0xFFF34E3A),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          5.h.verticalSpace,
                                          Text(
                                            "${booking.pack?.price.toString()} dt",
                                            style: GoogleFonts.rubik(
                                              color: Color(0xFF677294),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              height: 0,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          5.h.verticalSpace,
                                          Text(
                                            "${booking.pack?.nbrOfSession} séances",
                                            style: GoogleFonts.rubik(
                                              color: Color(0xFF677294),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              height: 0,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Color(0xFFC3C2C2),
                                  thickness: 1.0,
                                ),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      TextEditingController
                                      reasonController =
                                      TextEditingController();
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                                "Confirmer l'annulation de pack"),
                                            content: Column(
                                              mainAxisSize:
                                              MainAxisSize.min,
                                              children: [
                                                Text(
                                                    'Êtes-vous sûr(e) de vouloir annuler votre réservation ?'),
                                                TextField(
                                                  controller:
                                                  reasonController,
                                                  decoration:
                                                  InputDecoration(
                                                    hintText:
                                                    "Entrez la raison de l'annulation (optionnel)",
                                                  ),
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Annuler'),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Confirmer'),
                                                onPressed: () async {
                                                  String reason = reasonController
                                                      .text.isNotEmpty
                                                      ? reasonController
                                                      .text
                                                      : "personal reason";
                                                  await controller
                                                      .cancelBooking(
                                                      reason,
                                                      context,
                                                      booking.id!);
                                                  Navigator.of(context)
                                                      .pop(); // Fermer la boîte de dialogue
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Color(0xFFE5E7EB),
                                      minimumSize: Size(350, 50),
                                    ),
                                    child: Text('Cancel',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xFF1C2A3A))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Center(
                    child: Obx(
                          () => controller.completedList.value!.isEmpty
                          ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 80.h),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 200.h,
                              width: 200.w,
                              child: Lottie.asset(
                                  'assets/lotties/no_membership.json'),
                            ),
                            Text('Pas de reservation complété ')
                          ],
                        ),
                      )
                          : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.completedList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final booking =
                          controller.completedList.value[index];
                          return Card(
                            color: Colors.white,
                            margin: EdgeInsets.all(10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 92.w,
                                        height: 87.h,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(booking
                                                .pack?.image
                                                .toString() ??
                                                "assets/no_image.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(4)),
                                        ),
                                      ),
                                      // Chemin de l'image
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              booking.pack?.name
                                                  .toString() ??
                                                  "", // Titre de l'image
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            8.h.verticalSpace,
                                            Text(
                                              booking.pack?.activity?.name
                                                  .toString() ??
                                                  "",
                                              style: GoogleFonts.rubik(
                                                color: Color(0xFFF34E3A),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            5.h.verticalSpace,
                                            Text(
                                              "${booking.pack?.price.toString()} dt",
                                              style: GoogleFonts.rubik(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                height: 0,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            5.h.verticalSpace,
                                            Text(
                                              "${booking.pack?.nbrOfSession.toString()} séances",
                                              style: GoogleFonts.rubik(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                height: 0,
                                                letterSpacing: -0.30,
                                              ),
                                            ), // Sous-titre 3
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              ),
              SingleChildScrollView(
                child: Center(
                    child: Obx(
                          () => controller.canceledList.value!.isEmpty
                          ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 80.h),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 200.h,
                              width: 200.w,
                              child: Lottie.asset(
                                  'assets/lotties/no_membership.json'),
                            ),
                            Text('Aucune réservation annulée')
                          ],
                        ),
                      )
                          : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.canceledList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final booking =
                          controller.canceledList.value[index];
                          return Card(
                            color: Colors.white,
                            margin: EdgeInsets.all(10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 92.w,
                                        height: 87.h,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(booking
                                                .pack?.image
                                                .toString() ??
                                                "assets/no_image.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(4)),
                                        ),
                                      ),
                                      // Chemin de l'image
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              booking.pack?.name
                                                  .toString() ??
                                                  "", // Titre de l'image
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            8.h.verticalSpace,
                                            Text(
                                              booking.pack?.activity?.name
                                                  .toString() ??
                                                  "",
                                              style: GoogleFonts.rubik(
                                                color: Color(0xFFF34E3A),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            5.h.verticalSpace,
                                            Text(
                                              "${booking.pack?.price.toString()} dt",
                                              style: GoogleFonts.rubik(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                height: 0,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                            5.h.verticalSpace,
                                            Text(
                                              "${booking.pack?.nbrOfSession.toString()} séances",
                                              style: GoogleFonts.rubik(
                                                color: Color(0xFF677294),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                height: 0,
                                                letterSpacing: -0.30,
                                              ),
                                            ), // Sous-titre 3
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Color(0xFFC3C2C2),
                                    thickness: 1.0,
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Confirmer la réservation'),
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
                                                    await controller
                                                        .rebookBooking(
                                                        context,
                                                        booking.id!);
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFE5E7EB),
                                        minimumSize: Size(350, 50),
                                      ),
                                      child: Text('Re-Book',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Color(0xFF1C2A3A))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}

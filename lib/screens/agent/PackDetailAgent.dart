import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/packs_controller.dart';
import '../../models/book_model.dart';
import '../../widgets/circle_avatar_widget.dart';

class PackDetailAgent extends GetView<PacksController> {
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
              :  DefaultTabController(
              length: 2,
              child: Scaffold(
              appBar: PreferredSize(
              preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 2.5), // Change the height here
          child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace:
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
            bottom: TabBar(
              indicatorColor: Color(0xFFF34E3A),
              labelColor: Color(0xFFF8A69C),
              tabs: const <Widget>[
                Tab(text: 'À propos'),
                Tab(text: 'Les avis'),
              ],
            ),
          ),
              ),
                  body: TabBarView(
                      children: [
                    SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                10.h.verticalSpace,
                                Text("Nombre de séances",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                10.h.verticalSpace,
                                Text(controller.packsData.nbrOfSession.toString(),
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 14.spMin,
                                      fontWeight: FontWeight.w400,
                                    )),
                                10.h.verticalSpace,
                                Text("Durée ",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                10.h.verticalSpace,
                                Text(
                                    "${controller.packsData.duration.toString()} jours",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 14.spMin,
                                      fontWeight: FontWeight.w400,
                                    )),
                                10.h.verticalSpace,
                                Text("Prix ",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                10.h.verticalSpace,
                                Text(
                                    "${controller.packsData.price.toString()} dt",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 14.spMin,
                                      fontWeight: FontWeight.w400,
                                    )),
                                10.h.verticalSpace,
                                Text('Activitie',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(
                                  height: 100.h,
                                  child: buildCircleAvatarhor(
                                      imagePath: controller
                                          .packsData.activity?.image ??
                                          "".toString(),
                                      name:
                                      controller.packsData.activity?.name ??
                                          "NN RN".toString(),
                                      title: controller.packsData.activity
                                          ?.category?.name ??
                                          "nn".toString()),
                                ),
                                Text('Coach',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(
                                  height: 100.h,
                                  child: buildCircleAvatarhor(
                                      imagePath: controller.packsData.activity?.coach?.image!= null?controller.packsData.activity?.coach?.image.toString() ?? "":"assets/no_image.jpg",
                                      name: controller.packsData.activity?.coach
                                          ?.name ??
                                          " ".toString(),
                                      title: controller.packsData.activity
                                          ?.coach?.description ??
                                          " ".toString()),
                                ),
                      
                              ])),
                    ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    20.h.verticalSpace,


                                    Text("Les avis",
                                        style: GoogleFonts.poppins(
                                          color: Color(0xFF0C1A30),
                                          fontSize: 20.spMin,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    5.h.verticalSpace,
                                    Obx(
                                          () => ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(), // To make ListView work inside SingleChildScrollView
                                        itemCount: controller.reviewsList.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          final review = controller.reviewsList[index];
                                          return GestureDetector(
                                            onTap: () {},
                                            child: Stack(
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(15),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 100,
                                                        child: customWidget(
                                                          imagePath: review
                                                              .user
                                                              ?.image
                                                              .toString() ??
                                                              "",
                                                          name:
                                                          "${review.user?.name ?? ""} ${review.user?.surname ?? ""}",
                                                          title: review
                                                              .comment
                                                              .toString(),
                                                          starRating: double.parse(
                                                              review.rating ??
                                                                  "0."),
                                                        ),
                                                      ),


                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    10.h.verticalSpace,





                                  ])),)
                  ]))));
        }),

      ),
    );
  }
}

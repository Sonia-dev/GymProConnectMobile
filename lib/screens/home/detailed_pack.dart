import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/packs_controller.dart';
import 'package:gymproconnect_flutter/screens/home/reviews.dart';

import '../../widgets/circle_avatar_widget.dart';
import '../payment/payment_methods.dart';

class PackDetail extends GetView<PacksController> {
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child:
      Scaffold(
          body: GetBuilder<PacksController>(
              builder: (controller) {
                if (controller == null) {
                  // Gérer le cas où controller est null, par exemple, afficher un indicateur de chargement ou un message d'erreur
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Obx(() => controller.isLoading.value
                    ? const Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.orange,
                  ),
                )
                : SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.network(

                            controller.packsData.activity!.image.toString(),
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                            height :MediaQuery.of(context).size.height/3,
                            errorBuilder: (context, error, stackTrace) {
                              return SizedBox(
                                  height :MediaQuery.of(context).size.height/3,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.asset("assets/no_image.jpg",
                                      fit: BoxFit.cover

                                  ));
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


                                  Text(controller.packsData.name.toString(),
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
                                Text("Number of sessions",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                10.h.verticalSpace,
                                Text(
                                    controller.packsData.sessionCount.toString(),
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 14.spMin,
                                      fontWeight: FontWeight.w400,
                                    )),


                                Text('Activity',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(
                                  height: 100.h,
                                  child: buildCircleAvatarhor(
                                      imagePath: controller
                                          .packsData.activity!.image.toString(),
                                      name: controller.packsData.activity!.name
                                          .toString(),
                                      title: " "),
                                ),
                                Text('Category',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(
                                  height: 100.h,
                                  child: buildCircleAvatarhor(
                                      imagePath: controller
                                          .packsData.activity!.category!.image
                                          .toString(),
                                      name: controller
                                          .packsData.activity!.category!.name
                                          .toString(),
                                      title: controller
                                          .packsData.activity!.category!.description
                                          .toString()),
                                ),
                                Text('Trainer',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(
                                  height: 100.h,
                                  child: buildCircleAvatarhor(
                                      imagePath: controller
                                          .packsData.activity!.coach!.image
                                          .toString(),
                                      name: controller
                                          .packsData.activity!.coach!.name
                                          .toString(),
                                      title: controller
                                          .packsData.activity!.coach!.description
                                          .toString()),
                                ),
                              ]))
                    ])));
          })));




    //   SafeArea(
    //   child: Scaffold(
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           SingleChildScrollView(
    //               child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Stack(
    //                       children: [
    //                         if (controller.packsData.activity != null && controller.packsData.activity!.image != null)
    //                           Image.network(
    //                             controller.packsData.activity!.image.toString(),
    //                             width: double.infinity,
    //                             fit: BoxFit.cover,
    //                             errorBuilder: (context, error, stackTrace) {
    //                               return SizedBox(
    //                                   child: Image.asset("assets/no_image.jpg"));
    //                             },
    //                             loadingBuilder: (context, child, loadingProgress) {
    //                               if (loadingProgress?.expectedTotalBytes ==
    //                                   loadingProgress?.cumulativeBytesLoaded) {
    //                                 return child;
    //                               }
    //                               return const CircularProgressIndicator();
    //                             },
    //                         ),
    //                         Positioned(
    //                           left: 10,
    //                           top:10,
    //                           child: Container(
    //                             width: 44.w,
    //                             height: 44.h,
    //                             decoration: BoxDecoration(
    //                               shape: BoxShape.circle,
    //                               color: Color(0xFFF7F9FD),
    //                             ),
    //                             child: Center(
    //                               child: IconButton(
    //                                 icon: const Icon(
    //                                   Icons.arrow_back,
    //
    //                                 ),
    //                                 onPressed: () {
    //                                   Navigator.pop(context);
    //                                 },
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Positioned(
    //                           bottom: 0,
    //                           child: Container(
    //                             width: MediaQuery.of(context).size.width,
    //                             height: MediaQuery.of(context).size.height / 8,
    //                             decoration: BoxDecoration(
    //                               gradient: LinearGradient(
    //                                 begin: Alignment(0.00, -1.00),
    //                                 end: Alignment(0, 1),
    //                                 colors: [
    //                                   Colors.black.withOpacity(0),
    //                                   Colors.black
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Positioned(
    //                           bottom: 0,
    //                           child: Padding(
    //                             padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //                             child: Column(
    //                               mainAxisAlignment: MainAxisAlignment.start,
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //
    //                                 SizedBox(
    //                                   height: 40.h,
    //                                   child: Text(
    //
    //                                     controller.packsData.name.toString(),
    //                                     textAlign: TextAlign.center,
    //                                     style: const TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 20,
    //                                       fontFamily: 'Poppins',
    //                                       fontWeight: FontWeight.w500,
    //                                       height: 0,
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 10.h.verticalSpace,
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     20.h.verticalSpace,
    //                     Padding(
    //                       padding:  EdgeInsets.symmetric(horizontal: 20.w),
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.start,
    //                             children: [
    //                               Text(
    //                                 "Nombre de sessions ",
    //                                 style: GoogleFonts.poppins(
    //                                   color: Color(0xFFABABAB),
    //                                   fontSize: 16.spMin,
    //                                   fontWeight: FontWeight.w300,
    //                                 )
    //                               ),
    //                             ],
    //                           ),
    //                           10.h.verticalSpace,
    //                           Text(
    //                             controller.packsData.sessionCount.toString(),
    //                             style:GoogleFonts.poppins(
    //                               color: Color(0xFFABABAB),
    //                               fontSize: 16.spMin,
    //                               fontWeight: FontWeight.w300,
    //                             )
    //                           ),
    //                           10.h.verticalSpace,
    //                           // const Text(
    //                           //   'Durée',
    //                           //   style: TextStyle(
    //                           //     color: Color(0xFFABABAB),
    //                           //     fontSize: 16,
    //                           //     fontFamily: 'Poppins',
    //                           //     fontWeight: FontWeight.w300,
    //                           //   ),
    //                           // ),
    //                           // Text(
    //                           //   controller.packsData.,
    //                           //   style: const TextStyle(
    //                           //     color: Colors.black,
    //                           //     fontSize: 14,
    //                           //     fontFamily: 'Poppins',
    //                           //     fontWeight: FontWeight.w400,
    //                           //   ),
    //                           // ),
    //                           // 10.h.verticalSpace,
    //                           // const Text(
    //                           //   'Trainers',
    //                           //   style: TextStyle(
    //                           //     color: Color(0xFF0C1A30),
    //                           //     fontSize: 20,
    //                           //     fontFamily: 'Poppins',
    //                           //     fontWeight: FontWeight.w600,
    //                           //   ),
    //                           // ),
    //                           // SizedBox(
    //                           //   height: 200.h,
    //                           //   child: ListView(
    //                           //     scrollDirection: Axis.vertical,
    //                           //     children: [
    //                           //       Row(
    //                           //         children: [
    //                           //           CircleAvatar(
    //                           //             radius: 32,
    //                           //             child: Image.network(
    //                           //               pack.coach.image,
    //                           //               errorBuilder:
    //                           //                   (context, error, stackTrace) {
    //                           //                 return ClipOval(
    //                           //                     child: SizedBox.fromSize(
    //                           //                         size: const Size.fromRadius(30),
    //                           //                         child: Image.asset(
    //                           //                             "assets/no_image.jpg")));
    //                           //               },
    //                           //               loadingBuilder:
    //                           //                   (context, child, loadingProgress) {
    //                           //                 if (loadingProgress
    //                           //                     ?.expectedTotalBytes ==
    //                           //                     loadingProgress
    //                           //                         ?.cumulativeBytesLoaded) {
    //                           //                   return child;
    //                           //                 }
    //                           //                 return const CircularProgressIndicator();
    //                           //               },
    //                           //             ),
    //                           //           ),
    //                           //           const SizedBox(width: 10),
    //                           //           Column(
    //                           //             crossAxisAlignment: CrossAxisAlignment.start,
    //                           //             children: [
    //                           //               Text(
    //                           //                 pack.coach.name.toString(),
    //                           //                 style: const TextStyle(
    //                           //                   color: Color(0xFF170F49),
    //                           //                   fontSize: 18,
    //                           //                   fontFamily: 'Poppins',
    //                           //                   fontWeight: FontWeight.w700,
    //                           //                 ),
    //                           //               ),
    //                           //               5.h.verticalSpace,
    //                           //               Text(
    //                           //                 pack.coach.title.toString(),
    //                           //                 style: const TextStyle(
    //                           //                   color: Color(0xFF6E6B8F),
    //                           //                   fontSize: 15,
    //                           //                   fontFamily: 'Poppins',
    //                           //                   fontWeight: FontWeight.w400,
    //                           //                 ),
    //                           //               ),
    //                           //             ],
    //                           //           ),
    //                           //         ],
    //                           //       ),
    //                           //     ],
    //                           //   ),
    //                           // ),
    //                         ],
    //                       ),
    //                     )
    //                   ])),
    //         ],
    //       ),
    //     ),
    //     bottomNavigationBar:  ClipRRect(
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(20),
    //         topRight: Radius.circular(20),
    //       ),
    //       child: BottomAppBar(
    //         color: Colors.white,
    //         child: SingleChildScrollView(
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: <Widget>[
    //               Column(
    //                 children: [
    //                   10.h.verticalSpace,
    //                   SizedBox(
    //                     width: 76,
    //                     height: 21,
    //                     child: Text(
    //                       'Prix',
    //                       style: TextStyle(
    //                         color: Color(0xFF838589),
    //                         fontSize: 14,
    //                         fontFamily: 'Poppins',
    //                         fontWeight: FontWeight.w400,
    //                         height: 0.13,
    //                       ),
    //                     ),
    //                   ),
    //                   10.h.verticalSpace,
    //
    //                   SizedBox(
    //                     width: 76,
    //                     height: 21,
    //                     child: Text(
    //                       controller.packsData.price.toString()+" dt",
    //
    //                       style: TextStyle(
    //                         color: Color(0xFFF34E3A),
    //                         fontSize: 20,
    //                         fontFamily: 'Poppins',
    //                         fontWeight: FontWeight.w700,
    //                         height: 0.06,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: Color(0xFFf34e3a),
    //                   minimumSize: Size(145, 49),
    //                 ),
    //                 onPressed: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) => payment_methods(),
    //                     ),
    //                   );
    //                 },
    //                 child: Text(
    //                   'Réserver',
    //                   style: TextStyle(fontSize: 18.0, color: Colors.white),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //
    //   ),
    // );
  }
}


import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/trainers_controller.dart';
import 'package:gymproconnect_flutter/screens/home/reviews.dart';

import '../../data/controllers/categories_controller.dart';
import '../../models/review_model.dart';
import '../../widgets/circle_avatar_widget.dart';
import '../../widgets/review_card.dart';



class detailTrainer extends GetView<TrainersController> {
  @override
  Widget build(BuildContext context) {
    double coverHeight = 300.h;
    double profilPicHeight = 150.h;
    double top = coverHeight - profilPicHeight / 2;

    return GetBuilder<TrainersController>(builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: Obx(() =>  controller.isLoading.value?SpinKitDoubleBounce(color: Colors.deepOrange,):SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            "assets/profile.png",
                            fit: BoxFit.fitWidth,
                            height: coverHeight,
                            width: double.infinity,
                          ),
                          Positioned(
                            top: top,
                            child: CircleAvatar(
                              radius: 90.w,
                              backgroundColor: Colors.deepOrange,
                              child: Padding(
                                padding: const EdgeInsets.all(2), // Border radius
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 120,
                                    backgroundImage: NetworkImage(
                                      controller.trainerDetail.image.toString(),
                                    ),
                                    onBackgroundImageError: (error, stackTrace) {
                                      // Handle the error
                                    },
                                  ),
                                ),
                              ),
                            ),
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
                                    controller.tabController?.index = 0;
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: profilPicHeight / 2 + 40), // Adjust space for the profile picture
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Text(
                                  "${controller.trainerDetail.name.toString().toUpperCase()} ${controller.trainerDetail.surname.toString().toUpperCase()}",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 24.spMin,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  controller.trainerDetail?.title?.toString() ?? "",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF0C1A30),
                                    fontSize: 20.spMin,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [


                                          Obx(() {
                                            if (controller.isLoading.value) {
                                              return const Center(
                                                child: SpinKitDoubleBounce(
                                                  color: Colors.orange,
                                                ),
                                              );
                                            } else if (controller.userReviewsList.isEmpty) {
                                              return Text(
                                                'Aucun avis disponible',
                                                style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                                              );
                                            } else {
                                              return ListView.builder(
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                itemCount: controller.userReviewsList.length,
                                                itemBuilder: (context, index) {
                                                  final review = controller.userReviewsList[index];
                                                  return ReviewCard(comment: review.comment,rating: review.rating,);
                                                },
                                              );
                                            }
                                          }),
                                         TextFormField(
                                      maxLines: 5,
                                      keyboardType: TextInputType.text,
                                      controller: controller.commentController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xffF7F9FD),
                                        hintStyle: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        labelStyle: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: const BorderSide(width: 1, color: Colors.black12),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: const BorderSide(width: 1, color: Colors.black12),
                                        ),
                                        hintText: 'Ajouter un avis ...',
                                      ),
                                                                  ),
                                           SizedBox(height: 10.h),
                                              Center(
                                      child: Obx(() => RatingBar.builder(
                                        initialRating: controller.rating.value,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        unratedColor: Color(0xffE5E7EB),
                                        itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Color(0xFFf34e3a),
                                        ),
                                        onRatingUpdate: (rating) {
                                          controller.rating.value = rating;
                                        },
                                      )),
                                                                  ),
                                              SizedBox(height: 5.h),
                                             Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFf34e3a),
                                          minimumSize: Size(MediaQuery.of(context).size.width, 49),
                                        ),
                                        onPressed: () async {
                                          await controller.review(
                                            ReviewRequest(
                                              rating: controller.rating.value,
                                              comment: controller.commentController.text,
                                            ),
                                            context,
                                            controller.trainerDetail.id ?? 0,
                                          );


                                          },
                                        child: Text(
                                          'Ajouter avis',
                                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                                        ),
                                      ),
                                                                  ),
                                                                  SizedBox(height: 20.h),







                                        ],
                                                              ),
                                    ],
                                  ),
                                                  ),
                                                ],
                                              ),
                            Obx(() => controller.loadReview.value
                                ? Container(
                              color: Colors.black.withOpacity(0.5), // Couleur de l'arrière-plan semi-transparente
                              child: Center(
                                child: CircularProgressIndicator(), // Vous pouvez personnaliser le chargeur comme vous le souhaitez
                              ),
                            )
                                : SizedBox.shrink() // Retourne un conteneur vide si le chargement est terminé
                            ),
                          ],
                        ),
                            )]),



                ],





              )
          ))),
        );
      }
    );
  }
}







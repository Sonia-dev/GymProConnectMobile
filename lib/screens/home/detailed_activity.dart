import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/controllers/activities_controller.dart';
import '../../data/controllers/categories_controller.dart';
import '../../data/controllers/packs_controller.dart';
import '../../data/controllers/reviews_controller.dart';
import '../../models/review_model.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/circle_avatar_widget.dart';

class ActivityDetail extends GetView<ActivitiesController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ActivitiesController>(builder: (controller) {
          return Obx(() => controller.isLoading.value
              ? const Center(
                  child: SpinKitDoubleBounce(
                  color: Colors.orange,
                ))
              : DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(
                          MediaQuery.of(context).size.height /
                              2.5), // Change the height here
                      child: AppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        flexibleSpace: Stack(
                          children: [
                            Image.network(
                              controller.activityDetails.image.toString(),
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              height:
                                  (MediaQuery.of(context).size.height / 2.5) - 50,
                              errorBuilder: (context, error, stackTrace) {
                                return SizedBox(
                                  height:
                                      (MediaQuery.of(context).size.height / 2.5) -
                                          50,
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.activityDetails.category?.name
                                              .toString() ??
                                          "",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Color(0xFFF34E3A),
                                        fontSize: 14.spMin,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    10.h.verticalSpace,
                                    Text(
                                      controller.activityDetails.name
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 20.spMin,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    10.h.verticalSpace,
                                  ],
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                10.h.verticalSpace,
                                Text("Description",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                10.h.verticalSpace,
                                Text(
                                  controller.activityDetails.description
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF0C1A30),
                                    fontSize: 14.spMin,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                10.h.verticalSpace,
                                Text('groupes musculaires',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFFABABAB),
                                      fontSize: 16.spMin,
                                      fontWeight: FontWeight.w300,
                                    )),
                                Text(
                                  controller.activityDetails.muscleGroups
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF0C1A30),
                                    fontSize: 14.spMin,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                10.h.verticalSpace,
                                Text('tenue recommandée',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFFABABAB),
                                      fontSize: 16.spMin,
                                      fontWeight: FontWeight.w300,
                                    )),
                                10.h.verticalSpace,
                                Text(
                                  controller.activityDetails.recommendedOutfit
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                10.h.verticalSpace,
                                Text('Recommandations',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFFABABAB),
                                      fontSize: 16.spMin,
                                      fontWeight: FontWeight.w300,
                                    )),
                                10.h.verticalSpace,
                                Text(
                                  controller.activityDetails.recommendations
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                10.h.verticalSpace,
                                Text('Coaches',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(
                                  height: 100.h,
                                  child: buildCircleAvatarhor(
                                    imagePath: controller
                                                .activityDetails.coach?.image !=
                                            null
                                        ? controller
                                                .activityDetails?.coach?.image
                                                .toString() ??
                                            ""
                                        : "assets/no_image.jpg",
                                    name: controller.activityDetails.coach?.name
                                            .toString() ??
                                        "",
                                    title: controller
                                            .activityDetails.coach?.title
                                            .toString() ??
                                        "",
                                  ),
                                ),
                                Text('Catégories',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(
                                  height: 100.h,
                                  child: GestureDetector(
                                    onTap: () async {
                                      await Get.find<CategoriesController>()
                                          .getCategorieByID(controller
                                                  .activityDetails
                                                  ?.category
                                                  ?.id ??
                                              1);
                                      Get.toNamed(
                                        RouteHelper.getActivitieById(),
                                      );
                                    },
                                    child: buildCircleAvatarhor(
                                      imagePath: controller.activityDetails
                                                  .category?.image !=
                                              null
                                          ? controller.activityDetails?.category
                                                  ?.image
                                                  .toString() ??
                                              ""
                                          : "assets/no_image.jpg",
                                      name: controller
                                              .activityDetails.category?.name
                                              .toString() ??
                                          "",
                                      title: controller.activityDetails.category
                                              ?.description
                                              .toString() ??
                                          "",
                                    ),
                                  ),
                                ),
                                Text('Packs',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF0C1A30),
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(
                                  height: 100.h,
                                  child: controller.activityDetails?.packs !=
                                          null
                                      ? ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller
                                              .activityDetails?.packs?.length,
                                          itemBuilder: (context, index) {
                                            var pack = controller
                                                .activityDetails?.packs?[index];
                                            return InkWell(
                                              onTap: () async {
                                                await Get.find<
                                                        PacksController>()
                                                    .getPackByID(pack!.id!);
                                                Get.toNamed(
                                                  RouteHelper.getPackById(),
                                                );
                                              },
                                              child: buildCircleAvatar(
                                                imagePath:
                                                    pack?.image.toString() ??
                                                        "",
                                                text:
                                                    pack?.name.toString() ?? "",
                                              ),
                                            );
                                          },
                                        )
                                      : Center(
                                          child: Text(
                                            "Il n'y a pas de packs disponibles pour cette activité",
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
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
                                    SingleChildScrollView(
                                        child:ListView.builder(
                                          itemCount:controller.reviewsList.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            final review =controller.reviewsList[index];
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.0),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Stack(
                                                  children: <Widget>[
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(15),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 100,
                                                            child: buildCircleAvatarhor(
                                                                imagePath: review.user?.image
                                                                        .toString() ??
                                                                    "",
                                                                name: review
                                                                        .user?.name
                                                                        .toString() ??
                                                                    "",
                                                                title: review.rating
                                                                    .toString()),
                                                          ),
                                                          Text(review.comment
                                                              .toString()),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),),
                                        10.h.verticalSpace,
                                        TextFormField(
                                          keyboardType: TextInputType.text,
                                          controller: controller.commentController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xffF7F9FD),
                                            labelStyle: TextStyle(color: Colors.black),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  width: 1, color: Colors.black12),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  width: 1, color: Colors.black12),
                                            ),
                                            labelText: 'Ajouter un commentaire',
                                            hintText: 'Ajouter un commentaire',
                                          ),
                                        ),
                                        10.h.verticalSpace,
                                        Center(
                                          child: RatingBar.builder(
                                            initialRating: 0,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                EdgeInsets.symmetric(horizontal: 3.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              controller.ratingController = rating;
                                            },
                                          ),
                                        ),
                                        5.h.verticalSpace,
                                        Center(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xFFf34e3a),
                                              minimumSize: Size(285, 49),
                                            ),
                                            onPressed: () async {
                                              // if (_reviewKey.currentState?.validate()) {
                                              //   _reviewKey.currentState!.save();
                                              await controller.reviews(
                                                  ReviewRequest(
                                                    rating: controller.ratingController,
                                                    comment: controller
                                                        .commentController.text,
                                                  ),
                                                  context,
                                                  controller.activityDetails.id ?? 0);
                                              controller.resetFields();
                                              //   }
                                            },
                                            child: Text(
                                              'Ajouter avis',
                                              style: TextStyle(
                                                  fontSize: 18.0, color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        )
                              ])),
                        )
                      ],
                    ),
                  ),
                ));
        }),
      ),
    );
  }
}

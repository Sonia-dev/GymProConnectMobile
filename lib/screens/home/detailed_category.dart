import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/controllers/categories_controller.dart';
import '../../widgets/grid_view.dart';

class detailCategory extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Expanded(
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
                              SizedBox(
                                height: 15.h,
                                child: Text(
                                  controller.categoryDetail.name.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.10,
                                  ),
                                ),
                              ),
                              10.h.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.h.verticalSpace,
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
                        10.h.verticalSpace,
                        Text(controller.categoryDetail.description.toString(),
                            style: GoogleFonts.poppins(
                              color: Color(0xFF0C1A30),
                              fontSize: 14.spMin,
                              fontWeight: FontWeight.w400,
                            )),
                        10.h.verticalSpace,
                        Text("For Who ?",
                            style: GoogleFonts.poppins(
                              color: Color(0xFFABABAB),
                              fontSize: 16.spMin,
                              fontWeight: FontWeight.w300,
                            )),
                        10.h.verticalSpace,

                        Text(
                          controller.categoryDetail.forWho.toString(),
                          style: GoogleFonts.poppins(
                            color: Color(0xFF0C1A30),
                            fontSize: 14.spMin,
                            fontWeight: FontWeight.w400,
                          )
                        ),
                          10.h.verticalSpace,
                          Text('Gender',
                            style: GoogleFonts.poppins(
                              color: Color(0xFFABABAB),
                              fontSize: 16.spMin,
                              fontWeight: FontWeight.w300,
                            )),
                        10.h.verticalSpace,
                        Text(
                          controller.categoryDetail.gender
                              .toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text("Activities",
                            style: GoogleFonts.poppins(
                              color: Color(0xFF0C1A30),
                              fontSize: 20.spMin,
                              fontWeight: FontWeight.w600,
                            )),
                        if (controller.isLoading.value)
                          Center(
                            child: SpinKitDoubleBounce(
                              color: Colors.orange,
                            ),
                          )
                        else
                          Column(
                            children: [
                              for (var activity
                              in controller.categoryDetail.activities!)
                                MyGridView(
                                    imagePath: activity.image.toString(),
                                    name: activity.name.toString(),
                                    activities_length: controller.categoryDetail.activities!.length),
                            ],
                          )
                      ],
                    ),
                  ),

                ]),
          ),
        ),
      ),
    );
  }
}

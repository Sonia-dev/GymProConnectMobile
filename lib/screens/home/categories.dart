import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/categories_controller.dart';
import 'package:gymproconnect_flutter/screens/home/planning.dart';

import '../../data/controllers/activities_controller.dart';
import '../../routes/routes_helper.dart';
import 'Profil.dart';
import 'abonnement.dart';
import 'detailed_activity.dart';
import 'filtre.dart';
import 'main_home.dart';

class CategoriesList extends GetView<CategoriesController> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Categories',
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                      onChanged: (value) {
                        searchText = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 12),
                        floatingLabelStyle: GoogleFonts.poppins(
                          color: Color(0xFFB7C4E0),
                          fontSize: 11.spMin,
                          fontWeight: FontWeight.w400,
                        ),
                        labelText: 'Search',
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
                                width: 1, color: Color(0xFFf34e3a))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white)),
                      )),
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
            child: ListView.builder(
              itemCount: Get.find<CategoriesController>().categoriesList.length,
              itemBuilder: (BuildContext context, int index) {
                final category =
                Get.find<CategoriesController>().categoriesList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        RouteHelper.categorieById,
                      );

                      Get.find<ActivitiesController>()
                          .getActivityByID(category.id!);
                    },
                    child: Container(
                      height: 200,
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              category.image??"",
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: Image.asset(
                                    "assets/no_image.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress?.expectedTotalBytes ==
                                    loadingProgress?.cumulativeBytesLoaded) {
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
                                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        category.name.toString(),
                                        style: GoogleFonts.poppins(
                                          color: Color(0xFFf34e3a),
                                          fontSize: 12.spMax,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        category.description.toString(),
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 12.spMax,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
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
            ),
          ),
        ]),
      ),

    );
  }
}

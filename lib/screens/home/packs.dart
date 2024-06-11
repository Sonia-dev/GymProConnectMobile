import 'dart:async';
import 'dart:ffi';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/filter_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/packs_controller.dart';
import 'package:gymproconnect_flutter/screens/home/planning.dart';

import '../../routes/routes_helper.dart';
import 'abonnement.dart';
import 'filter_pack.dart';
import 'filtre.dart';
import 'main_home.dart';

class PackList extends GetView<PacksController> {

  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Packs',
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
                        //   controller.getFindByName(value);
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 12),
                        floatingLabelStyle:
                        const TextStyle(color: Colors.black),
                        labelText: 'Search',
                        suffixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Color(0xffF7F9FD),
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white)),
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

                  controller.showPrice.value = !controller.showPrice.value;

                  controller.update();
                },
              ),
            ],
          ),

        Obx(() => controller.showPrice.value?FadeInUp(
            child: Column(

              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Price Range",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Obx(() => SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: RangeSlider(
                    values: Get.find<FilterController>().selectedPriceRange.value,
                    min: Get.find<FilterController>().priceMin,
                    max: Get.find<FilterController>().priceMax,
                    divisions: 30,

                    labels: RangeLabels(
                      Get.find<FilterController>().selectedPriceRange.value.start.round().toString(),
                      Get.find<FilterController>().selectedPriceRange.value.end.round().toString(),
                    ),
                    activeColor: Color(0xFFF34E3A),
                    onChanged: (RangeValues values) {
                      Get.find<FilterController>().selectedPriceRange.value = values;
                      print('the selectedPriceRange is ${Get.find<FilterController>().selectedPriceRange.value}');
                      Get.find<FilterController>().priceMinToSend = Get.find<FilterController>().selectedPriceRange.value.start;
                      Get.find<FilterController>().priceMaxToSend = Get.find<FilterController>().selectedPriceRange.value.end;

                      // Utilisez Timer pour définir un délai avant d'appeler l'API
                      Timer(Duration(seconds: 1), () async {
                        await Get.find<PacksController>().getPacks(
                          //   filters: RequestFilter(
                          // minPrice: controller.priceMinToSend,
                          // maxPrice: controller.priceMaxToSend,
                          // categoryName: controller.selectedCategory.value,
                          // gender: controller.selectedGender.value,
                          // target: controller.selectedTarget.value,
                          //   )
                        );
                        print('priceMinToSend ${Get.find<FilterController>().priceMinToSend}');
                        print('priceMaxToSend ${Get.find<FilterController>().priceMaxToSend}');
                      });
                    },
                  ),
                )),

              ],
            ),
          ):SizedBox.shrink()),

          10.h.verticalSpace,
          Expanded(
            child: ListView.builder(
              itemCount: Get.find<PacksController>().packsList.length,
              itemBuilder: (BuildContext context, int index) {
                final pack = Get.find<PacksController>().packsList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                onTap: () {
                Get.toNamed(RouteHelper.getPackById());

                Get.find<PacksController>()
                    .getPackByID(pack.id!);
                },
                  child: Container(
                    height: 150,
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child:  Image.network(
                              pack.image.toString(),
                              width: double.infinity,
                              height: 150,
                              fit:  BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return SizedBox(child: Image.asset("assets/no_image.jpg"));
                              },
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress?.expectedTotalBytes ==
                                    loadingProgress?.cumulativeBytesLoaded) {
                                  return child;
                                }
                                return const CircularProgressIndicator();
                              },
                            )
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                padding: EdgeInsets.only(left: 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pack.name.toString(),
                                      style:  GoogleFonts.poppins(
                                        color: Color(0xFFF34E3A),
                                        fontSize: 12.spMax,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              Text(
                                "${pack.price.toString()} dt",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18.spMax,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
              },
            ),
          ),
        ]),
      ),
      );
  }
}

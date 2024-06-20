import 'dart:async';
import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/filter_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/packs_controller.dart';
import 'package:gymproconnect_flutter/routes/routes_helper.dart';
import 'package:gymproconnect_flutter/screens/agent/PackDetailAgent.dart';
import 'package:gymproconnect_flutter/screens/home/detailed_pack.dart';
import 'package:lottie/lottie.dart';

class PackList extends GetView<PacksController> {
  @override
  Widget build(BuildContext context) {
    var role =  GetStorage().read('userRole');

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
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(

          onRefresh: () async {
            await controller.getPacks();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        onChanged: (value) {
                          controller.filterPacks(value);

                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                          floatingLabelStyle:  GoogleFonts.poppins(color: Colors.black),
                          labelText: 'Nom du pack',
                          suffixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Color(0xffF7F9FD),
                          labelStyle: GoogleFonts.poppins(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(width: 1, color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                      ),
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
              Obx(() => controller.showPrice.value
                  ? FadeInUp(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Plage de prix",
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
                          controller.filterByPriceRange(values.start, values.end);
                          Get.find<FilterController>().selectedPriceRange.value = values;
                          Get.find<FilterController>().priceMinToSend = values.start;
                          Get.find<FilterController>().priceMaxToSend = values.end;
                          controller.filterByPriceRange(values.start, values.end);

                          // Timer(Duration(seconds: 1), () async {
                          //   await controller.getPacks();
                          // });
                        },
                      ),
                    )),

                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' ${Get.find<FilterController>().selectedPriceRange.value.start.round()} dt',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '${Get.find<FilterController>().selectedPriceRange.value.end.round()} dt',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              )
                  : SizedBox.shrink()),
              10.h.verticalSpace,
              Expanded(
                child: Obx(() {
                  return controller.filteredPacksList.isEmpty
                      ? Column(
                    children: [
                      Lottie.asset('assets/lotties/no_activity_found.json'),
                      Text('Pas du pack '),
                    ],
                  )
                      : ListView.builder(
                    itemCount: controller.filteredPacksList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final pack = controller.filteredPacksList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                          onTap: () async{
                            if (role == "adherent") {


                              await controller.getPackByID(pack.id!);
                              Get.to(PackDetail());
                            }
                            else  if (role == "agent") {
                              await controller.getPackByID(pack.id!);
                              Get.to(PackDetailAgent());

                            };
                          },
                          child: Container(
                            height: 150,
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                      "http://192.168.1.199:8000/${pack.image.toString()}",

                                    width: double.infinity,
                                    height: 150,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return SizedBox(child: Image.asset("assets/no_image.jpg"));
                                    },
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress?.expectedTotalBytes == loadingProgress?.cumulativeBytesLoaded) {
                                        return child;
                                      }
                                      return const Center(child: SpinKitDoubleBounce(
                                        color: Colors.orange,
                                        size: 12,
                                      ));
                                    },
                                  ),
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
                                              style: GoogleFonts.poppins(
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
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

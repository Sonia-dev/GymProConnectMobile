import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/controllers/filter_controller.dart';






class Filtre extends GetView<FilterController> {
  Filtre({super.key});




    @override
    Widget build(BuildContext context) {


      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Filtre',
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
        body: GetBuilder<FilterController>(builder: (controller) {
          return Obx(() => controller.isLoading.value
              ? const Center(
            child: SpinKitDoubleBounce(
              color: Colors.orange,
            ),
          )
              : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
               key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Category",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 40.0,
                      child: (controller.categories == null)
                          ? Container()
                          : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories!.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          final category = index == 0 ? "All" : controller.categories![index - 1];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child:Obx(() =>  FilterChip(
                              label: Text(category),
                              selected: controller.selectedCategory.value == category,
                              onSelected: (bool selected) {

                                controller.selectedCategory.value = selected ? category : "";
                                  if (category != "All") {
                                    controller.selectedCategory.value = category;
                                  }

                              },
                              selectedColor: category == "All" ? Colors.red : Color(0xFFF34E3A),
                              showCheckmark: false,
                            )),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Price Range",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                   SizedBox(height: 5),
                    // RangeSlider(
                    //   values: controller.selectedPriceRange,
                    //   min: priceMin,
                    //   max: priceMax,
                    //   divisions: 30,
                    //   labels: RangeLabels(
                    //     controller.selectedPriceRange.start.round().toString(),
                    //     controller.selectedPriceRange.end.round().toString(),
                    //   ),
                    //   activeColor: Color(0xFFF34E3A),
                    //   onChanged: (RangeValues values) {
                    //     setState(() {
                    //       _selectedPriceRange = values;
                    //     });
                    //   },
                    // ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 40.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.genders.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          final gender = index == 0 ? "Mixed" : controller.genders[index - 1];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Obx(() =>FilterChip(
                              label: Text(gender),
                              selected: controller.selectedGender == gender,
                              onSelected: (bool selected) {

                                  controller.selectedGender.value = selected ? gender : "";
                                  if (gender != "Mixed") {
                                    controller.selectedGender.value = gender;
                                  }

                              },
                              selectedColor: gender == "Mixed" ? Colors.red : Color(0xFFF34E3A),
                              showCheckmark: false,
                            ),)
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Target",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 40.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.targets.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          final target = index == 0 ? "All" : controller.targets[index - 1];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child:Obx(() => FilterChip(
                              label: Text(target),
                              selected: controller.selectedTarget.value == target,
                              onSelected: (bool selected) {

                                  controller.selectedTarget.value = selected ? target : "";
                                  if (target != "All") {
                                    controller.selectedTarget.value = target;
                                  }

                              },
                              selectedColor: target == "All" ? Colors.red : Color(0xFFF34E3A),
                              showCheckmark: false,
                            ),)
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 250.h),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFF34E3A),
                                minimumSize: Size(285, 49),
                              ),
                              onPressed: () async {

                              },
                              child: Text(
                                'Apply',
                                style: TextStyle(fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
        }),
      );
    }
  }







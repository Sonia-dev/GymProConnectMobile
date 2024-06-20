
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/models/request_filter.dart';
import 'package:gymproconnect_flutter/routes/routes_helper.dart';
import '../../data/controllers/activities_controller.dart';
import '../../data/controllers/filter_controller.dart';
import 'package:animate_do/animate_do.dart';


class FiltrePack extends GetView<FilterController> {
  FiltrePack({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Filtre',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          leading: Container(
            width: 10.w,
            height: 10.h,
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
          )


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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                /*                   Align(
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
              Obx(() => RangeSlider(
                    values: controller.selectedPriceRange.value,
                    min: controller.priceMin,
                    max: controller.priceMax,
                    divisions: 30,
                    labels: RangeLabels(
                      controller.selectedPriceRange.value.start.round().toString(),
                      controller.selectedPriceRange.value.end.round().toString(),
                    ),
                    activeColor: Color(0xFFF34E3A),
                    onChanged: (RangeValues values) {

                        controller.selectedPriceRange.value = values;
                        print('the selectedPriceRange is ${ controller.selectedPriceRange.value} ');
                             controller.priceMinToSend = controller.selectedPriceRange.value.start;

                        controller.priceMaxToSend= controller.selectedPriceRange.value.end;

                        print('priceMinToSend ${controller.priceMinToSend}');
                        print('priceMaxToSend ${controller.priceMaxToSend}');
                    },
                  )),*/


                Obx(() => controller.showOtherFilters.value?    FadeInUp(
                  child: Column(children: [


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
                        itemCount: controller.genders.length,
                        itemBuilder: (BuildContext context, int index) {
                          final gender = controller.genders[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Obx(() => FilterChip(
                              label: Text(
                                gender,
                                style:  GoogleFonts.poppins(
                                    color: controller.selectedGender.value == gender ? Colors.white : Colors.black
                                ),
                              ),
                              selected: controller.selectedGender.value == gender,
                              onSelected: (bool selected) {
                                controller.selectedGender.value = selected ? gender : "";
                                print('the selectedGender is ${controller.selectedGender.value}');
                              },
                              selectedColor: Color(0xFFF34E3A),
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
                        itemCount: controller.targets.length,
                        itemBuilder: (BuildContext context, int index) {
                          final target = controller.targets[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Obx(() => FilterChip(
                              label: Text(
                                target,
                                style: TextStyle(
                                    color: controller.selectedTarget.value == target ? Colors.white : Colors.black
                                ),
                              ),
                              selected: controller.selectedTarget.value == target,
                              onSelected: (bool selected) {
                                controller.selectedTarget.value = selected ? target : "";
                                print('the selectedTarget is ${controller.selectedTarget.value}');
                              },
                              selectedColor: Color(0xFFF34E3A),
                              showCheckmark: false,
                            )),
                          );
                        },
                      ),
                    )




                  ],),
                ):SizedBox.shrink())
                /*                 SizedBox(height: 30.h),
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
                            label: Text(gender,style: TextStyle(color:controller.selectedGender.value == gender ?Colors.white:Colors.black),),
                            selected: controller.selectedGender == gender,
                            onSelected: (bool selected) {

                                controller.selectedGender.value = selected ? gender : "";
                                if (gender != "Mixed") {
                                  controller.selectedGender.value = gender;
                                }
                                print('the selectedGender is ${ controller.selectedGender.value} ');

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
                            label: Text(target ,style: TextStyle(color:controller.selectedTarget.value == target ?Colors.white:Colors.black)),
                            selected: controller.selectedTarget.value == target,
                            onSelected: (bool selected) {

                                controller.selectedTarget.value = selected ? target : "";
                                if (target != "All") {
                                  controller.selectedTarget.value = target;
                                }

                                print('the selectedTarget is ${ controller.selectedTarget.value} ');

                            },
                            selectedColor: target == "All" ? Colors.red : Color(0xFFF34E3A),
                            showCheckmark: false,
                          ),)
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 150.h),*/
                ,SizedBox(height: 80.h)

                , ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF34E3A),
                    minimumSize: Size(MediaQuery.of(context).size.width, 49),
                  ),
                  onPressed: () async {

                    await Get.find<ActivitiesController>().getActivities(filters: RequestFilter(
                        minPrice: controller.priceMinToSend,
                        maxPrice:controller.priceMaxToSend,
                        categoryName: controller.selectedCategory.value,
                        gender:controller.selectedGender.value,
                        target: controller.selectedTarget.value));

                    Get.offNamed(RouteHelper.getActivities());
                  },
                  child: Text(
                    'Apply',
                    style:  GoogleFonts.poppins(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
      }),
    );
  }
}







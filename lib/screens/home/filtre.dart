
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


class Filtre extends GetView<FilterController> {
  Filtre({super.key});

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
              : Stack(
                children: [
                  SingleChildScrollView(
                              child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                        child: (controller.categories == null)
                            ? Container()
                            : Obx(() {
                          int displayLimit = 15;
                          bool showSeeMore = (controller.categories!.length + 1) > displayLimit;

                          return Wrap(
                            spacing: 5.0,
                            children: [
                              ...List.generate(
                                (showSeeMore && !controller.showAllCategories.value)
                                    ? displayLimit
                                    : controller.categories!.length,
                                    (int index) {
                                  if (index < controller.categories!.length) {
                                    final category = controller.categories![index];
                                    return Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                                      child: FilterChip(
                                        backgroundColor:  Colors.white,

                                        label: Text(
                                          category,
                                          style: GoogleFonts.poppins(
                                            color: controller.selectedCategory.value == category ? Colors.white : Colors.black,
                                          ),
                                        ),
                                        selected: controller.selectedCategory.value == category,
                                        onSelected: (bool selected) {
                                          if (selected) {
                                            controller.selectedCategory.value = category;
                                            controller.showOtherFilters.value = true;
                                          } else {
                                            controller.selectedCategory.value = "";
                                            controller.showOtherFilters.value = false;
                                          }

                                          print('The selected category is ${controller.selectedCategory.value}');
                                        },
                                        selectedColor: Color(0xFFF34E3A),
                                        showCheckmark: false,
                                      ),
                                    );
                                  } else {
                                    return Container(); // Retourne un widget vide pour éviter une erreur si l'index dépasse la longueur de la liste
                                  }
                                },
                              ),
                              if (showSeeMore)
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20),
                                  child: InkWell(
                                    onTap: () {
                                      controller.showAllCategories.value = !controller.showAllCategories.value;
                                    },
                                    child: Text(
                                      controller.showAllCategories.value ? 'Voir moins' : 'Voir plus',
                                      style: GoogleFonts.poppins(
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.orange,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        })

                      )
                  ,

                               FadeInUp(
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
                                    backgroundColor:  Colors.white,
                                    label: Text(
                                      gender,
                                      style: GoogleFonts.poppins(
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
                                    backgroundColor:  Colors.white,
                                    label: Text(
                                      target,
                                      style: GoogleFonts.poppins(
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
                      )
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
                          'Appliquer',
                          style: GoogleFonts.poppins(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                              ),
                            ),

                  Obx(() {
                    return Get.find<ActivitiesController>().isLoading.value
                        ? Container(
                      color: Colors.black.withOpacity(0.5), // Couleur de l'arrière-plan semi-transparente
                      child: Center(
                        child: CircularProgressIndicator(), // Vous pouvez personnaliser le chargeur comme vous le souhaitez
                      ),
                    )
                        : SizedBox.shrink(); // Retourne un conteneur vide si le chargement est terminé
                  }),
                ],
              ));
        }),
      );
    }
  }







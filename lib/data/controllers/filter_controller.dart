import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gymproconnect_flutter/data/repository/filter_repo.dart';

import '../../models/info_model.dart';
import '../../models/profil_model.dart';
import '../../models/update_user_model.dart';
import '../../snack_bar.dart';
import '../repository/profil_repo.dart';

class FilterController extends GetxController {
  final FilterRepo filterRepo;
  RxBool isLoading =false.obs;
  infoModel info = infoModel();

  RxString selectedCategory = "All".obs;
  RxString selectedGender = "Mixed".obs;
  RxString selectedTarget = "All".obs;

  final formKey = GlobalKey<FormState>();
  RangeValues selectedPriceRange = RangeValues(0, 500);
  RxList<String> categories  =<String>[].obs;
  RxList<String> genders  =<String>[].obs;
  RxList<String> targets  =<String>[].obs;
  FilterController({required this.filterRepo});


  @override
  void onReady() {
    getinfoFilter();
    super.onReady();
  }

  @override
  void onInit() {
    getinfoFilter();
    super.onInit();
  }


  Future<void> getinfoFilter() async {
    isLoading.value = true;
    Response response = await filterRepo.getinfoFilter();


    if (response.statusCode == 200) {
      isLoading.value = false;

      info = infoModel.fromJson(response.body);


      categories.value = info.category??[];
      genders.value = info.gender??[];
      targets.value = info.target??[];
   /*
      final priceMinStr = Get.find<FilterController>().info.prices?.min ?? "0.0";
      final priceMaxStr = Get.find<FilterController>().info.prices?.max ?? "500.0";*/

    /*  double priceMin = double.tryParse(priceMinStr) ?? 0.0;
      double priceMax = double.tryParse(priceMaxStr) ?? 500.0;
*/
     // _selectedPriceRange = RangeValues(priceMin, priceMax);



    } else {
      print(response.body);
      isLoading.value = false;
      print("Erreur lors de la récupération de liste de filter.");
    }
  }

}
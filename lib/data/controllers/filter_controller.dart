import 'dart:convert';
import 'dart:ffi';

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

  RxString selectedCategory = "".obs;
  RxString selectedGender = "".obs;
  RxString selectedTarget = "".obs;
  double priceMin= 0.0;
  double priceMax= 500.0;

  double? priceMinToSend ;
  double? priceMaxToSend ;
  RxBool showAllCategories = false.obs;
  final formKey = GlobalKey<FormState>();

  RxBool showOtherFilters = false.obs;


  Rx<RangeValues>selectedPriceRange = RangeValues(0, 500).obs;
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

      final priceMinStr =info.prices?.min ?? "0.0";
      final priceMaxStr =info.prices?.max ?? "500.0";

       priceMin = double.tryParse(priceMinStr)??0.0 ;
       priceMax = double.tryParse(priceMaxStr) ?? 500.0;

     selectedPriceRange.value = RangeValues(priceMin, priceMax);



    } else {
      print(response.body);
      isLoading.value = false;
      print("Erreur lors de la récupération de liste de filter.");
    }
  }

}
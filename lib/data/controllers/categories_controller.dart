import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';
import 'package:gymproconnect_flutter/models/activities_model.dart';
import 'package:gymproconnect_flutter/models/categories_model.dart';


class CategoriesController extends GetxController {
  final CategoriesRepo categoriesRepo;

  CategoriesController({required this.categoriesRepo});

  RxBool isLoading =false.obs;
  RxList<CategoryData> categoriesList = <CategoryData>[].obs;
  CategoryData categoryDetail = CategoryData();


  @override
  void onReady() {
    getCategories();
    super.onReady();
  }




  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    isLoading.value=true;
    Response response = await categoriesRepo.getCategoriesList();


    if (response.statusCode == 200) {
      isLoading.value =false;
      List<dynamic> responseData = response.body["data"]["data"];
    categoriesList.value = responseData.map((data) => CategoryData.fromJson(data)).cast<CategoryData>().toList();
    update();


      } else {
        print("Erreur lors de la récupération des données de catégorie.");
      }
    }



 Future<void> getCategorieByID(int categoryId) async {
    isLoading.value =true;
    Response response = await categoriesRepo.getCategoryById(categoryId);


    if (response.statusCode == 200) {
      isLoading.value=false;

      categoryDetail = CategoryData.fromJson(response.body['data']);


    } else {
      isLoading.value=false;
      print("Erreur lors de la récupération des données de catégorie.");
    }
  }


  }

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

  RxBool isLoading = false.obs;
  RxList<CategoryData> categoriesList = <CategoryData>[].obs;
  CategoryData categoryDetail = CategoryData();

  @override
  void onReady() {
    getCategories();
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getCategories() async {
    isLoading.value = true;
    try {
      Response response = await categoriesRepo.getCategoriesList();
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.body["data"]["data"];
        categoriesList.value = responseData.map((data) => CategoryData.fromJson(data)).toList();
        print("categories list : $categoriesList");
      } else {
        print("Erreur lors de la récupération des données de catégorie.");
      }
    } catch (e, st) {
      print("Exception lors de la récupération des catégories: $e");
      print(st);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCategorieByID(int categoryId) async {
    isLoading.value = true;
    try {
      Response response = await categoriesRepo.getCategoryById(categoryId);
      if (response.statusCode == 200) {
        categoryDetail = CategoryData.fromJson(response.body['data']);
      } else {
        print("Erreur lors de la récupération des données de catégorie.");
      }
    } catch (e, st) {
      print("Exception lors de la récupération de la catégorie par ID: $e");
      print(st);
    } finally {
      isLoading.value = false;
    }
  }
}

import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';
import 'package:gymproconnect_flutter/models/activities_model.dart';
import 'package:gymproconnect_flutter/models/categories_model.dart';


class CategoriesController extends GetxController {
  final CategoriesRepo categoriesRepo;
bool isLoading=false;
  CategoriesController({required this.categoriesRepo});

  RxList<CategoryData> categoriesList = <CategoryData>[].obs;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    isLoading=true;
    Response response = await categoriesRepo.getCategoriesList();


    if (response.statusCode == 200) {
      isLoading=false;
      List<dynamic> responseData = response.body["data"]["data"];
    categoriesList.value = responseData.map((data) => CategoryData.fromJson(data)).cast<CategoryData>().toList();
    update();


      } else {
        print("Erreur lors de la récupération des données de catégorie.");
      }
    }
  }

import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';
import 'package:gymproconnect_flutter/models/categories_model.dart';


class CategoriesController extends GetxController {
  final CategoriesRepo categoriesRepo;
 CategoriesController({required this.categoriesRepo});
  RxList<dynamic> categories= <dynamic>[].obs;
  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
  Future getCategories() async {
    Response response = await categoriesRepo.getCategoriesList();
    if (response.statusCode == 200) {
      print("body ${response.body}");
      categories.value= response.body.map((json) => category.fromJson(json)).toList();
      print("categories ${categories}");
    }
  }
}
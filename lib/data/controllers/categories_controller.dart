import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/categories_model.dart';
import '../repository/categories_repo.dart';

class CategoriesController extends GetxController {
  final CategoriesRepo categoriesRepo;

  CategoriesController({required this.categoriesRepo});

  RxBool isLoading = false.obs;
  RxList<CategoryData> categoriesList = <CategoryData>[].obs;
  RxList<CategoryData> filteredCategoriesList = <CategoryData>[].obs; // Nouvelle liste filtrée

  CategoryData categoryDetail = CategoryData();

  @override
  void onReady() {
    getCategories();
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    filteredCategoriesList.bindStream(categoriesList.stream); // Lier la liste filtrée à la liste complète au début
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

  // Méthode de filtrage pour mettre à jour la liste des catégories filtrées
  void filterCategories(String searchText) {
    if (searchText.isEmpty) {
      filteredCategoriesList.value = categoriesList; // Si la recherche est vide, afficher la liste complète
    } else {
      filteredCategoriesList.value = categoriesList.where((category) {
        return category.name!.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
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

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../models/activities_model.dart';
import '../../models/categories_model.dart';
import '../../models/filter_model.dart';
import '../../models/info_model.dart';
import '../../models/request_filter.dart';
import '../../models/review_model.dart';
import '../../models/reviews_model.dart';
import '../../snack_bar.dart';
import '../repository/activities_repo.dart';

class ActivitiesController extends GetxController {
  final ActivitiesRepo activitiesRepo;

  ActivitiesController({required this.activitiesRepo});

  RxBool isLoading = false.obs;
  ActivityData activityDetails = ActivityData();
  RxList<ActivityData> activitiesList = <ActivityData>[].obs;
  RxList<ActivityData> coachActivitiesList = <ActivityData>[].obs;
  RxList<ActivityData> filterList = <ActivityData>[].obs;
  RxList<Reviews> reviewsList = <Reviews>[].obs;
  RxList<ActivityData> filteredActivityList = <ActivityData>[].obs; // Nouvelle liste filtrée


  final TextEditingController commentController = TextEditingController();
  double ratingController = 0.0 ;
  Set<int> addedActivityIds = Set<int>();





  infoModel info = infoModel();

  RxString selectedCategory = "All".obs;
  RxString selectedGender = "Mixed".obs;
  RxString selectedTarget = "All".obs;
  double priceMin= 0.0;
  double priceMax= 500.0;

  final formKey = GlobalKey<FormState>();
  RangeValues selectedPriceRange = RangeValues(0, 500);
  RxList<String> categories  =<String>[].obs;
  RxList<String> genders  =<String>[].obs;
  RxList<String> targets  =<String>[].obs;

  @override
  void onReady() {
    getActivities();
    super.onReady();
  }

  @override
  void onInit() {
    getActivities();
    super.onInit();
  }

  Future<void> getActivities({RequestFilter? filters}) async {
    isLoading.value = true;
    Response response = await activitiesRepo.getActivityList(filters: filters?.toJson()??{});

    print("response.body: ${response.body}");
    print("statuscode: ${response.statusCode}");

    if (response.statusCode == 200) {
      isLoading.value = false;
      List<dynamic> responseData = response.body["activities"];
      activitiesList.clear();
      addedActivityIds.clear();

      responseData.forEach((data) {
        ActivityData activity = ActivityData.fromJson(data);
        if (!addedActivityIds.contains(activity.id)) {
          activitiesList.add(activity);
          addedActivityIds.add(activity.id!);
        }
      });

      print("activities list: $activitiesList");
      update();
    } else {
      isLoading.value = false;
      print("not okkk");
    }
  }


  Future<void> getActivityByID(int ActivityId) async {
    isLoading.value = true;
    Response response = await activitiesRepo.getActivityById(ActivityId);

    if (response.statusCode == 200) {
      isLoading.value = false;
      activityDetails = ActivityData.fromJson(response.body);
    } else {
      isLoading.value = false;
      print("Erreur lors de la récupération des données d'activitie.");
    }
  }


  void resetFields() {
    commentController.clear();
    ratingController = 0.0;
  }

  Map<String, String> getFilters() {
    final filters = <String, String>{};

    if (selectedCategory.value.isNotEmpty && selectedCategory.value != 'All') {
      filters['category'] = selectedCategory.value;
    }

    filters['price_min'] = selectedPriceRange.start.toString();
    filters['price_max'] = selectedPriceRange.end.toString();

    if (selectedGender.value.isNotEmpty && selectedGender.value != 'Mixed') {
      filters['gender'] = selectedGender.value;
    }

    if (selectedTarget.value.isNotEmpty && selectedTarget.value != 'All') {
      filters['target'] = selectedTarget.value;
    }

    return filters;
  }
  void filterActivities(String searchText) {
    if (searchText.isEmpty) {
      filteredActivityList.value = activitiesList; // Si la recherche est vide, afficher la liste complète
    } else {
      filteredActivityList.value = activitiesList.where((activity) {
        return activity.name!.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    }
  }



  Future<void> reviews(ReviewRequest reviewRequest, BuildContext context,int ActivityId) async {
    Map<String, dynamic> data = {
      "rating": reviewRequest.rating,
      "comment": reviewRequest.comment,
    };
    try {
      Response response = await activitiesRepo.review(ActivityId,data);

      if (response.statusCode == 200) {
        SnackBarMessage()
            .showSuccessSnackBar(message: "Your review has been added. Thank you!", context: context);

      }


      else  {
        SnackBarMessage()
            .showSuccessSnackBar(message: "We're sorry, an unexpected error has occurred.",context: context);
        ;
      }

    }
    catch (e, s) {
      print("Erreur : $e");
      print("StackTrace : $s");
      // print("$test");
    }
  }


  Future getReviews(int activityId) async {

    print("tesssssst");

    isLoading.value = true;
    Response response = await activitiesRepo.reviews(activityId);

    if (response.statusCode == 200) {
      isLoading.value = false;

      List<dynamic> responseData = response.body["reviews"];
      print("tesssssst");


      reviewsList.value = responseData.map((data) => Reviews.fromJson(data)).cast<Reviews>().toList();

      print("reviewsList$reviewsList");


      update();
    } else {
      isLoading.value = false;
      print("not okkk");
    }
  }


  Future<void> getinfoFilter() async {
    isLoading.value = true;
    Response response = await activitiesRepo.getinfoFilter();


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

      selectedPriceRange = RangeValues(priceMin, priceMax);



    } else {
      print(response.body);
      isLoading.value = false;
      print("Erreur lors de la récupération de liste de filter.");
    }
  }





}

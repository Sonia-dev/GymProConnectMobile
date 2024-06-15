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

class ActivitiesController extends GetxController with   GetTickerProviderStateMixin {
  final ActivitiesRepo activitiesRepo;

  ActivitiesController({required this.activitiesRepo});

  RxBool isLoading = false.obs;

  RxBool loading = false.obs;


  ActivityData activityDetails = ActivityData();
  RxList<ActivityData> activitiesList = <ActivityData>[].obs;
  RxList<ActivityData> coachActivitiesList = <ActivityData>[].obs;
  RxList<ActivityData> filterList = <ActivityData>[].obs;
  RxList<Reviews> reviewsList = <Reviews>[].obs;
  RxList<ActivityData> filteredActivityList = <ActivityData>[].obs;


  final TextEditingController commentController = TextEditingController();
  double ratingController = 0.0 ;
  Set<int> addedActivityIds = Set<int>();

  TabController? tabController;



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
    tabController = new TabController( length: 2, vsync: this);
    super.onReady();
  }

  @override
  void onInit() {
    getActivities();
    tabController = new TabController( length: 2, vsync: this);
    super.onInit();
  }


  @override
  void onClose() {

    tabController?.dispose();

  }

  @override
  void dispose() {
    super.dispose();
   tabController?.dispose();
  }


  Future<void> getActivities({RequestFilter? filters}) async {
    isLoading.value = true;
    Response response = await activitiesRepo.getActivityList(filters: filters?.toJson() ?? {});

    if (response.statusCode == 200) {
      List<dynamic> responseData = response.body["activities"];
      isLoading.value = false;
      activitiesList.clear();
      filteredActivityList.clear();

      responseData.forEach((data) {
        ActivityData activity = ActivityData.fromJson(data);
        activitiesList.add(activity);
      });

      filteredActivityList.value = activitiesList;
    } else {
      isLoading.value = false;
    }
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


  Future<void> getActivityByID(int ActivityId) async {
    isLoading.value = true;
    Response response = await activitiesRepo.getActivityById(ActivityId);

    if (response.statusCode == 200) {
      activityDetails = ActivityData.fromJson(response.body);

      isLoading.value = false;
      update();

    } else {
      isLoading.value = false;
      print("Erreur lors de la récupération des données d'activitie.");
    }
    update();
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



  Future<void> reviews(ReviewRequest reviewRequest, BuildContext context,int ActivityId) async {
    Map<String, dynamic> data = {
      "rating": reviewRequest.rating,
      "comment": reviewRequest.comment,
    };
    try {
      Response response = await activitiesRepo.review(ActivityId,data);
    loading.value = true;

      if (response.statusCode == 200 || response.statusCode == 201) {
      loading.value = false;

       // SnackBarMessage()
          //  .showSuccessSnackBar(message: "Votre avis a été ajouté. Merci !", context: context);
        update();
        tabController?.index = 2;
      }


      else  {
       loading.value = false;

        SnackBarMessage()
            .showErrorSnackBar(message: "Nous sommes désolés, une erreur inattendue s'est produite.",context: context);
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

    loading.value = true;
    Response response = await activitiesRepo.reviews(activityId);

    if (response.statusCode == 200) {
      loading.value = false;

      List<dynamic> responseData = response.body["reviews"];
      print("tesssssst");


      reviewsList.value = responseData.map((data) => Reviews.fromJson(data)).cast<Reviews>().toList();

      print("reviewsList$reviewsList");

      update();


    } else {
      loading.value = false;
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

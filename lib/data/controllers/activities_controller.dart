import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../models/activities_model.dart';
import '../../models/categories_model.dart';
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
  final TextEditingController commentController = TextEditingController();
  double ratingController = 0.0 ;


  // Ensemble pour stocker les ID des activités déjà ajoutées
  Set<int> addedActivityIds = Set<int>();

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

  Future getActivities() async {
    isLoading.value = true;
    Response response = await activitiesRepo.getActivityList();
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {
      isLoading.value = false;

      List<dynamic> responseData = response.body["activities"];

      // Effacer la liste actuelle des activités
      activitiesList.clear();
      // Réinitialiser l'ensemble des ID des activités ajoutées
      addedActivityIds.clear();

      // Parcourir les données de réponse et ajouter les activités à la liste
      responseData.forEach((data) {
        ActivityData activity = ActivityData.fromJson(data);
        // Vérifier si l'ID de l'activité n'est pas déjà dans la liste
        if (!addedActivityIds.contains(activity.id)) {
          activitiesList.add(activity);
          // Ajouter l'ID de l'activité à l'ensemble
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

  // Méthode pour filtrer les activités en fonction de la catégorie
  Future<void> filterActivitiesByCategory(CategoryData category) async {
    isLoading.value = true;
    if (category.activities != null) {
      filterList.assignAll(category.activities! as Iterable<ActivityData>);
    } else {
      filterList.clear();
    }
    isLoading.value = false;
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

  Future getfilterList(Data) async {
    isLoading.value=true;
    Response response = await activitiesRepo.getActivityList();
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {
      isLoading.value=false;
      List<dynamic> responseData = response.body["activities"];
      print("filter ok");
      print("filter list: $responseData");

      activitiesList.clear();
      addedActivityIds.clear();

      responseData.forEach((data) {
        ActivityData activity = ActivityData.fromJson(data);
        if (!addedActivityIds.contains(activity.id)) {
          activitiesList.add(activity);
          addedActivityIds.add(activity.id!);
        }
      });

      update();
    } else {
      isLoading.value =false;
      print("not okkk");
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
}

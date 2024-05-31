
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../models/activities_model.dart';
import '../repository/activities_repo.dart';

class ActivitiesController extends GetxController {
  final ActivitiesRepo activitiesRepo;

  ActivitiesController({required this.activitiesRepo});

  RxBool isLoading =false.obs;
  ActivityData activityDetails = ActivityData();
  RxList<ActivityData> activitiesList= <ActivityData>[].obs;
  RxList<ActivityData> coachActivitiesList= <ActivityData>[].obs;
  RxList<ActivityData> filterList= <ActivityData>[].obs;


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
    isLoading.value=true;


    Response response = await activitiesRepo.getActivityList();
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {
      isLoading.value=false;

      //  print("*******body ${response.body["data"]["data"]}");

      List<dynamic> responseData = response.body["activities"];
      activitiesList.value = responseData.map((data) => ActivityData.fromJson(data)).cast<ActivityData>().toList();
      print("activities list: $activitiesList");

      update();
    }
    else
      {
        isLoading.value =false;

        print("not okkk");
      }
  }



  Future<void> getActivityByID(int ActivityId) async {
    isLoading.value =true;
    Response response = await activitiesRepo.getActivityById(ActivityId);


    if (response.statusCode == 200) {
      isLoading.value=false;

      activityDetails = ActivityData.fromJson(response.body);


    } else {
      isLoading.value=false;
      print("Erreur lors de la récupération des données d'activitie.");
    }
  }



  Future getfilterList(Data) async {
    isLoading.value=true;


    Response response = await activitiesRepo.getFilterList();
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {
      isLoading.value=false;

      //  print("*******body ${response.body["data"]["data"]}");

      List<dynamic> responseData = response.body["activities"];
      print("filter ok");
      print("filter list: $responseData");
      activitiesList.value = responseData.map((data) => ActivityData.fromJson(data)).cast<ActivityData>().toList();
      update();
    }
    else
    {
      isLoading.value =false;

      print("not okkk");
    }
  }
}
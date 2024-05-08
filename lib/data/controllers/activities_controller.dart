
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../models/activities_model.dart';
import '../repository/activities_repo.dart';

class ActivitiesController extends GetxController {
  final ActivitiesRepo activitiesRepo;

  ActivitiesController({required this.activitiesRepo});

  RxList<ActivityData> activitiesList= <ActivityData>[].obs;
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

    Response response = await activitiesRepo.getActivityList();
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {
    //  print("*******body ${response.body["data"]["data"]}");

      List<dynamic> responseData = response.body["data"]["data"];
      print("activities ok");
      activitiesList.value = responseData.map((data) => ActivityData.fromJson(data)).cast<ActivityData>().toList();
      update();
    }
    else
      {
        print("not okkk");
      }
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../home/detailed_activity.dart';
import '../../models/activities_model.dart';
import '../repository/activities_repo.dart';

class ActivitiesController extends GetxController {
  final ActivitiesRepo activitiesRepo;
  ActivitiesController({required this.activitiesRepo});
  RxList<dynamic> activities= <dynamic>[].obs;
  @override
  void onInit() {
    getActivities();
    super.onInit();
  }
  Future getActivities() async {
    Response response = await activitiesRepo.getActivityList();
    if (response.statusCode == 200) {
      print("body ${response.body}");
      activities.value = response.body.map((json) => Activitie.fromJson(json)).toList();
      print("activities ${activities}");
    }
  }
}
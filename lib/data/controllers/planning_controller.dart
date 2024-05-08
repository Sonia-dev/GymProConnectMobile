
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:gymproconnect_flutter/data/repository/planning_repo.dart';
import 'package:gymproconnect_flutter/models/planning__model.dart';
import '../../models/activities_model.dart';
import '../repository/activities_repo.dart';

class PlanningController extends GetxController {
  final PlanningRepo planningRepo;
  PlanningController({required this.planningRepo});
  RxList<Sessions> sessionList= <Sessions>[].obs;
  @override
  void onReady() {
    getPlanning();
    super.onReady();
  }



  @override
  void onInit() {
    getPlanning();
    super.onInit();
  }
  Future getPlanning() async {
    print("object");
    Response response = await planningRepo.getSessionsList();
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body); // Decode entire response

      if (responseBody is Map) {
        // Check if it's a map
        var sessions = responseBody["sessions"] as List<
            dynamic>; // Get sessions list

        if (sessions is List) {
          // Check if sessions is actually a list
          sessionList.value =
              sessions.cast<Sessions>(); // Cast to List<Sessions>
        } else {
          print("Error: Unexpected format for 'sessions'. Expected a list.");
        }
      }}}


}
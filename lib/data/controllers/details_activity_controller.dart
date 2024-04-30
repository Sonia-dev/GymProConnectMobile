import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gymproconnect_flutter/data/repository/details_activity_repo.dart';

import '../../models/details_activity_model.dart';

class ActivityDetailsController extends GetxController {
  final ActivityDetailsRepo activityDetailsRepo;
  ActivityDetailsController({required this.activityDetailsRepo});
  RxMap<dynamic, dynamic> activitiedetails = {}.obs;
  @override
  void onInit() {
    getActivityDetails();
    super.onInit();
  }
  Future getActivityDetails() async {
    Response response = await activityDetailsRepo.getActivityDetails();
    if (response.statusCode == 200) {
      print("body ${response.body}");
      activitiedetails.value = response.body.map((json) => ActivitiesDetails.fromJson(json));
      print("activities ${activitiedetails}");
    }
    else {
      print("not ooooooooooook");
    }
  }
}
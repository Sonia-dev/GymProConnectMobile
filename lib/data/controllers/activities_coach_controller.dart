import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/activities_model.dart';
import '../repository/activities_repo.dart';

class ActivitiesCoachController extends GetxController {
  final ActivitiesRepo activitiesRepo;

  ActivitiesCoachController({required this.activitiesRepo});

  RxBool isLoading = false.obs;
  ActivityData activityDetails = ActivityData();
  RxList<ActivityData> ActivitiescoachList = <ActivityData>[].obs;

  @override
  void onReady() {
    getCoachActivities();
    super.onReady();
  }




  @override
  void onInit() {
    getCoachActivities();
    super.onInit();
  }

  Future getCoachActivities() async {
    isLoading.value = true;
print("test");

    Response response = await activitiesRepo.getCoachActivity();
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {
      isLoading.value = false;


      List<dynamic> responseData = response.body["activities"];
      print(" coach activities ok");
      print("coach activities list: $responseData");
      ActivitiescoachList.value =
          responseData.map((data) => ActivityData.fromJson(data)).cast<
              ActivityData>().toList();
      update();
    }
    else {
      isLoading.value = false;

      print("not okkk");
    }
  }
}
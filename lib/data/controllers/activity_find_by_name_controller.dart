import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../models/activities_model.dart';
import '../repository/activities_repo.dart';
import '../repository/activity_find_by_name_repo.dart';

class ActFindByNameController extends GetxController {
  final ActFindByNameRepo actFindByNameRepo;

  ActFindByNameController({required this.actFindByNameRepo});

  RxList<dynamic> activities = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getFindByName(String name) async {
    Response response = await actFindByNameRepo.getFindByName(name);
    if (response.statusCode == 200) {
      print("body ${response.body}");
      activities.value =
          response.body.map((json) => ActivityData.fromJson(json)).toList();
      print("activities ${activities}");
    }
  }
}
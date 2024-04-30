import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/repository/trainers_repo.dart';

import '../../models/trainers_model.dart';

class TrainersController extends GetxController{
  final TrainersRepo trainersRepo ;
  TrainersController({required this.trainersRepo});

  RxList<dynamic> trainers= <dynamic>[].obs;
@override
void onInit() {
  getTrainers();
  super.onInit();
}
  Future getTrainers() async {
    Response response = await trainersRepo.getTrainersList();
    if (response.statusCode == 200) {
      print("sss");
      print("body ${response.body}");
      trainers.value = response.body.map((json) => coach.fromJson(json)).toList();
      print("activities ${trainers}");


    }
    else{      print("trainer echeec");
    print("statusCode ${response.statusCode}");
    }
  }
}
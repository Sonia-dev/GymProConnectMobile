import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';
import 'package:gymproconnect_flutter/data/repository/trainers_repo.dart';
import 'package:gymproconnect_flutter/models/activities_model.dart';
import 'package:gymproconnect_flutter/models/categories_model.dart';

import '../../models/trainers_model.dart';


class TrainersController extends GetxController {
  final TrainersRepo trainersRepo;

  TrainersController({required this.trainersRepo});

  RxBool isLoading =false.obs;
  RxList<TrainerDetail> trainersList = <TrainerDetail>[].obs;
  TrainerDetail trainerDetail = TrainerDetail();


  @override
  void onReady() {
    getTrainers();
    super.onReady();
  }




  @override
  void onInit() {
    getTrainers();
    super.onInit();
  }

  Future<void> getTrainers() async {
    isLoading.value=true;
    Response response = await trainersRepo.getTrainersList();


    if (response.statusCode == 200) {
      isLoading.value =false;
      List<dynamic> responseData = response.body["coaches"];
      print("responseData :$responseData");
      trainersList.value = responseData.map((data) => TrainerDetail.fromJson(data)).cast<TrainerDetail>().toList();



      print("trainers ok");
      print("body:${trainersList}");
      update();


    } else {
      isLoading.value =false;

      print("statuscode: ${response.statusCode}");
      print("Erreur lors de la récupération des données de trainer.");
    }
  }






  Future<void> getTrainerByID(int trainerId) async {
    isLoading.value =true;
    Response response = await trainersRepo.getTrainerById(trainerId);


    if (response.statusCode == 200) {
      isLoading.value=false;

      trainerDetail = TrainerDetail.fromJson(response.body['coaches']);


    } else {
      isLoading.value=false;
      print("Erreur lors de la récupération des données de coach.");
    }
  }


}

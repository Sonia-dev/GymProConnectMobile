
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:gymproconnect_flutter/data/repository/packs_repo.dart';
import '../../models/activities_model.dart';
import '../../models/packs_model.dart';
import '../repository/activities_repo.dart';

class PacksController extends GetxController {
  final PacksRepo packsRepo;

  PacksController({required this.packsRepo});
  RxBool isLoading =false.obs;
  PacksData packsData = PacksData();
  RxList<PacksData> packsList= <PacksData>[].obs;
  @override
  void onReady() {
    getPacks();
    super.onReady();
  }



  @override
  void onInit() {
    getPacks();
    super.onInit();
  }
  Future getPacks() async {

    Response response = await packsRepo.getPacksList();
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {
      //  print("*******body ${response.body["data"]["data"]}");

      List<dynamic> responseData = response.body["packs"];
      print("packs ok");
      packsList.value = responseData.map((data) => PacksData.fromJson(data)).cast<PacksData>().toList();
      print("packs ok*********:${packsList[1].activity!.image.toString()}");

      update();
    }
    else
    {
      print("not okkk");
    }
  }

  Future<void> getPackByID(int packId) async {
    isLoading.value =true;
    Response response = await packsRepo.getPackByID(packId);


    if (response.statusCode == 200) {
      isLoading.value=false;
      print("testttt");
      packsData = PacksData.fromJson(response.body);
      print("testttt2");
      print("body:${response.body}");


    } else {
      isLoading.value=false;
      print("Erreur lors de la récupération des données de catégorie.");
    }
  }


}

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
      update();
    }
    else
    {
      print("not okkk");
    }
  }
}
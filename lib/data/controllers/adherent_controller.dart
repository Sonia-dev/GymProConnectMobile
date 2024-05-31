
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../models/activities_model.dart';
import '../../models/adherent_model.dart';
import '../repository/activities_repo.dart';
import '../repository/adherent_repo.dart';

class AdherentsController extends GetxController {
  final AdherentRepo adherentRepo;

  AdherentsController({required this.adherentRepo});

  RxBool isLoading = false.obs;
  RxList<Adherents> adherentsList = <Adherents>[].obs;


  @override
  void onReady() {
    getAdherents();

    super.onReady();
  }


  @override
  void onInit() {
    getAdherents();

    super.onInit();
  }

  Future getAdherents() async {
    isLoading.value = true;


    Response response = await adherentRepo.getAdherentList();
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {
      isLoading.value = false;

      List<dynamic> responseData = response.body["adherents"];
      print("adhérents ok");
      print("adhérents list: $responseData");
      adherentsList.value =
          responseData.map((data) => Adherents.fromJson(data)).cast<Adherents>().toList();
      update();
    }
    else {
      isLoading.value = false;

      print("not okkk");
    }
  }


}
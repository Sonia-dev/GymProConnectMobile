
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:gymproconnect_flutter/data/repository/packs_repo.dart';
import '../../models/book_model.dart';
import '../../models/packs_model.dart';
import '../../models/sessions_model.dart';
import '../../snack_bar.dart';

class PacksController extends GetxController {
  final PacksRepo packsRepo;

  PacksController({required this.packsRepo});
  RxBool isLoading =false.obs;
  PacksData packsData = PacksData();
  RxList<PacksData> packsList= <PacksData>[].obs;
  RxList<SessionData> sessionsList= <SessionData>[].obs;
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

  Future<void> getPackByID(int packId) async {
    isLoading.value =true;
    Response response = await packsRepo.getPackByID(packId);


    if (response.statusCode == 200) {
      isLoading.value=false;
      print("testttt");
      packsData = PacksData.fromJson(response.body["pack"]);
      print("testttt2");
      print("body:${response.body}");


    } else {
      isLoading.value=false;
      print("Erreur lors de la récupération des données de pack.");
    }
  }
  Future<void> book(BookRequest bookRequest, BuildContext context) async {
    Map<String, dynamic> data = {
      "pack_id": bookRequest.pack_id,
      "status": bookRequest.status,
    };

    try {

      Response response = await packsRepo.book(data);


      if (response.statusCode == 200) {


        SnackBarMessage()
            .showSuccessSnackBar(message: "Votre pack a été réservé.", context: context);


        update();


      }
      else {
        SnackBarMessage().showErrorSnackBar(message: "Désolé, votre réservation n'a pas été effectuée. Veuillez réessayer une autre fois.", context: context
        );
      }

    } catch (e, s) {
      print("Erreur : $e");
      print("StackTrace : $s");

    }
  }


  Future getSessions(int packId) async {

    Response response = await packsRepo.getSessions(packId);
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {

      List<dynamic> responseData = response.body;
      print("packs ok");
      sessionsList.value = responseData.map((data) => SessionData.fromJson(data)).cast<SessionData>().toList();

      update();
    }
    else
    {
      print("not okkk");
    }
  }




}
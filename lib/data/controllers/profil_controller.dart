import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/profil_model.dart';
import '../repository/profil_repo.dart';

class ProfilController extends GetxController {
  final ProfilRepo profilRepo;

  ProfilController({required this.profilRepo});

  User? user;

  @override
  void onReady() {
    getActivities();
    super.onReady();
  }

  @override
  void onInit() {
    getActivities();
    super.onInit();
  }

  Future<void> getActivities() async {
    Response response = await profilRepo.getProfil();
    print("response.body: ${response.body}");
    print("statuscode: ${response.statusCode}");

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      print("profil ok");
      user = User.fromJson(responseData);
      update();
    } else {
      print("not ok");
    }
  }
}
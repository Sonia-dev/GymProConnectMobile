import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/profil_model.dart';
import '../../models/update_user_model.dart';
import '../../snack_bar.dart';
import '../repository/profil_repo.dart';

class ProfilController extends GetxController {
  final ProfilRepo profilRepo;
  UserProfil user = UserProfil();
  RxBool isLoading =false.obs;


  ProfilController({required this.profilRepo});


  @override
  void onReady() {
    getProfil();
    super.onReady();
  }

  @override
  void onInit() {
    getProfil();
    super.onInit();
  }


  Future<void> getProfil() async {
    isLoading.value = true;
    Response response = await profilRepo.getProfil();


    if (response.statusCode == 200) {
      isLoading.value = false;

      user = UserProfil.fromJson(response.body);
    } else {
      isLoading.value = false;
      print("Erreur lors de la récupération des données du profil.");
    }
  }

  Future  UpdateProfil(UpdateModel updateData, BuildContext context) async {
    Map<String, dynamic> data = {
      "name": updateData.name,
      "surname": updateData.surname,
      "phone": updateData.phone,
      "email": updateData.email,
      "adress": updateData.adress,
      "birth_date": updateData.birthDate,
      "status": 1,
    };
    try {
      final response = await profilRepo.update(data);

      if (response.statusCode == 200) {
        SnackBarMessage()
            .showSuccessSnackBar(message: "User updated successfully", context: context);


        print('Profil updated successfully');
      } else {
        SnackBarMessage().showErrorSnackBar(message: "Failed to update profil", context: context);

        print('Failed to update user: ${response.body}');
      }
    } catch (e) {
      print('Error updating user: $e');
    }
  }
}
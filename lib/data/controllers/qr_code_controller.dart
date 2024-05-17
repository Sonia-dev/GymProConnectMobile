import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gymproconnect_flutter/models/qr_code_model.dart';

import '../repository/qr_code_repo.dart';

class QrCodeController extends GetxController {
  final QrCodeRepo qrCodeRepo;

  QrCodeController({required this.qrCodeRepo});

  RxBool isLoading =false.obs;
  QrCodeModel qrCode = QrCodeModel();

  @override
  void onReady() {
    getQrCode();
    super.onReady();
  }

  @override
  void onInit() {
    getQrCode();
    super.onInit();
  }

  Future<void> getQrCode() async {
    Response response = await qrCodeRepo.getQrCode();

    print("statuscode: ${response.statusCode}");

    if (response.statusCode == 200) {
      // Convertissez le corps de la réponse en une Map<String, dynamic>
      Map<String, dynamic> responseBody = json.decode(response.body);

      // Créez une instance de QrCodeModel en utilisant la méthode fromJson
      qrCode = QrCodeModel.fromJson(responseBody);

      print("Qr Code ok");
      update();
    } else {
      print("not okkk");
    }
  }





}
import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gymproconnect_flutter/models/qr_code_model.dart';

import '../../models/Attendance_model.dart';
import '../repository/qr_code_repo.dart';

class QrCodeController extends GetxController {
  final QrCodeRepo qrCodeRepo;

  QrCodeController({required this.qrCodeRepo});

  RxBool isLoading = false.obs;
  QrCodeModel qrCode = QrCodeModel();
  String tokenCode ="";

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

    try {
      Response response = await qrCodeRepo.getQrCode();
      isLoading.value = true;
      print("status code: ${response.statusCode}");

      if (response.statusCode == 200) {
        isLoading.value = false;
        if (response.bodyString != null) {
          Map<String, dynamic> responseData = json.decode(response.bodyString!);

          print("QR Code Data: $responseData");

          qrCode = QrCodeModel.fromJson(responseData);

          print("Qr Code ok${qrCode.name}");
          update();
        } else {
          print("Response body is not a valid JSON string");
        }
      } else {
        isLoading.value = false;
        print("HTTP Request failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

}
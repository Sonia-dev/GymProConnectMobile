import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/api/api_client.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';

import '../data/controllers/auth_controller.dart';
import '../utils/uris.dart';

Future<void> init()async {

  //Get.lazyPut(()=>ApiClient(appBaseUrl: "http://127.0.0.1:8000/api/v1/"));

  Get.lazyPut(()=>ApiClient(appBaseUrl: "http://192.168.137.24:8000/api/v1/"));




  Get.lazyPut(() => AuthRepo(apiClient:Get.find()));

  Get.lazyPut(() => AuthController(registerRepo:Get.find()));


}
import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/api/api_client.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';

import '../data/controllers/auth_controller.dart';
import '../utils/uris.dart';

Future<void> init()async {

  //Get.lazyPut(()=>ApiClient(appBaseUrl: "http://127.0.0.1:8000/api/v1/"));

  Get.lazyPut(()=>ApiClient(appBaseUrl: Uris.baseUrl));




  Get.lazyPut(() => AuthRepo(apiClient:Get.find()));

  Get.lazyPut(() => AuthController(authRepo:Get.find()));


}
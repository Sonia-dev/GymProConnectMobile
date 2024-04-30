import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/api/api_client.dart';
import 'package:gymproconnect_flutter/data/controllers/categories_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/update_user_controller.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';
import 'package:gymproconnect_flutter/data/repository/update_user_repo.dart';

import '../data/controllers/activities_controller.dart';
import '../data/controllers/auth_controller.dart';
import '../data/repository/activities_repo.dart';
import '../utils/uris.dart';

Future<void> init()async {

  //Get.lazyPut(()=>ApiClient(appBaseUrl: "http://127.0.0.1:8000/api/v1/"));

  Get.lazyPut(()=>ApiClient(appBaseUrl: Uris.baseUrl));




 // Get.lazyPut(() => UpdateRepo(apiClient: Get.find()));

  Get.lazyPut(() => UpDateController(updateRepo:Get.find()));




  Get.lazyPut(() => ActivitiesRepo(apiClient:Get.find()));

  Get.lazyPut(() => ActivitiesController(activitiesRepo:Get.find()));



  Get.lazyPut(() => CategoriesRepo(apiClient: Get.find()));

  Get.lazyPut(() => CategoriesController(categoriesRepo:Get.find()));



  Get.lazyPut(() => AuthRepo(apiClient:Get.find()));

  Get.lazyPut(() => AuthController(authRepo:Get.find()));


}
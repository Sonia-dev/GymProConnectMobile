import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymproconnect_flutter/data/api/api_client.dart';
import 'package:gymproconnect_flutter/data/controllers/booking_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/categories_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/planning_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/qr_code_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/update_user_controller.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';
import 'package:gymproconnect_flutter/data/repository/booking_repo.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';
import 'package:gymproconnect_flutter/data/repository/planning_repo.dart';
import 'package:gymproconnect_flutter/data/repository/qr_code_repo.dart';
import 'package:gymproconnect_flutter/data/repository/trainers_repo.dart';
import 'package:gymproconnect_flutter/data/repository/update_user_repo.dart';

import '../data/controllers/activities_controller.dart';
import '../data/controllers/auth_controller.dart';
import '../data/controllers/packs_controller.dart';
import '../data/controllers/trainers_controller.dart';
import '../data/repository/activities_repo.dart';
import '../data/repository/packs_repo.dart';
import '../utils/uris.dart';

Future<void> init()async {

  await GetStorage.init();

  Get.lazyPut(()=>ApiClient(appBaseUrl: Uris.baseUrl));
  Get.lazyPut(() => AuthRepo(apiClient:Get.find()));
  Get.lazyPut(() => AuthController(authRepo:Get.find()));




  Get.lazyPut(() => UpDateController(updateRepo:Get.find()));


  Get.lazyPut(() => ActivitiesRepo(apiClient:Get.find()));
  Get.lazyPut(() => ActivitiesController(activitiesRepo:Get.find()));



  Get.lazyPut(() => CategoriesRepo(apiClient: Get.find()));
  Get.lazyPut(() => CategoriesController(categoriesRepo:Get.find()));

  Get.lazyPut(() => PacksRepo(apiClient: Get.find()));
  Get.lazyPut(() => PacksController(packsRepo:Get.find()));


  Get.lazyPut(() => TrainersRepo(apiClient: Get.find()));
  Get.lazyPut(() => TrainersController(trainersRepo:Get.find()));


  Get.lazyPut(() => QrCodeRepo(apiClient: Get.find()));
  Get.lazyPut(() => QrCodeController(qrCodeRepo:Get.find()));

  Get.lazyPut(() => BookingRepo(apiClient: Get.find()));
  Get.lazyPut(() => BookingController(bookingRepo:Get.find()));

  Get.lazyPut(() => PlanningRepo(apiClient: Get.find()));
  Get.lazyPut(() => PlanningController(planningRepo:Get.find()));


}
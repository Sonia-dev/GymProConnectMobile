import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymproconnect_flutter/data/api/api_client.dart';
import 'package:gymproconnect_flutter/data/controllers/activities_coach_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/adherent_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/attendance_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/categories_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/planning_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/profil_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/proposer_seance_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/qr_code_controller.dart';
import 'package:gymproconnect_flutter/data/repository/adherent_repo.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';
import 'package:gymproconnect_flutter/data/repository/booking_repo.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';
import 'package:gymproconnect_flutter/data/repository/planning_repo.dart';
import 'package:gymproconnect_flutter/data/repository/proposer_seance_repo.dart';
import 'package:gymproconnect_flutter/data/repository/qr_code_repo.dart';
import 'package:gymproconnect_flutter/data/repository/trainers_repo.dart';
import '../data/controllers/activities_controller.dart';
import '../data/controllers/auth_controller.dart';
import '../data/controllers/filter_controller.dart';
import '../data/controllers/packs_controller.dart';
import '../data/controllers/trainers_controller.dart';
import '../data/repository/activities_repo.dart';
import '../data/repository/attendance_repo.dart';
import '../data/repository/filter_repo.dart';
import '../data/repository/packs_repo.dart';
import '../data/repository/profil_repo.dart';
import '../utils/uris.dart';

Future<void> init()async {

  await GetStorage.init();

  Get.lazyPut(()=>ApiClient(appBaseUrl: Uris.baseUrl));
  Get.lazyPut(() => AuthRepo(apiClient:Get.find()));
  Get.lazyPut(() => AuthController(authRepo:Get.find()));


  Get.lazyPut(() => ActivitiesRepo(apiClient:Get.find()), fenix: true);
  Get.lazyPut(() => ActivitiesCoachController(activitiesRepo:Get.find()), fenix: true);



  Get.lazyPut(() => ActivitiesController(activitiesRepo:Get.find()), fenix: true);



  Get.lazyPut(() => CategoriesRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => CategoriesController(categoriesRepo:Get.find()), fenix: true);

  Get.lazyPut(() => PacksRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => PacksController(packsRepo:Get.find()), fenix: true);


  Get.lazyPut(() => TrainersRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => TrainersController(trainersRepo:Get.find()), fenix: true);


  Get.lazyPut(() => AdherentRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => AdherentsController(adherentRepo:Get.find()), fenix: true);


  Get.lazyPut(() => QrCodeRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => QrCodeController(qrCodeRepo:Get.find()), fenix: true);

  Get.lazyPut(() => BookingRepo(apiClient: Get.find()), fenix: true);
  //Get.lazyPut(() => BookingController(bookingRepo:Get.find()), fenix: true);

  Get.lazyPut(() => PlanningRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => PlanningController(planningRepo:Get.find()), fenix: true);



  Get.lazyPut(() => ProposerSeanceRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => ProposerSeanceController(proposerSeanceRepo:Get.find()), fenix: true);


  Get.lazyPut(() => ProfilRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => ProfilController(profilRepo:Get.find()), fenix: true);

  Get.lazyPut(() => FilterRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => FilterController(filterRepo:Get.find()), fenix: true);

  Get.lazyPut(() => AdherentRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => AdherentsController(adherentRepo:Get.find()), fenix: true);


  Get.lazyPut(() => AttendanceRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => AttendanceController(attendanceRepo:Get.find()), fenix: true);


}
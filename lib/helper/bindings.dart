




import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:gymproconnect_flutter/data/controllers/categories_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/packs_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/qr_code_controller.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';
import 'package:gymproconnect_flutter/data/repository/packs_repo.dart';
import 'package:gymproconnect_flutter/data/repository/qr_code_repo.dart';
import 'package:gymproconnect_flutter/data/repository/trainers_repo.dart';

import '../data/controllers/activities_controller.dart';
import '../data/controllers/auth_controller.dart';
import '../data/controllers/planning_controller.dart';
import '../data/controllers/splash_controller.dart';
import '../data/controllers/trainers_controller.dart';
import '../data/repository/activities_repo.dart';
import '../data/repository/auth_repo.dart';
import '../data/repository/planning_repo.dart';




class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepo(apiClient: Get.find()));
    Get.put(AuthController(authRepo: Get.find()));
  }
}




class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}



class HomeBindings implements Bindings {
  @override
  void dependencies() {
    AuthBinding();
    ActivityBindings();
    CategoryBindings();
    TrainersBindings();
    PackBindings();
    PlanningBindings();
  }
}
class PlanningBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PlanningRepo(apiClient: Get.find()));
    Get.put(PlanningController(planningRepo: Get.find()));
  }
}

class ActivityBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ActivitiesRepo( apiClient: Get.find(),));
    Get.put(ActivitiesController(activitiesRepo: Get.find()));
  }
}
class CategoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoriesRepo(apiClient: Get.find(),));
    Get.put(CategoriesController(categoriesRepo: Get.find()));
  }
}
class PackBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PacksRepo(apiClient: Get.find(),));
    Get.put(PacksController(packsRepo: Get.find()));
  }
}
  class TrainersBindings implements Bindings {
  @override
  void dependencies() {
  Get.put(TrainersRepo( apiClient: Get.find(),));
  Get.put(TrainersController(trainersRepo: Get.find()));
  }
  
}
class QrCodeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(QrCodeRepo( apiClient: Get.find(),));
    Get.put(QrCodeController(qrCodeRepo: Get.find()));
  }

}

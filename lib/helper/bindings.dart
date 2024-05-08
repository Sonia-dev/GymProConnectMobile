




import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:gymproconnect_flutter/data/controllers/activity_find_by_name_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/categories_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/details_activity_controller.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';
import 'package:gymproconnect_flutter/data/repository/trainers_repo.dart';

import '../data/controllers/activities_controller.dart';
import '../data/controllers/trainers_controller.dart';
import '../data/repository/activities_repo.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    ActivityBindings();
    CategoryBindings();
    TrainersBindings();
  }
}

class ActivityBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ActivitiesRepo( apiClient: Get.find(),));
    print("teest");
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
  class TrainersBindings implements Bindings {
  @override
  void dependencies() {
  Get.put(TrainersRepo( apiClient: Get.find(),));
  Get.put(TrainersController(trainersRepo: Get.find()));
  }
  
}

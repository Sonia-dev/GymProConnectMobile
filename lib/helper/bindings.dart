




import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:gymproconnect_flutter/data/controllers/categories_controller.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';

import '../data/controllers/activities_controller.dart';
import '../data/repository/activities_repo.dart';

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
    Get.put(CategoriesRepo( apiClient: Get.find(),));
    Get.put(CategoriesController(categoriesRepo: Get.find()));
  }
}
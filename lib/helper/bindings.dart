




import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:gymproconnect_flutter/data/controllers/activities_coach_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/adherent_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/categories_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/filter_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/packs_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/profil_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/proposer_seance_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/qr_code_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/sessions_controller.dart';
import 'package:gymproconnect_flutter/data/repository/adherent_repo.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';
import 'package:gymproconnect_flutter/data/repository/filter_repo.dart';
import 'package:gymproconnect_flutter/data/repository/packs_repo.dart';
import 'package:gymproconnect_flutter/data/repository/profil_repo.dart';
import 'package:gymproconnect_flutter/data/repository/proposer_seance_repo.dart';
import 'package:gymproconnect_flutter/data/repository/qr_code_repo.dart';
import 'package:gymproconnect_flutter/data/repository/sessions_repo.dart';
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
    Get.put(AuthRepo(apiClient: Get.find()));
    Get.put(AuthController(authRepo: Get.find()));
    Get.put(ActivitiesRepo( apiClient: Get.find(),));
    Get.put(ActivitiesController(activitiesRepo: Get.find()));
    Get.put(CategoriesRepo(apiClient: Get.find(),));
    Get.put(CategoriesController(categoriesRepo: Get.find()));
    Get.put(TrainersRepo( apiClient: Get.find(),));
    Get.put(TrainersController(trainersRepo: Get.find()));
    Get.put(PacksRepo(apiClient: Get.find(),));
    Get.put(PacksController(packsRepo: Get.find()));
  //  Get.put(PlanningRepo(apiClient: Get.find()));
   // Get.put(PlanningController(planningRepo: Get.find(),));
    Get.put(ProfilRepo( apiClient: Get.find(),));
    Get.put(ProfilController(profilRepo: Get.find()));

  }
}

class HomeAgentBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepo(apiClient: Get.find()));
    Get.put(AuthController(authRepo: Get.find()));
    Get.put(ActivitiesRepo( apiClient: Get.find(),));
    Get.put(ActivitiesController(activitiesRepo: Get.find()));
    Get.put(CategoriesRepo( apiClient: Get.find(),));
    Get.put(CategoriesController(categoriesRepo: Get.find()));
    Get.put(TrainersRepo( apiClient: Get.find(),));
    Get.put(TrainersController(trainersRepo: Get.find()));
    Get.put(PacksRepo(apiClient: Get.find(),));
    Get.put(PacksController(packsRepo: Get.find()));
    Get.put(ProfilRepo( apiClient: Get.find(),));
    Get.put(ProfilController(profilRepo: Get.find()));


  }
}
class HomeCoachBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepo(apiClient: Get.find()));
    Get.put(AuthController(authRepo: Get.find()));
    Get.put(ProfilRepo( apiClient: Get.find(),));
    Get.put(ProfilController(profilRepo: Get.find()));
    Get.put(ActivitiesRepo( apiClient: Get.find(),));
    Get.put(ActivitiesCoachController(activitiesRepo: Get.find()));

  }
}
class PlanningBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PlanningRepo(apiClient: Get.find()));
    Get.put(PlanningController(planningRepo: Get.find(),),permanent: true);
  }
}
class PlanningCoachBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SessionsRepo(apiClient: Get.find()));
    Get.put(SessionCoachController(sessionsRepo: Get.find(),),permanent: true);
  }
}

class ActivityBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ActivitiesRepo( apiClient: Get.find(),));
    Get.put(ActivitiesController(activitiesRepo: Get.find()),permanent: true);
  }
}

class AdherentBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AdherentRepo( apiClient: Get.find(),));
    Get.put(AdherentsController(adherentRepo: Get.find()),permanent: true);
  }
}


class ActivityCoachBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ActivitiesRepo( apiClient: Get.find(),));
    Get.put(ActivitiesCoachController(activitiesRepo: Get.find()),permanent: true);
  }
}
class CategoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ActivitiesRepo( apiClient: Get.find(),));
    Get.put(ActivitiesController(activitiesRepo: Get.find()),permanent: true);
  }
}
class PackBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PacksRepo(apiClient: Get.find(),));
    Get.put(PacksController(packsRepo: Get.find()),permanent: true);
    Get.put(FilterRepo( apiClient: Get.find(),));
    Get.put(FilterController(filterRepo: Get.find()),permanent: true);
  }
}
class TrainersBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(TrainersRepo( apiClient: Get.find(),));
    Get.put(TrainersController(trainersRepo: Get.find()),permanent: true);
  }

}
class QrCodeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(QrCodeRepo(apiClient: Get.find(),));
    Get.put(QrCodeController(qrCodeRepo: Get.find()), permanent: true);
  }
}

class ProposeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProposerSeanceRepo( apiClient: Get.find(),));
    Get.put(ProposerSeanceController(proposerSeanceRepo: Get.find()),permanent: true);
  }

}

class ProfilBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfilRepo( apiClient: Get.find(),));
    Get.put(ProfilController(profilRepo: Get.find()),permanent: true);
    Get.put(AuthRepo(apiClient: Get.find()));
    Get.put(AuthController(authRepo: Get.find()));
  }

}


class FilterBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FilterRepo( apiClient: Get.find(),));
    Get.put(FilterController(filterRepo: Get.find()),permanent: true);
  }

}


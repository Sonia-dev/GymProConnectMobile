import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gymproconnect_flutter/models/trainers_model.dart';
import 'package:gymproconnect_flutter/screens/home/activities.dart';
import 'package:gymproconnect_flutter/screens/home/menu_screen.dart';
import 'package:gymproconnect_flutter/screens/home/packs.dart';
import 'package:gymproconnect_flutter/screens/home/qr_code.dart';
import '../helper/bindings.dart';
import '../screens/home/Profil.dart';
import '../screens/home/categories.dart';
import '../screens/home/detailed_activity.dart';
import '../screens/home/detailed_category.dart';
import '../screens/home/detailed_pack.dart';
import '../screens/home/detailed_trainer.dart';
import '../screens/home/login.dart';
import '../screens/home/main_home.dart';
import '../screens/home/planning.dart';
import '../screens/home/register.dart';
import '../screens/home/splash.dart';
import '../screens/home/trainers.dart';
class RouteHelper {
  static const String initial = "/";
  static const String main = "/main";
  static const String homePage = "/home";
  static const String splash = "/splash";

  //auth
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";

  static const String activities = "/activities";
  static const String activitieById = "/activitieById";

  static const String packs = "/packs";
  static const String packById = "/packbyid";


  static const String categorieById = "/categorieById";
  static const String categories = "/categories";

  static const String trainers = "/trainers";
  static const String trainerById = "/tarinerById";

  static const String qrCode = "/qrcode";

  static const String profil= "/profil";

  static const String planning= "/planning";




  static String getInitial() => initial;
  static String getMain() => main;
  static String getHome() => homePage;
  static String getActivities() => activities;
  static String getActivitieById() => activitieById;

  static String getPacks() => packs;
  static String getPackById() => packById;

  static String getCategorieById() => categorieById;
  static String getCategories() => categories;

  static String getTrainerById() => trainerById;
  static String getTrainers() => trainers;

  static String getQrCode() => qrCode;
  static String getPlanning() => planning;



  static String getSplashPage() => splash;
  static String getSignInPage() => signIn;
  static String getSignUpPage() => signUp;
  static String getProfil() => profil;
  static List<GetPage> routes = [
    GetPage(
      binding: SplashBindings(),
      name: splash,
      page: () => Splash(),
    ),


    GetPage(
      binding: AuthBinding(),
      name: profil,
      page: () => Profil(),
    ),


    GetPage(
      name: signIn,
      page: () => Register(),
    ),
    GetPage(
      binding: AuthBinding(),
      name: signUp,
      page: () => Login(),
    ),
    GetPage(
      binding: HomeBindings(),

      name: initial,
      page: () =>  MenuScreen(),
    ),



    GetPage(
      binding: ActivityBindings(),
      name: activities,
      page: () =>  ActivityList(),
    ),
    GetPage(
      binding: ActivityBindings(),
      name: activitieById,
      page: () =>  ActivityDetail(),
    ),



    GetPage(
      binding: CategoryBindings(),
      name: categories,
      page: () =>  CategoriesList(),
    ),
    GetPage(
      binding: CategoryBindings(),
      name: categorieById,
      page: () =>  detailCategory(),
    ),



    GetPage(
      binding: PackBindings(),
      name: packs,
      page: () =>  PackList(),
    ),
    GetPage(
      binding: PackBindings(),
      name: packById,
      page: () =>  PackDetail(),
    ),




    GetPage(
      binding: TrainersBindings(),
      name: trainers,
      page: () =>  TrainersList(),
    ),
    GetPage(
      binding: TrainersBindings(),
      name: trainerById,
      page: () =>  detailTrainer(),
    ),


    GetPage(
      binding: QrCodeBindings(),
      name: qrCode,
      page: () =>  QrCode(),
    ),


    GetPage(
      binding: PlanningBindings(),
      name: planning,
      page: () =>  Planning(),
    ),

  ];
}
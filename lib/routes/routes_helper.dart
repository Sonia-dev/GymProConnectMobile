import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gymproconnect_flutter/screens/home/activities.dart';
import 'package:gymproconnect_flutter/screens/home/menu_screen.dart';
import '../helper/bindings.dart';
import '../screens/home/categories.dart';
import '../screens/home/login.dart';
import '../screens/home/main_home.dart';
import '../screens/home/register.dart';
import '../screens/home/splash.dart';
import '../screens/home/trainers.dart';
class RouteHelper {
  static const String initial = "/";
  static const String main = "/main";
  static const String homePage = "/home";
  //auth
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String activities = "/activities";
  static const String categories = "/categories";
  static const String trainers = "/trainers";
  static const String splash = "/splash";



  static String getInitial() => initial;
  static String getMain() => main;
  static String getHome() => homePage;
  static String getActivities() => activities;
  static String getCategories() => categories;
  static String getTrainers() => trainers;

  static String getSplashPage() => splash;
  static String getSignInPage() => signIn;
  static String getSignUpPage() => signUp;

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => Splash(),
    ),
    GetPage(
      name: signIn,
      page: () => Register(),
    ),
    GetPage(

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
      binding: CategoryBindings(),
      name: categories,
      page: () =>  CategoriesList(),
    ),
    GetPage(
      binding: TrainersBindings(),
      name: trainers,
      page: () =>  TrainersList(),
    ),

  ];
}
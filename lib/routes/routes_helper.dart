
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gymproconnect_flutter/home/login.dart';
import 'package:gymproconnect_flutter/home/register.dart';

class RouteHelper {
  static const String initial = "/";
  static const String main = "/main";
  static const String homePage = "/home";
  //auth
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";

  static String getInitial() => initial;
  static String getMain() => main;
  static String getHome() => homePage;
  static String getSignInPage() => signIn;
  static String getSignUpPage() => signUp;

  static List<GetPage> routes = [
    GetPage(
      name: signIn,
      page: () => Register(),
    ),
    GetPage(
      name: signUp,
      page: () => login(),
    ),
    /*GetPage(
      name: initial,
      page: () => const MainPage(),
    ),*/
  ];
}
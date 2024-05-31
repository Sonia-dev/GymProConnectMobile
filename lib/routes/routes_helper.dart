import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gymproconnect_flutter/screens/agent/PackDetailAgent.dart';
import 'package:gymproconnect_flutter/screens/agent/home_agent.dart';
import 'package:gymproconnect_flutter/screens/agent_layout.dart';
import 'package:gymproconnect_flutter/screens/coach_layout.dart';
import 'package:gymproconnect_flutter/screens/home/activities.dart';
import 'package:gymproconnect_flutter/screens/home/menu_screen.dart';
import 'package:gymproconnect_flutter/screens/home/packs.dart';
import 'package:gymproconnect_flutter/screens/home/qr_code.dart';
import 'package:gymproconnect_flutter/screens/profil/MyAccount.dart';
import '../helper/bindings.dart';
import '../screens/coach/detailed_activity_coach.dart';
import '../screens/coach/home_coach.dart';
import '../screens/coach/proposer_séance.dart';
import '../screens/gym_pro_layout.dart';
import '../screens/home/Profil.dart';
import '../screens/home/abonnement.dart';
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
  static const String homeAgentPage = "/homeAgent";
  static const String homeCoachPage = "/homeCoach";

  static const String splash = "/splash";

  //auth
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";

  static const String activities = "/activities";
  static const String CoachActivities = "/coachActivities";
  static const String activitieById = "/activitieById";
  static const String activitieCoachById = "/activitieCoachById";

  static const String packs = "/packs";
  static const String packById = "/packbyid";
  static const String packByIdAgent = "/packbyidagent";
  static const String abonement = "/abonnement";

  static const String categorieById = "/categorieById";
  static const String categories = "/categories";

  static const String trainers = "/trainers";
  static const String trainerById = "/tarinerById";

  static const String adherents = "/adherents";


  static const String qrCode = "/qrcode";

  static const String profil= "/profil";

  static const String planning= "/planning";

  static const String proposerSeance= "/proposerSeance";

  static const String myAccount= "/myAccount";
  static const String Scanner= "/scanner";





  static String getInitial() => initial;
  static String getMain() => main;
  static String getHome() => homePage;
  static String getHomeAgent() => homeAgentPage;
  static String getHomeCoach() => homeCoachPage;
  static String getActivities() => activities;
  static String getCoachActivities() => CoachActivities;
  static String getActivitieById() => activitieById;
  static String getActivitieCoachById() => activitieCoachById;


  static String getAbonnement() => abonement;



  static String getPacks() => packs;
  static String getPackById() => packById;
  static String getPackByIdAgent() => packByIdAgent;

  static String getCategorieById() => categorieById;
  static String getCategories() => categories;


  static String getTrainerById() => trainerById;
  static String getTrainers() => trainers;

  static String getAdherent() => adherents;


  static String getQrCode() => qrCode;
  static String getScanner() => Scanner;
  static String getPlanning() => planning;



  static String getSplashPage() => splash;
  static String getSignInPage() => signIn;
  static String getSignUpPage() => signUp;
  static String getmyAccount() => myAccount;

  static String getProfil() => profil;

  static List<GetPage> routes = [
    GetPage(
      binding: SplashBindings(),
      name: splash,
      page: () => Splash(),
    ),



    GetPage(
      binding: HomeBindings(),
      name: homePage,
      page: () => GymProLayout(),
    ),

    GetPage(
      binding: HomeCoachBindings(),
      name: homeCoachPage,
      page: () => CoachLayout(),
    ),
    GetPage(
      binding: HomeAgentBindings(),
      name: homeAgentPage,
      page: () => AgentLayout(),
    ),
 GetPage(
      binding: ProfilBindings(),
      name: myAccount,
      page: () => MyAccount(),
    ),


    GetPage(
      binding: ProfilBindings(),
      name: profil,
      page: () => Profil(),
    ),
    GetPage(
      name: proposerSeance,
      page: () => ProposerSeance(),
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
      page: () =>  MainHome(),
    ),


    GetPage(
      binding: PlanningBindings(),
      name: abonement,
      page: () =>  abonnement(),
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
      binding: ActivityBindings(),
      name: activitieCoachById,
      page: () =>  ActivityDetailCoach(),
    ),

    // GetPage(
    //   binding: AdherentBindings(),
    //   name: adherents,
    //  page: () =>  homeCoachPage(),
    // ),

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
      binding: PackBindings(),
      name: packByIdAgent,
      page: () =>  PackDetailAgent(),
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

import 'package:flutter/material.dart';
import 'package:gymproconnect_flutter/screens/coach/home_coach.dart';
import 'coach/proposer_séance.dart';
import 'home/Profil.dart';
import 'home/main_home.dart';
import 'home/planning.dart';


class TabNavigatorCoach extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final int tabItem;
  const TabNavigatorCoach({
    Key? key,
    this.navigatorKey,
    required this.tabItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (tabItem) {
      case 0:
        child =  HomeCoach();
        break;
      case 1:
        child =  Planning();

        break;
      case 2:
        child =  ProposerSeance();
        break;

      case 3:
        child =  Profil();
        break;

      default:
        child =  HomeCoach();
    }
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {


        return MaterialPageRoute(
            builder: (context) => child);
      },
    );
  }

}
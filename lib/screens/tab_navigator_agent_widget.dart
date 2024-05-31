
import 'package:flutter/material.dart';
import 'package:gymproconnect_flutter/screens/agent/Members.dart';
import 'package:gymproconnect_flutter/screens/agent/coachs.dart';
import 'package:gymproconnect_flutter/screens/agent/home_agent.dart';
import 'package:gymproconnect_flutter/screens/coach/home_coach.dart';
import 'coach/proposer_séance.dart';
import 'home/Profil.dart';
import 'home/main_home.dart';
import 'home/planning.dart';


class TabNavigatorAgent extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final int tabItem;
  const TabNavigatorAgent({
    Key? key,
    this.navigatorKey,
    required this.tabItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (tabItem) {
      case 0:
        child =  HomeAgent();
        break;
      case 1:
        child =  Adherents();

        break;
      case 2:
        child =  TrainersAgent();
        break;

      case 3:
        child =  Profil();
        break;

      default:
        child =  HomeAgent();
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


import 'package:flutter/material.dart';

import 'home/Profil.dart';
import 'home/abonnement.dart';
import 'home/main_home.dart';
import 'home/planning.dart';


class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final int tabItem;
  const TabNavigator({
    Key? key,
    this.navigatorKey,
    required this.tabItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (tabItem) {
      case 0:
        child =  MainHome();
        break;
      case 1:
        child =  Planning();

        break;
      case 2:
        child =  abonnement();
        break;

      case 3:
        child =  Profil();
        break;

      default:
        child =  MainHome();
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


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/screens/agent/scanner.dart';
import 'package:gymproconnect_flutter/screens/tab_navigator_agent_widget.dart';
import 'package:gymproconnect_flutter/screens/tab_navigator_widget.dart';

import '../routes/routes_helper.dart';


class AgentLayout extends StatefulWidget {
  const AgentLayout({super.key});

  @override
  State<AgentLayout> createState() => _AgentLayoutState();
}

class _AgentLayoutState extends State<AgentLayout> {
  var _currentPage = 0;

  final _navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
  };

  bool hasPreviouslyPressedBackButton = false;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final naviatorStatus = _navigatorKeys[_currentPage]?.currentState;
        if (naviatorStatus != null) {
          if (naviatorStatus.canPop()) {
            naviatorStatus.pop();
            return false;
          }
        }
        if (!hasPreviouslyPressedBackButton) {
          hasPreviouslyPressedBackButton = true;
          Future.delayed(const Duration(milliseconds: 300), () {
            hasPreviouslyPressedBackButton = false;
          });
          return false;
        }
        final canExit = await showDialogPopUp(context);

        if (canExit == true) {
          exit(0);
        }
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: _buildOffstageNavigator(_currentPage),
          bottomNavigationBar:Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: BottomAppBar(
                color: Color(0xFFFFFFFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: IconButton(
                              icon: Icon(Icons.home, color: _currentPage ==0?Color(0xFFF34E3A):Color(0xFFA5A5A7)),
                              onPressed: () {

                                setState(() {
                                  _currentPage=0;
                                });


                              },
                            ),
                          ),
                          Text(
                            'Home',
                            style: GoogleFonts.poppins(color: _currentPage ==0?Color(0xFFF34E3A):Color(0xFFA2A2A2), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: IconButton(
                              icon: Icon(Icons.people,
                                  color: _currentPage ==1?Color(0xFFF34E3A):Color(0xFFA5A5A7)),
                              onPressed: () {
                                setState(() {
                                  _currentPage=1;
                                });

                              },
                            ),
                          ),
                          Text(
                            'Adhérents',
                            style:
                            GoogleFonts.poppins(fontSize: 12, color: _currentPage ==1?Color(0xFFF34E3A):Color(0xFFA5A5A7)),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: IconButton(
                              icon: Icon(Icons.people,
                                  color:   _currentPage ==2?Color(0xFFF34E3A):Color(0xFFA5A5A7)),
                              onPressed: () {
                                setState(() {
                                  _currentPage=2;
                                });

                              },
                            ),
                          ),
                          Text(
                            'Coaches',
                            style:
                            GoogleFonts.poppins(fontSize: 12, color: _currentPage ==2?Color(0xFFF34E3A):Color(0xFFA5A5A7)),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: IconButton(
                              icon: Icon(
                                Icons.person,
                                color: _currentPage ==3?Color(0xFFF34E3A):Color(0xFFA5A5A7),
                              ),
                              onPressed: () {
                                setState(() {
                                  _currentPage=3;
                                });

                              },
                            ),
                          ),
                          Text(
                            'Profil',
                            style:
                            GoogleFonts.poppins(fontSize: 12, color: _currentPage ==3?Color(0xFFF34E3A):Color(0xFFA5A5A7),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                  height: kToolbarHeight /
                      6, // Utilise kToolbarHeight pour la hauteur de la barre d'applications
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color(0xFFDCDCDC),
                        Color(0xFFDCDCDC).withOpacity(0)
                      ],
                    ),
                  )),
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFFf34e3a),
            onPressed: () {

              Get.to(Scanner());
            },
            child: Image.asset("assets/scanner.jfif",width: 30,height: 30,),
            shape: CircleBorder(),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(int tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigatorAgent(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }

}
Future<bool?> showDialogPopUp(BuildContext context) async {
  return  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.warning,
            color: Colors.orange,
          ),
          SizedBox(width: 10),
          Text(
            'Etes vous sures?',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
      content: Text(
        'Vous voulez vraiment quitter l application?',
        style:  GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
        textAlign: TextAlign.right,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'Non',
            style:  GoogleFonts.poppins(fontSize: 14, color: Colors.orange),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            'Oui',
            style:  GoogleFonts.poppins(fontSize: 14, color: Colors.black),
          ),
        ),
      ],
    ),
  );

}
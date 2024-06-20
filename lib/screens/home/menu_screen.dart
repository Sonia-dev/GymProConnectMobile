import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:gymproconnect_flutter/routes/routes_helper.dart';
import 'package:gymproconnect_flutter/screens/home/Profil.dart';
import 'package:gymproconnect_flutter/screens/home/abonnement.dart';
import 'package:gymproconnect_flutter/screens/home/login.dart';
import 'package:gymproconnect_flutter/screens/home/main_home.dart';
import 'package:gymproconnect_flutter/screens/home/planning.dart';

import '../../data/controllers/auth_controller.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: ZoomDrawer(

        style: DrawerStyle.style1,
        menuScreen: MenuContent(),
        mainScreen: MainHome(),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        mainScreenScale: 0.4,
        slideWidth: MediaQuery.of(context).size.width * 0.8,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.easeInOut,
      ),
    );
  }
}

class MenuContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 812,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFF545454), Color(0xFF9F807C)],
        ),
      ),
      child: Stack(
        children: [

          Positioned(
            left: 195,
            top: 148.66,
            child: Opacity(
              opacity: 0.20,
              child: Transform(
                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.26),
                child: Container(
                  width: 266.54,
                  height: 453.35,
                  decoration: BoxDecoration(
                    color: Color(0xFFF34E3A),
                    borderRadius: BorderRadius.circular(22.94),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 225.62,
            top: 125.90,
            child: Transform(
              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.15),
              child: Container(
                width: 267.62,
                height: 451.23,
                decoration: BoxDecoration(
                  color: Color(0xFFF34E3A),
                  borderRadius: BorderRadius.circular(22.94),
                ),
              ),
            ),
          ),
          Positioned(
            left: 260.12,
            top: 128.66,
            child: Transform(
              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.05),
              child: Container(
                width: 241.06,
                height: 493.91,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/241x494"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(22.94),
                ),
              ),
            ),
          ),
          Positioned(
            left: 27.53,
            top: 117,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Color(0xFFF34E3A)),
                      image: DecorationImage(
                        image: NetworkImage("https://via.placeholder.com/50x50"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                          Text(
                            'Roberto Mamun',

                            style: TextStyle(

                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),

                      const SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.phone,color: Colors.white,
                            size: 24,),
                          const SizedBox(width: 2),

                          Text(
                            '27 555 888',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Icon(
                            Icons.person, // Icône de profil par défaut, vous pouvez la remplacer par une autre icône de votre choix
                            color: Colors.white,
                            size: 24, // Taille de l'icône, ajustez selon vos besoins
                          ),TextButton(
                            onPressed: () {
                              Get.toNamed(RouteHelper.getProfil());                     },
                        child: Text('Mon profil',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.06,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),),],),
                      const SizedBox(height: 10),
                      Row(children: [
                        Icon(Icons.payment,
                          color: Colors.white,
                          size: 24,),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => abonnement()),
                            );                            },
                          child: Text(
                          'Payments',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.06,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),),
              ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children:[
                          Icon(Icons.calendar_month_outlined,color: Colors.white,
                              size: 24,),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Planning()),
                              );                            },
                            child:Text(
                          'Planning',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.06,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),),
                        ],),
                      
                      const SizedBox(height: 200),

                      Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Confirmation"),
                                    content: Text("Êtes-vous sûr de vouloir vous déconnecter ?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); // Fermer le dialogue
                                        },
                                        child: Text("Annuler"),
                                      ),
                                      TextButton(
                                        onPressed: () {

                                          Get.find<AuthController>().clearData();

                                          Get.offAllNamed(RouteHelper.getSignUpPage());
                                        },
                                        child: Text("Déconnexion"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.06,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymproconnect_flutter/data/controllers/categories_controller.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/screens/home/planning.dart';
import 'dart:ui';

import '../../data/api/api_client.dart';
import '../../routes/routes_helper.dart';
import 'Profil.dart';
import 'abonnement.dart';
import 'filtre.dart';
import 'main_home.dart';


class CategoriesList extends GetView<CategoriesController> {
  String searchText = '';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Expanded(
                    /* child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),*/
                    child:TextFormField(
                        onChanged: (value) {

                            searchText = value;

                        },

                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                          floatingLabelStyle: const TextStyle(color: Colors.black),
                          labelText: 'Search',
                          suffixIcon: Icon(Icons.search),
                          filled:true,
                          fillColor: Color(0xffF7F9FD),
                          labelStyle: TextStyle( color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(width: 1, color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(width: 1, color: Colors.white)),
                        )






                    ),
                  ),

                  IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/filtre.png'),
                      size: 24,

                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => filtre()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: Get.find<CategoriesController>().categoriesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final category = Get.find<CategoriesController>().categoriesList[index];
                    return GestureDetector(
                        onTap: () {
                      Get.toNamed(
                        RouteHelper.categorieById,
                      );

                      Get.find<CategoriesController>()
                          .getCategorieByID(category.id!);
                    },
                      child:Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: 150,
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                                child:  Image.network(
                                  category.image!,
                                  width: double.infinity,
                                  height: 150,
                                  fit:  BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return SizedBox(child: Image.asset("assets/no_image.jpg"));
                                  },
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress?.expectedTotalBytes ==
                                        loadingProgress?.cumulativeBytesLoaded) {
                                      return child;
                                    }
                                    return const CircularProgressIndicator();
                                  },
                                )
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child:
                                          Text(
                                            category.description!,
                                            style:  GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 12.spMax,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ));
                  },
                ),
              ),]),),
      bottomNavigationBar: Stack(
          children: [

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
                              icon: Icon(Icons.home, color: Color(0xFFf34e3a)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MainHome()),
                                );
                              },
                            ),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(color: Color(0xFFf34e3a), fontSize: 12),
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
                              icon: Icon(Icons.calendar_today_rounded,color: Color(0xFFA5A5A7)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Planning()),
                                );
                              },
                            ),
                          ),
                          Text(
                            'Planning',
                            style: TextStyle(fontSize: 12,color: Color(0xFFA2A2A2)),
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
                              icon: Icon(Icons.access_time,color: Color(0xFFA5A5A7)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => abonnement()),
                                );
                              },
                            ),
                          ),
                          Text(
                            'Abonnement',
                            style: TextStyle(fontSize: 12,color: Color(0xFFA5A5A7)),
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
                              icon: Icon(Icons.person,color: Color(0xFFA5A5A7),),
                              onPressed: () {
                                Get.toNamed(RouteHelper.getProfil());
                              },
                            ),
                          ),
                          Text(
                            'Profil',
                            style: TextStyle(fontSize: 12,color: Color(0xFFA5A5A7)),
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
                  height: kToolbarHeight/6, // Utilise kToolbarHeight pour la hauteur de la barre d'applications
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
                  )
              ),
            ),
          ]
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFf34e3a),
        onPressed: () {},
        child: Image.asset("assets/scanner.jfif",width: 30,height: 30,),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
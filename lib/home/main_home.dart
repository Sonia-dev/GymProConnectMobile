import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/controllers/trainers_controller.dart';
import 'package:gymproconnect_flutter/data/repository/trainers_repo.dart';
import 'package:gymproconnect_flutter/home/abonnement.dart';
import 'package:gymproconnect_flutter/home/Profil.dart';
import 'package:gymproconnect_flutter/home/activities.dart';
import 'package:gymproconnect_flutter/home/detailed_activity.dart';
import 'package:gymproconnect_flutter/home/planning.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/home/trainers.dart';
import 'package:gymproconnect_flutter/models/categories_model.dart';

import '../data/api/api_client.dart';
import '../data/controllers/activities_controller.dart';

import '../data/controllers/categories_controller.dart';
import '../data/repository/activities_repo.dart';
import '../data/repository/categories_repo.dart';
import '../globals.dart';
import 'categories.dart';

class MainHome extends GetView<CategoriesController> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    Get.put(ApiClient(appBaseUrl: "http://192.168.1.107:8000/api/"));
    Get.put(CategoriesRepo(
      apiClient: Get.find(),
    ));
    ActivitiesController activitiesController = Get.put(ActivitiesController(
      activitiesRepo: ActivitiesRepo(apiClient: Get.find()),
    ));
    TrainersController trainersController = Get.put(TrainersController(
      trainersRepo: TrainersRepo(apiClient: Get.find()),
    ));
    Get.put(CategoriesController(categoriesRepo: Get.find()));

    Get.put(ActivitiesRepo(
      apiClient: Get.find(),
    ));
    Get.put(ActivitiesController(activitiesRepo: Get.find()));

    DateTime now = DateTime.now();

    List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    String dayOfWeek = weekdays[now.weekday - 1];
    String dayOfMonth = now.day.toString();
    String month = months[now.month - 1];
    String year = now.year.toString();

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 45, bottom: 15),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "welcome $userName !",
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$dayOfWeek, $dayOfMonth $month $year',
              style: TextStyle(
                fontSize: 11,
                color: Color(0xFFf34e3a),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
                onChanged: (value) {
                  searchText = value;
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  floatingLabelStyle: const TextStyle(color: Colors.black),
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Color(0xffF7F9FD),
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white)),
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categorie',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoriesList()),
                    );
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFFf34e3a)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 60.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    final category = controller.categories[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: 60.0,
                              height: 60,
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                              ),
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(category.image.toString()),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            category.name.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Activities",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'choose your program',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF545454),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ActivityList()),
                    );
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFFf34e3a)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                height: 200.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: activitiesController.activities.length,
                    itemBuilder: (BuildContext context, int index) {
                      final activity = activitiesController.activities[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(Activity(), arguments: activity);
                          },
                          child: Container(
                            width: 300.0,
                            height: 300.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              shape: BoxShape.rectangle,
                              color: Colors.black12,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        activity.image,
                                        width: 300,
                                        height: 300,
                                        fit: BoxFit.cover,
                                      )),
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(
                                            15)), // Adjust the radius as needed

                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 3, sigmaY: 3),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        padding: EdgeInsets.all(8.0), // Adjust padding as needed
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [

                                            Expanded(

                                              child: Text(
                                                activity.description,
                                                style: TextStyle(
                                                    color: Colors.white),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Icon(Icons.star),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trainers",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'choose your Trainer',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF545454),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrainersList()),
                    );
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFFf34e3a)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 60.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trainersController.trainers.length,
                  itemBuilder: (BuildContext context, int index) {
                    final trainer = trainersController.trainers[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: 54.0,
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        Colors.grey, // Couleur du cercle gris
                                    width: 1.0),
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(trainer.image),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            trainer.name.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
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
                    icon: Icon(Icons.calendar_today_rounded),
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
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Color(0xFFf34e3a),
                child: Icon(
                  Icons.qr_code_scanner_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => abonnement()),
                      );
                    },
                  ),
                ),
                Text(
                  'Abonnement',
                  style: TextStyle(fontSize: 12),
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
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => profil()),
                      );
                    },
                  ),
                ),
                Text(
                  'Profil',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

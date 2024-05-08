
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/controllers/planning_controller.dart';
import 'package:gymproconnect_flutter/data/repository/planning_repo.dart';
import 'package:gymproconnect_flutter/screens/home/menu_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../data/api/api_client.dart';
import '../../utils/colors.dart';
import 'profil.dart'; // Assuming Profil widget is in profil.dart
import 'abonnement.dart'; // Assuming Abonnement widget is in abonnement.dart
import 'main_home.dart';

class Planning extends GetView<PlanningController> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    Get.put(ApiClient(appBaseUrl: "http://192.168.1.191:8000/api/v1/auth/"));
    Get.put(PlanningRepo(apiClient: Get.find()));
    Get.put(PlanningController(planningRepo: Get.find()));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Planning',
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: Get.find<PlanningController>().sessionList.length,
        itemBuilder: (BuildContext context, int index) {
          final session = Get.find<PlanningController>().sessionList[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TableCalendar(
                    calendarFormat: _calendarFormat,
                    firstDay: DateTime.utc(2022),
                    lastDay: DateTime.utc(2025),
                    focusedDay: DateTime.now(),
                    // focusedDay: DateTime.parse(session.date!),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerStyle: HeaderStyle(
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      formatButtonVisible: false,
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    //onFormatChanged: (format) => setState(() => _calendarFormat = format),
                    //onDaySelected: (selectedDay, focusedDay) => setState(() => _selectedDay = selectedDay),
                    //selectedDayPredicate: (day) => isSameDay(_selectedDay, day),

                    eventLoader: (day) {
                      DateTime? sessionDate = DateTime.tryParse(session.date!);
                      if (sessionDate != null) {
                        return isSameDay(sessionDate, day) ? ['Session'] : [];
                      }
                      return [];
                    },
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Color(
                            0xFFf34e3a), // Changez la couleur ici en rose ou autre couleur de votre choix
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuScreen()),
                      );
                    },
                  ),
                ),
                Text('Home', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: IconButton(
                    icon: Icon(Icons.calendar_today_rounded,
                        color: Color(0xFFf34e3a)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Planning()),
                      );
                    },
                  ),
                ),
                Text('Planning',
                    style: TextStyle(fontSize: 12, color: Color(0xFFf34e3a))),
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
                Flexible(
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
                Text('Abonnement', style: TextStyle(fontSize: 12)),
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
                Text('Profil', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:lottie/lottie.dart';
import '../../data/controllers/planning_controller.dart';
import '../../data/repository/planning_repo.dart';
import '../../models/my_booking_model.dart';

class Planning extends GetView<PlanningController> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    Get.put(PlanningRepo(apiClient: Get.find()));
    Get.put(PlanningController(planningRepo: Get.find()));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
        body: GetBuilder<PlanningController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TableCalendar(
                  calendarBuilders: CalendarBuilders(
                    singleMarkerBuilder: (context, day, event) => Container(
                      height: 6.h,
                      width: 6.w,
                      decoration: BoxDecoration(
                          color:Colors.yellow,
                          shape: BoxShape.rectangle),
                    ),
                  ),
                  calendarFormat: _calendarFormat,
                  firstDay: DateTime.utc(2022),
                  lastDay: DateTime.utc(2025),
                  focusedDay: DateTime.now(),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  daysOfWeekHeight: 25.h,
                  rowHeight: 45,
                  headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    headerMargin: EdgeInsets.only(bottom: 10),
                    formatButtonVisible: false,
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  calendarStyle: const CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(color: Colors.white),
                    markerDecoration: BoxDecoration(
                        color: Colors.orange, shape: BoxShape.circle),
                  ),
                  eventLoader: controller.loadEventsForDay, // Utilisation de la méthode eventLoader
                  onPageChanged: (focusedDay) {
                    controller.focusedDay = focusedDay;
                    controller.onDaySelected(focusedDay, focusedDay);
                  },
                  selectedDayPredicate: (day) =>
                      isSameDay(controller.selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    _selectedDay = selectedDay;
                    print(_selectedDay);
                    controller.onDaySelected(selectedDay, focusedDay);
                    controller.getBookings(selectedDay);
                  },
                ),

                Obx(() =>
                controller.loading.value == true
                    ? Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 80.h),
                    child: SpinKitDoubleBounce(color: Colors.orange),
                  ),
                )
                    : Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Obx(() =>
                    controller.bookingList.value.isEmpty
                        ? Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Column(
                        children: [
                          Expanded(
                            child: Lottie.asset(
                                'assets/lotties/no_sessions.json'),
                          ),
                          Text('Pas de session aujourd\'hui'),
                        ],
                      ),
                    )
                        : ListView.builder(
                      padding:
                      EdgeInsets.only(bottom: 75.h),
                      itemCount:
                      controller.sessionsList.length,
                      itemBuilder: (context, index) {
                        final session =
                        controller.sessionsList[index];

                        // Rechercher l'activité parente de cette session
                        final parentActivity =
                        findParentActivity(session, controller.activitiesList);

                        return Card(
                          color: getModelStatus(session!.status!).color,
                          child: ListTile(
                            title: Text(parentActivity?.name ?? "Aucune activité"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (session.date != null)
                                  Text('Date: ${session.date}'),
                                if (session.hourStart != null)
                                  Text(
                                    'Start: ${session.hourStart != null ? formatHour(session.hourStart!) : ''}',
                                  ),
                              ],
                            ),// Ajoute un espacement
                              trailing:   Text(
                                  ' ${getModelStatus(session.status!).text}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.white, // Couleur du texte
                                  ),
                                ),


                          ),
                        );

                      },
                    ),
                    ),
                  ),
                )),
              ],
            ),
          );
        }),
      ),
    );
  }

  // Fonction pour trouver l'activité parente d'une session
  Activity? findParentActivity(Sessions session,
      List<Activity> activitiesList) {
    for (var activity in activitiesList) {
      if (activity.sessions != null) {
        for (var actSession in activity.sessions!) {
          if (actSession.id == session.id) {
            return activity;
          }
        }
      }
    }
    return null;
  }

  String formatHour(String hour) {
    final parsedTime = DateFormat('HH:mm:ss').parse(hour);
    return DateFormat('HH:mm').format(parsedTime);
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../data/controllers/planning_controller.dart';
import '../../models/my_booking_model.dart';

class Planning extends GetView<PlanningController> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  Widget build(BuildContext context) {
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
          DateTime normalizedSelectedDay =
          normalizeDate(controller.selectedDay);
          return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: controller.selectedDay,
                calendarFormat: _calendarFormat,
                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
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
                    color: Color(0xFFf34e3a),
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDay, day);
                },
                eventLoader: (day) {
                  DateTime normalizedDay = normalizeDate(day);
                  return controller.events[normalizedDay] ?? [];
                },
                onDaySelected: (selectedDay, focusedDay) {
                  controller.updateSelectedDay(selectedDay);
                },
              ),
              SizedBox(height: 16.0),
              if (controller.events.containsKey(normalizedSelectedDay) &&
              controller.events[normalizedSelectedDay]!.isNotEmpty)
          _buildSession(controller.events[normalizedSelectedDay]!)
          else
          // Afficher l'animation Lottie si aucune session n'est disponible
          Column(
            children: [
              Lottie.asset(
              'assets/lotties/no_sessions.json',
              width: 180, // Ajustez la taille selon vos besoins
              height: 180,
              fit: BoxFit.cover,
              ),
              Text('Aucune session pour cette date ... ')
            ],
          ),
          ],
          ),
          ),
          );
        }),
      ),
    );
  }

  Widget _buildSession(List<Sessions> sessions) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: sessions.map((session) {
          StatusData statusData = controller.getModelStatus(session.status ?? 0);
          final parentActivity = controller.findParentActivity(session, controller.activitiesList) ?? 'N/A';
          final parentCoach = controller.findParentCoach(session, controller.activitiesList) ?? 'N/A';

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: statusData.color),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            margin: EdgeInsets.all(10),
            width: 400,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statut de la séance: ${statusData.text}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: statusData.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Activité: $parentActivity',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Text(
                    'Heure: ${controller.formatHour(session.hourStart!)}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Text(
                    'Coach: $parentCoach',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

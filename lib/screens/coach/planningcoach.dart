import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../data/controllers/planning_controller.dart';
import '../../data/controllers/sessions_controller.dart';
import '../../models/session_coach_model.dart';

class PlanningCoach extends GetView<SessionCoachController> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: GetBuilder<SessionCoachController>(builder: (controller) {


        DateTime? normalizedSelectedDay = normalizeDate(controller.selectedDay);
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
                    controller.updateSelectedDaycoach(selectedDay);
                  },
                ),
                SizedBox(height: 16.0),
                if (controller.events.containsKey(normalizedSelectedDay))
                  _buildSession(controller.events[normalizedSelectedDay]!),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSession(List<Sessionscoach> sessions) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: sessions.map((session) {



          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.lightGreen),
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
            width: 400.w,
            height: 120.h,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Activité: ${session.activityName ?? 'Inconnu'}',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  5.h.verticalSpace,
                  Text(
                    'Studio: ${session.studioName ?? 'Inconnue'}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  5.h.verticalSpace,

                  Text(
                    'Heure: ${controller.formatHour("${session.startTime}")}' ,
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
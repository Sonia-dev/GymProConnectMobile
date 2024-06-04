import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/repository/planning_repo.dart';
import '../../models/my_booking_model.dart';
import '../../snack_bar.dart';

class PlanningController extends GetxController {
  final PlanningRepo planningRepo;

  PlanningController({required this.planningRepo});

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  RxBool isLoading = false.obs;

  var sessionsList = <Sessions>[].obs;
  var bookingList = <MyBookingModel>[].obs;
  var activitiesList = <Activity>[].obs;
  var events = <DateTime, List<Sessions>>{}.obs;
  var activeList = <MyBookingModel>[].obs;
  var completedList = <MyBookingModel>[].obs;
  var canceledList = <MyBookingModel>[].obs;
  DateTime get selectedDay => _selectedDay;

  set selectedDay(value) => _selectedDay = value;

  DateTime get focusedDay => _focusedDay;

  set focusedDay(value) => _focusedDay = value;

  @override
  void onReady() {
    getBookings();
    super.onReady();
  }

  @override
  void onInit() {
    getBookings();
    super.onInit();
  }

  Future<void> getBookings() async {
    isLoading.value = true;
    DateFormat format = DateFormat("yyyy-MM-dd");

    Response response = await planningRepo.getBookingsList();
    print("response.body: ${response.body}");
    print("statuscode: ${response.statusCode}");

    if (response.statusCode == 200) {
      isLoading.value = false;

      List<dynamic> responseData = response.body;
      print("Response Data: $responseData");

      bookingList.clear();

      responseData.forEach((data) {
        MyBookingModel booking = MyBookingModel.fromJson(data);
        print("Parsed Booking: $booking");
        print("Booking sessions: ${booking.pack?.activity?.sessions}");

        bookingList.add(booking);
        var activity = booking.pack?.activity;
        if (activity != null && !activitiesList.any((a) => a.id == activity.id)) {
          activitiesList.add(activity);
        }
      });
      activeList.value = bookingList.where((booking) => booking.status == 1).toList();
      completedList.value = bookingList.where((booking) => booking.status == 2).toList();
      canceledList.value = bookingList.where((booking) => booking.status == 3).toList();
      sessionsList.value = bookingList
          .where((booking) => booking.pack?.activity?.sessions != null)
          .expand((booking) => booking.pack!.activity!.sessions!)
          .toList();

      print("sessionsList: $sessionsList");

      updateEventsMap();
    } else {
      isLoading.value = false;
      print("not okkk");
    }
  }
  void updateSelectedDay(DateTime newSelectedDay) {
    selectedDay = newSelectedDay;
    update();  // This will trigger GetBuilder to rebuild the UI
  }
  void updateEventsMap() {
    events.clear();
    sessionsList.forEach((session) {
      DateTime sessionDate = DateTime.parse(session.date!);
      if (events.containsKey(sessionDate)) {
        events[sessionDate]!.add(session);
      } else {
        events[sessionDate] = [session];
      }
    });

    print("events: $events");
  }

  void onPageChanged(DateTime focusedDay) {
    _focusedDay = focusedDay;
    updateEventsMap();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    _selectedDay = selectedDay;
    _focusedDay = focusedDay;
    updateEventsMap();
    update();
  }
  List<Sessions> loadEventsForDay(DateTime day) {

    return events[day] ?? [];
  }

  // List<Sessions> loadEventsForDay(DateTime day) {
  //   return sessionsList.where((session) {
  //     DateTime sessionDate = DateTime.parse(session.date!);
  //     return sessionDate.year == day.year &&
  //         sessionDate.month == day.month &&
  //         sessionDate.day == day.day;
  //   }).toList();
  // }

  StatusData getModelStatus(int status) {
    switch (status) {
      case 2:
        return StatusData(
          text: "complété",
          color: Colors.blueGrey,
        );
      case 1:
        return StatusData(
          text: "en cours",
          color: Colors.lightGreen,
        );
      case 3:
        return StatusData(
          text: "Annulé",
          color: Colors.redAccent,
        );
      default:
        return StatusData(
          text: "",
          color: Colors.black12,
        );
    }
  }

  String formatHour(String hour) {
    final parsedTime = DateFormat('HH:mm:ss').parse(hour);
    return DateFormat('HH:mm').format(parsedTime);
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
  rebookBooking(BuildContext context, int id) async {
    Response response = await planningRepo.rebookBooking({}, id);
    if (response.statusCode == 200) {
      Get.back();
      SnackBarMessage().showSuccessSnackBar(
        message: "Votre reréservation a été effectuée avec succès.",
        context: context,
      );
      await getBookings();
    } else {
      SnackBarMessage().showErrorSnackBar(
        message: "Une erreur est survenue",
        context: context,
      );
    }
  }
  cancelBooking(String description, BuildContext context, int id) async {
    Response response = await planningRepo.cancelBooking(
      {"description": description},
      id,
    );
    if (response.statusCode == 200) {
      Get.back();
      SnackBarMessage().showSuccessSnackBar(
        message: "L'abonnement a été annulé",
        context: context,
      );
      await getBookings();
    } else {
      SnackBarMessage().showErrorSnackBar(
        message: "Une erreur est survenue",
        context: context,
      );
    }
  }

  String? findParentActivity(Sessions session, List<Activity> activitiesList) {
    for (var activity in activitiesList) {
      if (activity.sessions != null) {
        for (var actSession in activity.sessions!) {
          if (actSession.id == session.id) {
            return activity.name; // Retourne le nom de l'activité
          }
        }
      }
    }
    return null; // Retourne null si aucune activité n'est trouvée
  }
  String? findParentCoach(Sessions session, List<Activity> activitiesList) {
    for (var activity in activitiesList) {
      if (activity.sessions != null && activity.coach != null) {
        for (var actSession in activity.sessions!) {
          if (actSession.id == session.id) {
            return activity.coach?.name; // Retourne le nom du coach de l'activité
          }
        }
      }
    }
    return null; // Retourne null si aucune activité avec la session correspondante n'est trouvée
  }
}

class StatusData {
  final String text;
  final Color color;

  StatusData({
    required this.text,
    required this.color,
  });
}

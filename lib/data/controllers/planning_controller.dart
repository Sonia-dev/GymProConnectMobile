import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/my_booking_model.dart';
import '../../snack_bar.dart';
import '../repository/planning_repo.dart';

class PlanningController extends GetxController {
  final PlanningRepo planningRepo;

  PlanningController({required this.planningRepo});

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  var loading = false.obs;
  var sessionsList = <Sessions>[].obs;
  var bookingList = <MyBookingModel>[].obs;
  var activeList = <MyBookingModel>[].obs;
  var completedList = <MyBookingModel>[].obs;
  var canceledList = <MyBookingModel>[].obs;
  var activitiesList = <Activity>[].obs;

  DateTime get selectedDay => _selectedDay;

  set selectedDay(value) => _selectedDay = value;

  DateTime get focusedDay => _focusedDay;

  set focusedDay(value) => _focusedDay = value;


  @override
  void onReady() {
    getBookings(DateTime.now());
    super.onReady();
  }

  @override
  void onInit() {
    getBookings(DateTime.now());
    super.onInit();
  }

  Future<void> getBookings(DateTime date) async {
    loading.value = true;
    Response response = await planningRepo.getPlanning();
    if (response.statusCode == 200) {
      loading.value = false;
      var list = (response.body as List).map((item) =>
          MyBookingModel.fromJson(item)).toList();
      DateFormat format = DateFormat("yyyy-MM-dd");

      sessionsList.value =
          list.where((booking) => booking.pack?.activity?.sessions != null)
              .expand((booking) => booking.pack!.activity!.sessions!)
              .where((session) {
            DateTime sessionDate = format.parse(session.date!);
            return isSameDay(sessionDate, date);
          }).toList();

      if (sessionsList.isNotEmpty) {
        bookingList.value = list.where((booking) {
          return booking.pack?.activity?.sessions?.any((session) {
            DateTime sessionDate = format.parse(session.date!);
            return isSameDay(sessionDate, date) && session.status == 1;
          }) ?? false;
        }).toList();
      } else {
        bookingList.clear();
      }

      activitiesList.value = list.map((booking) => booking.pack?.activity)
          .where((activity) => activity != null)
          .cast<Activity>()
          .toSet()
          .toList();
      update();


      activeList.value =
          bookingList.where((booking) => booking.status == 1).toList();
      completedList.value =
          bookingList.where((booking) => booking.status == 2).toList();
      canceledList.value =
          bookingList.where((booking) => booking.status == 3).toList();

      update();
    } else {
      loading.value = false;
      print("La requête n'a pas réussi");
    }
  }

   rebookBooking(BuildContext context, int id) async {
    Response response = await planningRepo.rebookBooking({}, id);
    if (response.statusCode == 200) {
      Get.back();
      SnackBarMessage().showSuccessSnackBar(
          message: "Votre reréservation a été effectuée avec succès.",
          context: context);
      await getBookings(DateTime.now());
    } else {
      SnackBarMessage().showErrorSnackBar(
          message: "Une erreur est survenue", context: context);
    }
  }

  cancelBooking(String description, BuildContext context, int id) async {
    Response response = await planningRepo.cancelBooking(
        {"description": description}, id);
    if (response.statusCode == 200) {
      Get.back();
      SnackBarMessage().showSuccessSnackBar(
          message: "L'abonnement a été annulé", context: context);
      await getBookings(DateTime.now());
    } else {
      SnackBarMessage().showErrorSnackBar(
          message: "Une erreur est survenue", context: context);
    }
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    _focusedDay = focusedDay;
    _selectedDay = selectedDay;
    getBookings(selectedDay);
    update();
  }
  List<dynamic> loadEventsForDay(DateTime day) {
    List<dynamic> events = [];
    DateFormat format = DateFormat("yyyy-MM-dd");

    for (var session in sessionsList) {
      DateTime sessionDate = format.parse(session.date!);
      DateTime formattedSessionDate = DateTime(sessionDate.year, sessionDate.month, sessionDate.day);

      if (isSameDay(formattedSessionDate, day)) {
        events.add(session);
      }
    }

    return events;
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

const int completed = 2;
const int Active = 1;
const int canceled = 3;

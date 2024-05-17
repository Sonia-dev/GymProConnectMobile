
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:gymproconnect_flutter/data/repository/planning_repo.dart';
import 'package:gymproconnect_flutter/models/planning__model.dart';
import 'package:intl/intl.dart';
import '../../models/activities_model.dart';
import '../../models/my_booking_model.dart';
import '../repository/activities_repo.dart';

class PlanningController extends GetxController {
  final PlanningRepo planningRepo;
  PlanningController({required this.planningRepo});
  RxList<Sessions> sessionList= <Sessions>[].obs;
  DateTime _selectedDay = DateTime.now();
  get selectedDay => _selectedDay;
  set selectedDay(value) => _selectedDay = value;

  DateTime _focusedDay = DateTime.now();
  get focusedDay => _focusedDay;
  set focusedDay(value) => _focusedDay = value;

  RxBool loading  = false.obs;
  RxList<Bookings> bookingList= <Bookings>[].obs;

  RxList<Bookings> activeList= <Bookings>[].obs;
  RxList<Bookings> CancelledList= <Bookings>[].obs;
  RxList<Bookings> CompletedList= <Bookings>[].obs;




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




  Future getBookings(DateTime date) async {
    loading.value =  true ;
    Response response = await planningRepo.getPlanning();
    if (response.statusCode == 200) {
      loading.value =  false ;
      var list = MyBookingModel.fromJson(response.body);

      DateFormat format = DateFormat("yyyy-MM-dd");

      bookingList.value = list.bookings!.where((booking) {
        DateTime bookingDate = format.parse(booking.createdAt.toString());

        DateTime selectedDate = format.parse(DateFormat("yyyy-MM-dd").format(date));

        print("selectedDate$selectedDate");
        print("bookingDate$bookingDate");
        return bookingDate == selectedDate;

      }).toList();
      activeList.value = list.bookings!.where((booking) {
       int status = booking.id!.toInt();


        print("status $status");

        return status == 1;

      }).toList();
      CancelledList.value = list.bookings!.where((booking) {
        int status = booking.id!.toInt();


        print("status $status");

        return status == 2;

      }).toList();
      CompletedList.value = list.bookings!.where((booking) {
        int status = booking.id!.toInt();


        print("status $status");

        return status == 3;

      }).toList();
      update();
    } else {
      loading.value =  false ;
      print("La requête n'a pas réussi");
    }
  }




  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {

      _focusedDay = focusedDay;
      _selectedDay = selectedDay;
      getBookings(focusedDay);
      update();
    }






}
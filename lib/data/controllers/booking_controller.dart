import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:gymproconnect_flutter/data/repository/booking_repo.dart';
import '../../models/activities_model.dart';
import '../../models/booking_model.dart';
import '../repository/activities_repo.dart';

class BookingController extends GetxController {
  final BookingRepo bookingRepo;

  BookingController({required this.bookingRepo});

  RxBool isLoading = false.obs;
  BookingModel bookingModel = BookingModel();
  RxList<BookingModel> bookingsList = <BookingModel>[].obs;

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

  Future getBookings() async {
    isLoading.value = true;


    Response response = await bookingRepo.getBookings();
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {
      isLoading.value = false;

      //  print("*******body ${response.body["data"]["data"]}");

      List<dynamic> responseData = response.body["bookings"];
      print("bookings ok");
      print("bookings list: $responseData");
      bookingsList.value =
          responseData.map((data) => BookingModel.fromJson(data)).cast<
              BookingModel>().toList();
      update();
    }
    else {
      isLoading.value = false;

      print("bookings not okkk");
    }
  }


}
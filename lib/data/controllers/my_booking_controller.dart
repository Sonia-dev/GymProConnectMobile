//
// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:gymproconnect_flutter/data/repository/my_booking_repo.dart';
// import '../../models/activities_model.dart';
// import '../../models/my_booking_model.dart';
// import '../repository/activities_repo.dart';
//
// class MyBookingController extends GetxController {
//   final MyBookingRepo myBookingRepo;
//
//   MyBookingController({required this.myBookingRepo});
//
//   RxBool isLoading =false.obs;
//   Bookings bookingModel = Bookings();
//   RxList<Bookings> bookingList= <Bookings>[].obs;
//   List<Bookings>? sessionList = [];
//
//   @override
//   void onReady() {
//     getBookings(DateTime.now());
//     super.onReady();
//   }
//
//
//
//   @override
//   void onInit() {
//     getBookings(DateTime.now());
//     super.onInit();
//   }
//
//
//
//   Future getBookings(DateTime day) async {
//     isLoading.value=true;
//
//
//     Response response = await myBookingRepo.getMyBookingsList();
//     print("response.body: $response.body");
//     print("statuscode: $response.statusCode");
//
//     if (response.statusCode == 200) {
//       isLoading.value=false;
//
//
//
//       List<dynamic> responseData = response.body["bookings"];
//       print("my bookings ok");
//       print("bookings list: $responseData");
//
//       var list = MyBookingModel.fromJson(response.body["bookings"]);
//
//       bookingList.value = list.bookings!.where((bookings) {
//          return bookings.createdAt == day.year ;
//        }).toList();
//
//
//       update();
//       // sessionList =Bookings.where((Bookings) {
//       //   return session.start!.year == day.year &&
//       //       session.start!.month == day.month &&
//       //       session.start!.day == day.day;
//       // }).toList();
//     }
//     else
//     {
//       isLoading.value =false;
//
//       print("not okkk");
//     }
//   }
//
//
//
//
//
//
//
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gymproconnect_flutter/models/members_model.dart';
import 'package:lottie/lottie.dart';
import '../../models/Attendance_model.dart';
import '../../models/coachs_model.dart';
import '../repository/attendance_repo.dart';

class AttendanceController extends GetxController {
  final AttendanceRepo attendanceRepo;
  RxBool isLoading = false.obs;
  RxList<membersModel> memberslist = <membersModel>[].obs;
  RxList<coachsModel> coachslist = <coachsModel>[].obs;
  @override
  void onReady() {
    getMembers();
    getCoachs();

    super.onReady();
  }


  @override
  void onInit() {
    getMembers();
    getCoachs();
    super.onInit();
  }



  AttendanceController({required this.attendanceRepo});

  Future<void> scan(ScanRequest scanRequest, BuildContext context) async {
    Map<String, dynamic> data = {
      "token": scanRequest.token,

    };
    try {
      Response response = await attendanceRepo.scan(data);

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Container(
              width: 120.w,  // Définir la largeur souhaitée
              height: 140.h, // Définir la hauteur souhaitée
              child: Center(
                child: Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 60.h,
                        width: 60.w,
                        child: Lottie.asset(
                          'assets/lotties/successfully.json',
                        ),
                      ),
                      SizedBox(height: 20.0), // Espacement entre Lottie animation et le texte
                      Text(
                        'Today\'s attendance has been successfully registered',
                        textAlign: TextAlign.center,  // Centrer le texte
                      ),
                    ],
                  ),
                ),
              ),

            ),
          ),
        );
      } else  if (response.statusCode == 409) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Container(
              width: 120.w,  // Définir la largeur souhaitée
              height: 140.h, // Définir la hauteur souhaitée
              child: Center(
                child: Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 60.h,
                        width: 60.w,
                        child: Lottie.asset(
                          'assets/lotties/already_exist.json',
                        ),
                      ),
                      SizedBox(height: 20.0), // Espacement entre Lottie animation et le texte
                      Text(
                        'Attendance is already marked',
                        textAlign: TextAlign.center,  // Centrer le texte
                      ),
                    ],
                  ),
                ),
              ),

            ),
          ),

        );
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).pop();
        });

        print("Today's attendance is already marked");
      }
    } catch (e) {
      print("Error recording attendance: $e");
    }
  }

  Future getMembers() async {
    isLoading.value = true;
    Response response = await attendanceRepo.getMembersList();
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {
      isLoading.value = false;


      List<dynamic> responseData = response.body["data"];
      memberslist.value = responseData.map((data) => membersModel.fromJson(data)).cast<membersModel>().toList();




      print("memberslist: $memberslist");
      update();
    } else {
      isLoading.value = false;
      print("not okkk");
    }
  }
  Future getCoachs() async {
    isLoading.value = true;
    Response response = await attendanceRepo.getCoachsList();
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {
      isLoading.value = false;


      List<dynamic> responseData = response.body["data"];
      coachslist.value = responseData.map((data) => coachsModel.fromJson(data)).cast<coachsModel>().toList();




      print("coachslist: $coachslist");
      update();
    } else {
      isLoading.value = false;
      print("not okkk");
    }
  }



}


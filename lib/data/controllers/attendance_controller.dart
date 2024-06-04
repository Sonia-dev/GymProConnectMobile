import 'package:get/get.dart';
import '../../models/Attendance_model.dart';
import '../repository/attendance_repo.dart';

class AttendanceController extends GetxController {
  final AttendanceRepo attendanceRepo;

  AttendanceController({required this.attendanceRepo});

  Future<void> scan(ScanRequest scanRequest) async {
    Map<String, dynamic> data = {
      "token": scanRequest.token,

    };
    try {
      Response response = await attendanceRepo.scan(data);

      if (response.statusCode == 200) {
        print("Attendance recorded successfully");
      } else  if (response.statusCode == 409) {
        print("Today's attendance is already marked");
      }
    } catch (e) {
      print("Error recording attendance: $e");
    }
  }
}


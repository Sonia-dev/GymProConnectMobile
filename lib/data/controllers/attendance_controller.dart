import 'package:get/get.dart';
import '../../models/Attendance_model.dart';
import '../repository/attendance_repo.dart';

class AttendanceController extends GetxController {
  final AttendanceRepo attendanceRepo;

  AttendanceController({required this.attendanceRepo});

  Future<void> scan(ScanRequest request) async {
    try {
      Response response = await attendanceRepo.scan(request.toJson());

      if (response.statusCode == 200) {
        print("Attendance recorded successfully");
      } else {
        print("Failed to record attendance: ${response.statusText}");
      }
    } catch (e) {
      print("Error recording attendance: $e");
    }
  }
}


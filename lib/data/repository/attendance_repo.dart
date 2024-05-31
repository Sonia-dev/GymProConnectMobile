import 'package:get/get_connect/http/src/response/response.dart';
import '../../utils/uris.dart';
import '../api/api_client.dart';

class AttendanceRepo {
  final ApiClient apiClient;

  AttendanceRepo({required this.apiClient});

  Future<Response> scan(Map<String, dynamic> body) async {
    return await apiClient.postData(Uris.ScannerUrl, body);
  }
}

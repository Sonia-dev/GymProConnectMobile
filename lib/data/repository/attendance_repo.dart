import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../utils/uris.dart';
import '../api/api_client.dart';

class AttendanceRepo {
  final ApiClient apiClient;


  AttendanceRepo({required this.apiClient});

  Future<Response> scan(Map body) async {
    return await apiClient.postData(Uris.ScannerUrl, body);
  }
  Future<Response> getMembersList() async {
    return await apiClient.getData(Uris.MembersUrl);
  }
  Future<Response> getCoachsList() async {
    return await apiClient.getData(Uris.CoachsUrl);
  }
}

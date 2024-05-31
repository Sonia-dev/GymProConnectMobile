import 'package:get/get_connect/http/src/response/response.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class FilterRepo {
  final ApiClient apiClient;

  FilterRepo({required this.apiClient});


  Future<Response> getinfoFilter() async {
    return await apiClient.getData(Uris.infoFilterUrl);
  }
}
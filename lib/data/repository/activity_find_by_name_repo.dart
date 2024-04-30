import 'package:get/get.dart';

import '../api/api_client.dart';

class ActFindByNameRepo {
  final ApiClient apiClient;
  ActFindByNameRepo({required this.apiClient});

  Future<Response> getFindByName(String name) async {
    return await apiClient.getData("activity/find-by-name/?name=$name");
  }
}
import 'package:get/get.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class ActFindByNameRepo {
  final ApiClient apiClient;
  ActFindByNameRepo({required this.apiClient});

  Future<Response> getFindByName(String name) async {
    return await apiClient.getData(Uris.findByNameActivityUrl+"$name");
  }
}
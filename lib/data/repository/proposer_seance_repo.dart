
import 'package:get/get_connect/http/src/response/response.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class ProposerSeanceRepo {
  final ApiClient apiClient;

  ProposerSeanceRepo({required this.apiClient});


  Future<Response> proposerSeance(Map body) async {
    return await apiClient.postData(Uris.proposerSeanceUrl, body);
  }
}
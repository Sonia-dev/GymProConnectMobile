import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gymproconnect_flutter/data/controllers/reviews_controller.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class ReviewRepo {
  final ApiClient apiClient;

  ReviewRepo({required this.apiClient});

  Future<Response> reviews(int Activityid) async {
    return await apiClient.getData("${Uris.reviewUrl}/$Activityid/reviews");
  }

}
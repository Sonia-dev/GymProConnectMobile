import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/constants.dart';
import '../../utils/uris.dart';
import '../api/api_client.dart';

class ReviewRepo {
  final ApiClient apiClient;

  ReviewRepo({required this.apiClient});


  Future<Response> review(int Activityid, Map body) async {
    return await apiClient.postData("${Uris.reviewUrl}/$Activityid", body);
  }
}

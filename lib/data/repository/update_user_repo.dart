import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gymproconnect_flutter/data/api/api_client.dart';
import 'package:gymproconnect_flutter/models/update_user_model.dart';

import '../../utils/uris.dart';

class UpdateRepo {
  final ApiClient apiClient;
  UpdateRepo(this.update, {required this.apiClient});

  final Update update;

  Future<Response> putupdate() async{
    return await apiClient.put(Uris.upDateUserUrl,update.user);
  }
}
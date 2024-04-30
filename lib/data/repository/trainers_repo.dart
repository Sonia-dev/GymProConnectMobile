import 'package:get/get_connect/http/src/response/response.dart';

import '../api/api_client.dart';

class TrainersRepo{
  final ApiClient apiClient;
  TrainersRepo({required this.apiClient});

  Future<Response> getTrainersList() async{
    return await apiClient.getData("auth/users/coaches" );

  }

}
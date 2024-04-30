import 'package:get/get_connect/http/src/response/response.dart';

import '../api/api_client.dart';

class ActivityDetailsRepo{
  final ApiClient apiClient ;
  ActivityDetailsRepo({required this.apiClient});


  Future<Response> getActivityDetails() async{
    return await apiClient.getData("activities/1" );
  }



}
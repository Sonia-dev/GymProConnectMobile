import 'package:get/get.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class PlanningRepo{
  final ApiClient apiClient ;
  PlanningRepo({required this.apiClient});


  Future<Response> getSessionsList() async{
    return await apiClient.getData(Uris.plannigUrl );
  }

}
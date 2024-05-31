import 'package:get/get_connect/http/src/response/response.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class SessionsRepo{
  final ApiClient apiClient ;
  SessionsRepo({required this.apiClient});


  Future<Response> getSessionList() async{
    return await apiClient.getData(Uris.listiongSessionsUrl );
  }}
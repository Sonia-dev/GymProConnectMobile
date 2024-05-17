import 'package:get/get_connect/http/src/response/response.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class ProfilRepo{
  final ApiClient apiClient ;
  ProfilRepo({required this.apiClient});


  Future<Response> getProfil() async{
    return await apiClient.getData(Uris.profilUrl );
  }

}
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../utils/uris.dart';
import '../api/api_client.dart';

class AuthRepo{
  final ApiClient apiClient ;
  AuthRepo({required this.apiClient});


  Future<Response> register(Map body) async{
    return await apiClient.postData(Uris.registerUrl , body);
  }
  Future<Response> login(Map body) async{
    return await apiClient.postData(Uris.loginUrl , body);

  }

//   Future<Response> logout(Map body) async {
//     return await apiClient.postData(Uris.logoutUrl, body);
//   }
//
//
//   void saveUserToken(
//       String token,
//       ) {
//     apiClient.token = token;
//     apiClient.updateHeader(token);
//     box.write("token", token);
//   }
//
//
//
 }
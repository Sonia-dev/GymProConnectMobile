import 'package:get/get.dart';

import '../api/api_client.dart';

class AuthRepo{
  final ApiClient apiClient ;
  AuthRepo({required this.apiClient});


  Future<Response> register(Map body) async{
    return await apiClient.postData("auth/register" , body);
  }
  Future<Response> login(Map body) async{
    return await apiClient.postData("auth/login" , body);
  }



}
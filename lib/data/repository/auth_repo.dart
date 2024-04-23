import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:gymproconnect_flutter/home/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/uris.dart';
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
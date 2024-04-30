import 'package:get/get_connect/http/src/response/response.dart';

import '../api/api_client.dart';

class CategoriesRepo{
  final ApiClient apiClient ;
  CategoriesRepo({required this.apiClient});


  Future<Response> getCategoriesList() async{
    return await apiClient.getData("categories" );
  }



}
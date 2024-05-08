

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymproconnect_flutter/routes/routes_helper.dart';

class ApiClient extends GetConnect implements GetxService {
  final Map<String, String> queryParameters = {};
  final String appBaseUrl;
  late  String token="";
  final  box=GetStorage();
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token= GetStorage().read<String>('token')??"";



    print(token);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }



  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response =
      await get(uri, headers: headers ?? _mainHeaders).then((value) {
        // if(response.statusCode ==401)
        //   Get.offAllNamed(RouteHelper.getSignInPage())
        return value;
      });
      return response;
    } catch (e,stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  Future<Response> getDataWithParms(String uri,
      {Map<String, String>? headers,
        required Map<String, String> query}) async {
    print("$_mainHeaders -------------------------");

    try {
      Response response =
      await get(uri, headers: headers ?? _mainHeaders, query: query)
          .then((value) {
        return value;
      });
      return response;
    } catch (e,stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, Map body) async {
    try {
      Response response =
      await post(uri, body, headers: _mainHeaders).then((value) {
        return value;
      });
      return response;
    } catch (e,stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

}









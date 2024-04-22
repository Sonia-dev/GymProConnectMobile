

import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  final Map<String, String> queryParameters = {};
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response =
      await get(uri, headers: headers ?? _mainHeaders).then((value) {
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









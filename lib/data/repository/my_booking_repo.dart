import 'package:get/get.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class MyBookingRepo{
  final ApiClient apiClient ;
  MyBookingRepo({required this.apiClient});


  Future<Response> getMyBookingsList() async{
    return await apiClient.getData(Uris.myBookingUrl );
  }

}
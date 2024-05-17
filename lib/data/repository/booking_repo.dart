import 'package:get/get.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class BookingRepo{
  final ApiClient apiClient ;
  BookingRepo({required this.apiClient});


  Future<Response> getBookings() async{
    return await apiClient.getData(Uris.bookingUrl );
  }

}
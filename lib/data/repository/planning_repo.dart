import 'package:get/get.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class PlanningRepo{
  final ApiClient apiClient ;
  PlanningRepo({required this.apiClient});


  Future<Response> getSessionsList() async{
    return await apiClient.getData(Uris.plannigUrl );
  }

  Future<Response> getPlanning() async{
    return await apiClient.getData(Uris.myBookingUrl );
  }
  Future<Response> cancelBooking( Map body,int id)async{
    return await apiClient.putData(Uris.cancelBooking+"$id" , body );
  }

  Future<Response> rebookBooking( Map body,int id)async{
    return await apiClient.putData(Uris.rebookBooking+"$id" , body );
  }
  Future<Response> getBookingsList(int statut) async{
    return await apiClient.getData(Uris.BookingsListUrl+"$statut" );
  }


}

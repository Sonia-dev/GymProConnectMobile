import 'package:get/get.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class ActivitiesRepo{
  final ApiClient apiClient ;
  ActivitiesRepo({required this.apiClient});


  Future<Response> getActivityList() async{
    return await apiClient.getData(Uris.listingActivityUrl );
  }
  Future<Response> getActivityById(int activityId) async{
    return await apiClient.getData("${Uris.getActivityById}$activityId" );

  }


  Future<Response> getFilterList() async{
    return await apiClient.getData(Uris.listingActivityUrl );
  }

  Future<Response> getCoachActivity() async{
    return await apiClient.getData("${Uris.listingActivityUrl}" );

  }
}
import 'package:get/get.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class ActivitiesRepo{
  final ApiClient apiClient ;
  ActivitiesRepo({required this.apiClient});

  Future<Response> getActivityList({Map<String, String>? filters}) async {
    return await apiClient.getDataWithParms(Uris.listingActivityUrl, query: filters ?? {});
  }


  Future<Response> getActivityById(int activityId) async{
    return await apiClient.getData("${Uris.getActivityById}$activityId" );

  }

  Future<Response> review(int Activityid, Map body) async {
    return await apiClient.postData("${Uris.reviewUrl}/$Activityid", body);
  }


  Future<Response> getCoachActivity() async{
    return await apiClient.getData("${Uris.listingActivityUrl}" );

  }

  Future<Response> reviews(int Activityid) async {
    return await apiClient.getData("${Uris.getActivityById}$Activityid/reviews");
  }


  Future<Response> getinfoFilter() async {
    return await apiClient.getData(Uris.infoFilterUrl);
  }
}
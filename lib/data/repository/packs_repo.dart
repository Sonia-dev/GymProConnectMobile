import 'package:get/get.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class PacksRepo{
  final ApiClient apiClient ;
  PacksRepo({required this.apiClient});


  Future<Response> getPacksList() async{
    return await apiClient.getData(Uris.listingPacksUrl );
  }

  Future<Response> getPackByID(int packId) async
  {
    return await apiClient.getData("${Uris.listingPacksUrl}/$packId");
  }
  Future<Response> book(Map body) async {
    return await apiClient.postData(Uris.BookUrl, body);
  }
  Future<Response> getSessions(int packId) async
  {
    return await apiClient.getData("${Uris.listingPacksUrl}/$packId/sessions");
  }
}
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

}
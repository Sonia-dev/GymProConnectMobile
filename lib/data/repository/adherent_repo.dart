import 'package:get/get.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class AdherentRepo {
  final ApiClient apiClient;

  AdherentRepo({required this.apiClient});


  Future<Response> getAdherentList() async {
    return await apiClient.getData(Uris.ListingAdherentUrl);
  }
}
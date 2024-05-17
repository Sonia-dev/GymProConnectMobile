import 'package:get/get_connect/http/src/response/response.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class TrainersRepo{
  final ApiClient apiClient;
  TrainersRepo({required this.apiClient});

  Future<Response> getTrainersList() async{
    return await apiClient.getData(Uris.listingTrainersUrl );

  }
  Future<Response> getTrainerById(int trainerId) async
  {
    return await apiClient.getData("${Uris.listingTrainersUrl}/$trainerId");
  }

}
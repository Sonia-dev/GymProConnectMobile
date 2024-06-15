import 'package:get/get_connect/http/src/response/response.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class TrainersRepo{
  final ApiClient apiClient;
  TrainersRepo({required this.apiClient});

  Future<Response> getTrainersList() async{
    return await apiClient.getData(Uris.listingTrainersUrl );

  }Future<Response> getTrainersforagentList() async{
    return await apiClient.getData(Uris.listingTrainerforAgentsUrl );

  }

  Future<Response> review(int CoachId,Map body) async {
    return await apiClient.postData("${Uris.reviewCoachUrl}$CoachId", body);
  }

  Future<Response> getreviews(int coachId) async {
    return await apiClient.getData("${Uris.reviewsCoachUrl}$coachId");
  }




  Future<Response> getTrainerById(int trainerId) async
  {
    return await apiClient.getData("${Uris.DetailsUserUrl}/$trainerId");
  }

}
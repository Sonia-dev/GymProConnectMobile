import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/repository/trainers_repo.dart';

import '../../models/trainers_model.dart';

class TrainersController extends GetxController{
  final TrainersRepo trainersRepo ;
  TrainersController({required this.trainersRepo});
 bool isLoading=false;
  RxList<CoachesData> trainersList= <CoachesData>[].obs;

@override
void onInit() {
  getTrainers();
  super.onInit();
}
  Future getTrainers() async {
isLoading=true;
    Response response = await trainersRepo.getTrainersList();
   // print("tessst");
    print(" ${response.statusCode}");
update();
    if (response.statusCode == 200) {
      isLoading=false;
      print("trainers ooook ");
      List<dynamic> responseData = response.body["coaches"];
      trainersList.value = responseData.map((data) => CoachesData.fromJson(data)).cast<CoachesData>().toList();
      update();
    }
    else{
      print("trainer echeec");
    print("statusCode ${response.statusCode}");
    }

  }
}
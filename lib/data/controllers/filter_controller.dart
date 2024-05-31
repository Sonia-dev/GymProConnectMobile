import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gymproconnect_flutter/data/repository/filter_repo.dart';
import '../../models/filter_model.dart';
class FilterController extends GetxController {
  final FilterRepo filterRepo;
  RxBool isLoading =false.obs;
  filterModel filter = filterModel();

  FilterController({required this.filterRepo});


  @override
  void onReady() {
    getinfoFilter();
    super.onReady();
  }

  @override
  void onInit() {
    getinfoFilter();
    super.onInit();
  }


  Future<void> getinfoFilter() async {
    isLoading.value = true;
    Response response = await filterRepo.getinfoFilter();


    if (response.statusCode == 200) {
      isLoading.value = false;

      filter = filterModel.fromJson(response.body);
    } else {
      print(response.body);
      isLoading.value = false;
      print("Erreur lors de la récupération de liste de filter.");
    }
  }

}
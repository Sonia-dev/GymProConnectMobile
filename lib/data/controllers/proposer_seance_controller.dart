
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/proposer_seance_model.dart';
import '../../snack_bar.dart';
import '../repository/proposer_seance_repo.dart';

class ProposerSeanceController extends GetxController {
  late final ProposerSeanceRepo proposerSeanceRepo;

  ProposerSeanceController({required this.proposerSeanceRepo});





  dynamic activityId ;
  // dynamic coach_id ;
  // dynamic studio_id ;
  // dynamic date ;
  // dynamic hourStart ;
  //  dynamic capacity ;

   TextEditingController coach_id = TextEditingController();
    TextEditingController studio_id = TextEditingController();
   TextEditingController date = TextEditingController();
   TextEditingController hourStart = TextEditingController();
   TextEditingController capacity = TextEditingController();

  @override
  void onInit() {

    clearFields();

    super.onInit();
  }


   clearFields(){
     coach_id.clear();
     studio_id.clear();
     date.clear();
     hourStart.clear();
     capacity.clear();


   }



  Future<void> proposerSeance( ProposerSeanceModel proposer, BuildContext context) async {
    Map<String, dynamic> data = {
      "activity_id": proposer.activity_id,
      "coach_id": proposer.coach_id,
      "studio_id": proposer.studio_id,
      "date": proposer.date,
      "hourStart": proposer.hourStart,
      "capacity": proposer.capacity,
    };

    try {
      print('tryyy');

      Response response = await proposerSeanceRepo.proposerSeance(data);
      if (response.statusCode == 200) {
        SnackBarMessage()
            .showSuccessSnackBar(
            message: "Votre proposition a été envoyée avec succès", context: context);

        clearFields();
        print('okkkk');
        update();
      } else {
        SnackBarMessage().showErrorSnackBar(
            message: "Désolé, la proposition n'a pas pu être envoyée. Veuillez réessayer plus tard.",
            context: context);
        print("${response.statusCode}");
        print('not okkkk');
        update();
      }
    } catch (e, s) {
      update();
    }
  }
}
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gymproconnect_flutter/data/repository/review_repo.dart';
import 'package:gymproconnect_flutter/screens/home/reviews.dart';
import 'package:path/path.dart';

import '../../models/reviews_model.dart';
import '../../snack_bar.dart';

class ReviewController extends GetxController {
  final ReviewRepo reviewRepo;

  ReviewController({required this.reviewRepo});

  //final TextEditingController CommentController = TextEditingController();





  Future<void> reviews(ReviewRequest reviewRequest, BuildContext context,int ActivityId) async {
    Map<String, dynamic> data = {
      "rating": reviewRequest.rating,
      "comment": reviewRequest.comment,
    };
    try {
      Response response = await reviewRepo.review(ActivityId,data);

      if (response.statusCode == 200) {
        SnackBarMessage()
            .showSuccessSnackBar(message: "Your review has been added. Thank you!", context: context);

      }


      else  {
        SnackBarMessage()
            .showSuccessSnackBar(message: "We're sorry, an unexpected error has occurred.",context: context);
;
      }

    }
    catch (e, s) {
      print("Erreur : $e");
      print("StackTrace : $s");
      // print("$test");
    }
  }
}
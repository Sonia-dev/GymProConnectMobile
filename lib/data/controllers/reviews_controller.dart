import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/reviews_model.dart';
import '../repository/review_repo.dart';

class ReviewsController extends GetxController {
  final ReviewRepo reviewRepo;

  ReviewsController({required this.reviewRepo});

  RxBool isLoading = false.obs;
  RxList<Reviews> reviewsList = <Reviews>[].obs;




  @override
  void onReady() {
    getReviews(1);
    super.onReady();
  }

  @override
  void onInit() {
    getReviews(1);
    super.onInit();
  }


  Future getReviews(int activityId) async {
    print("tesst");

    isLoading.value = true;
    Response response = await reviewRepo.reviews(activityId);
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {
      isLoading.value = false;

      List<dynamic> responseData = response.body["reviews"];

      reviewsList.value = responseData.map((data) => Reviews.fromJson(data))
          .cast<Reviews>()
          .toList();


      update();
    } else {
      isLoading.value = false;
      print("not okkk");
    }
  }
}
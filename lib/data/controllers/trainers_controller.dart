import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';
import 'package:gymproconnect_flutter/data/repository/trainers_repo.dart';
import 'package:gymproconnect_flutter/models/activities_model.dart';
import 'package:gymproconnect_flutter/models/categories_model.dart';

import '../../models/review_model.dart';
import '../../models/reviews_model.dart';
import '../../models/trainers_model.dart';
import '../../snack_bar.dart';


class TrainersController extends GetxController {
  final TrainersRepo trainersRepo;

  TrainersController({required this.trainersRepo});

  RxBool isLoading =false.obs;
  RxList<TrainerDetail> trainersList = <TrainerDetail>[].obs;
  RxList<TrainerDetail> trainersAgentList = <TrainerDetail>[].obs;
  TrainerDetail trainerDetail = TrainerDetail();
  TabController? tabController;
  final TextEditingController commentController = TextEditingController();
  var rating = 0.0.obs ;
  RxList<Reviews> reviewsList = <Reviews>[].obs;

  var userReviewsList = <Reviews>[].obs;


  RxBool loading = false.obs;


  RxBool loadReview = false.obs;
  @override
  void onReady() {
    getTrainers();
    getTrainersforAgent();
   // tabController = new TabController( length: 2, vsync: this);

    super.onReady();
  }




  @override
  void onInit() {
    getTrainers();
    getTrainersforAgent();
    //tabController = new TabController( length: 2, vsync: this);

    super.onInit();
  }


  @override
  void onClose() {

    tabController?.dispose();

  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }



  Future<void> getTrainers() async {
    isLoading.value=true;
    Response response = await trainersRepo.getTrainersList();


    if (response.statusCode == 200) {
      isLoading.value =false;
      List<dynamic> responseData = response.body["coaches"];
      print("responseData :$responseData");
      trainersList.value = responseData.map((data) => TrainerDetail.fromJson(data)).cast<TrainerDetail>().toList();



      print("trainers ok");
      print("body:${trainersList}");
      update();


    } else {
      isLoading.value =false;

      print("statuscode: ${response.statusCode}");
      print("Erreur lors de la récupération des données de trainer.");
    }
  }
  Future<void> getTrainersforAgent() async {
    isLoading.value=true;
    Response response = await trainersRepo.getTrainersforagentList();


    if (response.statusCode == 200) {
      isLoading.value =false;
      List<dynamic> responseData = response.body["coaches"];
      print("responseData :$responseData");
      trainersAgentList.value = responseData.map((data) => TrainerDetail.fromJson(data)).cast<TrainerDetail>().toList();



      print("trainers Agent ok");
      print("body:${trainersAgentList}");
      update();


    } else {
      isLoading.value =false;

      print("statuscode: ${response.statusCode}");
      print("Erreur lors de la récupération des données de trainer Agent.");
    }
  }



  Future<void> review(ReviewRequest reviewRequest, BuildContext context,int CoachId) async {

    loadReview.value = true;
    Map<String, dynamic> data = {
      "rating": reviewRequest.rating,
      "comment": reviewRequest.comment,
    };
    try {
      Response response = await trainersRepo.review(CoachId,data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        loadReview.value = false;


        getReviews(CoachId);
        // SnackBarMessage()
        //  .showSuccessSnackBar(message: "Votre avis a été ajouté. Merci !", context: context);

        tabController?.index = 2;
        FocusScope.of(context).unfocus();
        resetFields();
        update();
      }


      else  {
        loadReview.value = false;

        SnackBarMessage()
            .showErrorSnackBar(message: "Nous sommes désolés, une erreur inattendue s'est produite.",context: context);
        ;
      }

    }
    catch (e, s) {
      print("Erreur : $e");
      print("StackTrace : $s");
      // print("$test");
    }
  }

  Future getReviews(int coachId) async {

    print("tesssssst");

    loading.value = true;
    Response response = await trainersRepo.getreviews(coachId);

   try {
     if (response.statusCode == 200) {
       loading.value = false;

       List<dynamic> responseData = response.body["reviews"];
       print("tesssssst");


       reviewsList.value = responseData.map((data) => Reviews.fromJson(data)).cast<Reviews>().toList();


       // Lire l'ID de l'utilisateur stocké
       int userId = GetStorage().read('userId');

       // Filtrer les avis de l'utilisateur connecté
       userReviewsList.value = reviewsList.where((review) => review.userId == userId).toList();

       print("reviewsList$reviewsList");

       update();


     } else {
       loading.value = false;
       print("not okkk");
     }
   }catch(e,st){

     print(st);
   }

  }



  Future<void> getTrainerByID(int trainerId) async {
    isLoading.value =true;
    Response response = await trainersRepo.getTrainerById(trainerId);


    if (response.statusCode == 200) {
      isLoading.value=false;
print("tesst");

      trainerDetail = TrainerDetail.fromJson(response.body["user"]);

      print("trainerDetail:${trainerDetail.surname}");

    } else {
      isLoading.value=false;
      print("Erreur lors de la récupération des données de coach.");
    }
  }


  void resetFields() {
    commentController.clear();

    rating.value = 0.0;
  }



}

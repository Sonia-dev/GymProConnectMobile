
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:gymproconnect_flutter/data/repository/packs_repo.dart';
import 'package:gymproconnect_flutter/screens/home/abonnement.dart';
import '../../models/book_model.dart';
import '../../models/packs_model.dart';
import '../../models/review_model.dart';
import '../../models/reviews_model.dart';
import '../../models/sessions_model.dart';
import '../../snack_bar.dart';

class PacksController extends GetxController {
  final PacksRepo packsRepo;

  PacksController({required this.packsRepo});

  RxBool isLoading = false.obs;

  RxBool loading = false.obs;


  RxBool showPrice = false.obs;

  RxList<Reviews> reviewsList = <Reviews>[].obs;
  final TextEditingController commentController = TextEditingController();
  double ratingController = 0.0 ;



  TabController? tabController;


  PacksData packsData = PacksData();
  RxList<PacksData> packsList = <PacksData>[].obs;
  RxList<SessionData> sessionsList = <SessionData>[].obs;
  RxList<PacksData> filteredPacksList = <PacksData>[].obs;

  @override
  void onReady() {
    getPacks();
  //  tabController = new TabController( length: 2, vsync: this);

    super.onReady();
  }


  @override
  void onInit() {
    getPacks();
  //  tabController = new TabController( length: 2, vsync: this);
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

  Future getPacks() async {
    Response response = await packsRepo.getPacksList();
    print("response.body: ${response.body}");
    print("statuscode: ${response.statusCode}");

    if (response.statusCode == 200) {
      List<dynamic> responseData = response.body["packs"];
      packsList.value = responseData.map((data) => PacksData.fromJson(data))
          .cast<PacksData>()
          .toList();
      filteredPacksList.value = packsList;
      isLoading.value = false;


      update();
    } else {
      isLoading.value = false;
      print("not okkk");
    }
  }


  void filterByPriceRange(double minPrice, double maxPrice) {
    filteredPacksList.value = packsList.where((pack) {
      double packPrice = double.tryParse(pack.price.toString()) ?? 0.0;
      return packPrice >= minPrice && packPrice <= maxPrice;
    }).toList();
  }



  void filterPacks(String searchText) {
    if (searchText.isEmpty) {
      filteredPacksList.value = packsList;
    } else {
      filteredPacksList.value = packsList.where((pack) {
        return pack.name!.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    }
  }


  Future<void> getPackByID(int packId) async {
    isLoading.value =true;
    Response response = await packsRepo.getPackByID(packId);


    if (response.statusCode == 200) {
      isLoading.value=false;
      print("testttt");
      packsData = PacksData.fromJson(response.body["pack"]);
      print("testttt2");
      print("body:${response.body}");


    } else {
      isLoading.value=false;
      print("Erreur lors de la récupération des données de pack.");
    }
  }
  Future<void> book(BookRequest bookRequest, BuildContext context) async {
    Map<String, dynamic> data = {
      "pack_id": bookRequest.pack_id,
      "status": bookRequest.status,
    };

    try {
      Response response = await packsRepo.book(data);

      if (response.statusCode == 200) {
        // Affichage du message de succès
        SnackBarMessage()
            .showSuccessSnackBar(message: "Votre pack a été réservé.", context: context);

        await Future.delayed(const Duration(seconds: 1));

        bool goToSubscriptionList = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Souhaitez-vous consulter votre liste d'abonnements ?"),
              actions: <Widget>[
                TextButton(
                  child: Text("Non"),
                  onPressed: () {
                    Navigator.of(context).pop(false); // Ne pas naviguer
                  },
                ),
                TextButton(
                  child: Text("Oui"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => abonnement()),
                    );                         },
                ),
              ],
            );
          },
        );

        // Si l'utilisateur a choisi "Oui", naviguer vers la page des abonnements
        if (goToSubscriptionList == true) {
          // Naviguer vers la page des abonnements
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => abonnement()),
          );
        }

        // Appel de la méthode update si nécessaire
        update();
      } else {
        // Affichage du message d'erreur
        SnackBarMessage().showErrorSnackBar(
          message:
          "Désolé, votre réservation n'a pas été effectuée. Veuillez réessayer une autre fois.",
          context: context,
        );
      }
    } catch (e, s) {
      print("Erreur : $e");
      print("StackTrace : $s");
      // Vous pouvez afficher un message d'erreur générique si nécessaire
    }
  }
  Future getSessions(int packId) async {

    Response response = await packsRepo.getSessions(packId);
    print("response.body: $response.body");
    print("statuscode: $response.statusCode");

    if (response.statusCode == 200) {

      List<dynamic> responseData = response.body;
      print("packs ok");
      sessionsList.value = responseData.map((data) => SessionData.fromJson(data)).cast<SessionData>().toList();

      update();
    }
    else
    {
      print("not okkk");
    }
  }

  void resetFields() {
    commentController.clear();
    ratingController = 0.0;
  }

  Future getReviews(int packId) async {

    print("tesssssst");

    loading.value = true;
    Response response = await packsRepo.getreviews(packId);

    if (response.statusCode == 200) {
      loading.value = false;

      List<dynamic> responseData = response.body["reviews"];
      print("tesssssst");


      reviewsList.value = responseData.map((data) => Reviews.fromJson(data)).cast<Reviews>().toList();

      print("reviewsList$reviewsList");

      update();


    } else {
      loading.value = false;
      print("not okkk");
    }
  }

  Future<void> postreview(ReviewRequest reviewRequest, BuildContext context,int PackId) async {
    Map<String, dynamic> data = {
      "rating": reviewRequest.rating,
      "comment": reviewRequest.comment,
    };
    try {
      Response response = await packsRepo.postreview(PackId,data);
      loading.value = true;

      if (response.statusCode == 200 || response.statusCode == 201) {
        loading.value = false;

        SnackBarMessage()
         .showSuccessSnackBar(message: "Votre avis a été ajouté. Merci !", context: context);
        update();
        tabController?.index = 2;
      }


      else  {
        loading.value = false;

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






}
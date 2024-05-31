import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';
import 'package:gymproconnect_flutter/models/register_model.dart';
import 'package:gymproconnect_flutter/routes/routes_helper.dart';
import 'package:info_popup/info_popup.dart';
import '../../models/login_model.dart';
import '../../screens/gym_pro_layout.dart';
import '../../snack_bar.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  final TextEditingController NameController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController adressController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  String? userRole ;
  String? userName ;
  String? userSurname ;
  int? userId ;




  // String? getTokenFromCache() {
  //   String? token = GetStorage().read<String>('token');

  //   return token;
  // }


  Future<void> register(UserRequest userRequest, BuildContext context) async {
    Map<String, dynamic> data = {
      "name": userRequest.name,
      "surname": userRequest.surName,
      "phone": userRequest.number,
      "email": userRequest.email,
      "adress": userRequest.adress,
      "birth_date": "2000-01-01",
      "password": userRequest.password,
      "status": 1,
    };

    try {
      print('tryyy');

      Response response = await authRepo.register(data);
      if (response.statusCode == 200) {
        SnackBarMessage()
            .showSuccessSnackBar(message: "Votre demande d'inscription a été envoyée avec succès", context: context);

        Get.offAllNamed(RouteHelper.getSignUpPage());

        print('okkkk');
        update();
      } else {
        SnackBarMessage().showErrorSnackBar(message: "Désolé, la demande n'a pas pu être envoyée. Veuillez réessayer plus tard.", context: context);
        print("${response.statusCode}");
        print('not okkkk');
        update();
      }
    } catch (e, s) {

      update();
    }
  }

  Future<void> login(LoginRequest userRequest, BuildContext context) async {
    Map<String, dynamic> data = {
      "email": userRequest.email,
      "password": userRequest.password,
    };
    try {

      Response response = await authRepo.login(data);

      if (response.statusCode == 200) {
        String token = response.body["success"]["token"];
        userRole = response.body["success"]["role"][0];
        userId =response.body["success"]["userId"];

        authRepo.saveUserToken(token);
        await GetStorage().write('userId', userId);


        debugPrint('user role is $userRole');
        debugPrint('user id is $userId');
        print('token: $token');



        if (userRole == "adherent") {

          Get.offAllNamed(RouteHelper.getHome());
        }
        else if (userRole == "coach") {

          Get.offAllNamed(RouteHelper.getHomeCoach());

        }
        else if (userRole == "agent") {
          Get.offAllNamed(RouteHelper.getHomeAgent());


        }
      }



      else if (response.statusCode == 401) {

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: InfoPopupWidget(
              contentTitle: "Email ou mot de passe incorrects.",
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          ),
        );
      }
      else {

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: InfoPopupWidget(
              contentTitle: "Erreur lors de la connexion : ${response.statusCode}",
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          ),
        );
      }
    }
    catch (e, s) {
      print("Erreur : $e");
      print("StackTrace : $s");
      // print("$test");
    }
  }




  Future goto() async {




    print("userLoggedIn()${userLoggedIn()}");
    if (userLoggedIn()) {
      Get.offAllNamed(RouteHelper.getHome());
      if (userRole == "adherent") {


        Get.offAllNamed(RouteHelper.getHome());

      }
      else if (userRole == "coach") {

        Get.offAllNamed(RouteHelper.getHomeCoach());



      }
      else if (userRole == "agent") {
        Get.offAllNamed(RouteHelper.getHomeAgent());


       }
    } else {
      Get.offAllNamed(RouteHelper.getSignUpPage());
    }
  }




  clearData(){
    GetStorage().remove("token");
  }



  bool userLoggedIn() {
    return GetStorage().hasData("token")
        ? true
        : false;
  }



  }

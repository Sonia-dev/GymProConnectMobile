import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymproconnect_flutter/Shared/local_network.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';
import 'package:gymproconnect_flutter/models/logout_model.dart';
import 'package:gymproconnect_flutter/models/register_model.dart';
import 'package:gymproconnect_flutter/routes/routes_helper.dart';
import 'package:gymproconnect_flutter/screens/home/main_home.dart';
import 'package:info_popup/info_popup.dart';
import '../../constants/constants.dart';
import '../../globals.dart';
import '../../models/login_model.dart';
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

  get apiClient => null;

  String? userRole ;



  // String? getTokenFromCache() {
  //   String? token = GetStorage().read<String>('token');

  //   return token;
  // }
  final box = GetStorage();

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

      await box.write('useToken', token);


      String? savedToken = box.read('userToken');


      if (response.statusCode == 200) {

        debugPrint('Token saved successfully: $savedToken');
        String token = response.body["success"]["token"];
        userRole = response.body["success"]["role"][0];

        debugPrint('use role is $userRole');

       // authRepo.saveUserToken(token);

        Navigator.pushReplacementNamed(context, '/home');

              update();


      }
      else if (response.statusCode == 401) {
        // Email ou mot de passe incorrects
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
      } else {
        // Autre erreur
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
    } catch (e, s) {
      print("Erreur : $e");
      print("StackTrace : $s");
      // print("$test");
    }
  }
  Future<void> logout(BuildContext context) async {



    try {
      // Suppression du token enregistré
      await box.remove('userToken');

      // Navigation vers l'écran de connexion ou une autre destination appropriée
      Navigator.pushReplacementNamed(context, '/login');

      // Mise à jour de l'UI si nécessaire
      update();
    } catch (e) {
      // Gestion des erreurs...
    }





      }



  Future goto() async {
    if (userLoggedIn()) {

      Navigator.pushReplacement(
        Get.context!,
        MaterialPageRoute(builder: (context) =>  MainHome()),
      );
    } else {
      Get.offAllNamed(RouteHelper.getSignUpPage());
    }
  }




  clearData(){
    box.remove("token");
  }



  bool userLoggedIn() {
    return box.hasData("token")
        ? true
        : false;
  }



  }

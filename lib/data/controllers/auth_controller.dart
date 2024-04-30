import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';
import 'package:gymproconnect_flutter/models/register_model.dart';
import 'package:info_popup/info_popup.dart';
import '../../globals.dart';
import '../../models/login_model.dart';



class AuthController extends GetxController{
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
String? getTokenFromCache() {

  String? token = GetStorage().read<String>('token');

  return token;
}

Future<void> register(UserRequest userRequest,BuildContext context) async{

  Map<String, dynamic> data = {
    "nom": userRequest.name,
    "prenom": userRequest.surName,
    "telephone": userRequest.number,
    "email": userRequest.email,
    "adresse": userRequest.adress,
    "dateNaissance": userRequest.dateOfBirth,
    "password": userRequest.password,
  };

  try {
    print('tryyy');

    Response response = await authRepo.register(data);
    if(response.statusCode==200){
      InfoPopupWidget(contentTitle:"Votre demande d'inscription a été envoyée à l'administrateur. Vous pourrez accéder à l'application dès qu'elle sera approuvée !", child:  Icon(
        Icons.info,
        color: Colors.pink,
      ),);

print('okkkk');
      update();
    }
    else{
      print('not okkkk');


    }
  }catch(e,s){

    print("eeeeeeeeeeee,$e");

    print("stack,$s");




  }

}
Future<void> login(LoginRequest userRequest,BuildContext context) async{


  Map<String, dynamic> data = {
    "email": userRequest.email,
    "password": userRequest.password,
  };

  try {
    print("tryy");
    Response response = await authRepo.login(data);
    if (response.statusCode == 200) {

      // Connexion réussie
      String token = response.body["success"]["token"];
       userName = response.body["success"]["userId"]["name"];
       surName= response.body["success"]["userId"]["surname"];

      await GetStorage().write('token', token);
      Navigator.pushReplacementNamed(context, '/home');

      // Mettez à jour l'état de votre application ou effectuez d'autres actions nécessaires
      update();

      print("Token enregistré avec succès : $token");
    } else if (response.statusCode == 422) {
      // Erreur de validation côté serveur
      print("Erreur de validation : ${response.statusCode}");
      print("Détails de l'erreur : ${response.body}");
    } else {
      // Autre erreur
      print("Erreur lors de la connexion : ${response.statusCode}");
    }
  } catch (e, s) {
    print("Erreur : $e");
    print("StackTrace : $s");
   // print("$test");
  }
}

}


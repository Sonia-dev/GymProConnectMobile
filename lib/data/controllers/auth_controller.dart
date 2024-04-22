import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';
import 'package:gymproconnect_flutter/models/register_model.dart';

class AuthController extends GetxController{
final AuthRepo registerRepo;
AuthController({required this.registerRepo});


final TextEditingController fullNameController = TextEditingController();
final TextEditingController surNameController = TextEditingController();

final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController adressController = TextEditingController();
final TextEditingController dateOfBirthController = TextEditingController();
final TextEditingController passwordController = TextEditingController();


Future<void> register(UserRequest userRequest) async{


  print('request');
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

    Response response = await registerRepo.register(data);
    if(response.statusCode==200){

print('okkkk');
      update();
    }
    else{
      print('okkkk');


    }
  }catch(e,s){

    print("eeeeeeeeeeee,$e");

    print("stack,$s");




  }

}
}
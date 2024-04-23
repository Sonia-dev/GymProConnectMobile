import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';
import 'package:gymproconnect_flutter/home/login.dart';
import 'package:gymproconnect_flutter/models/register_model.dart';

import '../../models/login_model.dart';

class AuthController extends GetxController{
final AuthRepo authRepo;
AuthController({required this.authRepo});



final TextEditingController fullNameController = TextEditingController();
final TextEditingController surNameController = TextEditingController();

final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController adressController = TextEditingController();
final TextEditingController dateOfBirthController = TextEditingController();
final TextEditingController passwordController = TextEditingController();


Future<void> register(UserRequest userRequest) async{

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
Future<void> login(LoginRequest userRequest) async{

  Map<String, dynamic> data = {
    "email": userRequest.email,
    "password": userRequest.password,
  };
  try {
    print('tryyy');
    Response response = await authRepo.login(data);
    if(response.statusCode==200){

      print("okkkkokkkkokkkkokkkkokkkk${response.statusCode}");
      update();
    }
    else{
      print("Not OKKK${response.statusCode}");
      print('Not OKKK');
    }
  }catch(e,s){

    print("eeeeeeeeeeee,$e");

    print("stack,$s");




  }

}

}
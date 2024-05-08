import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymproconnect_flutter/Shared/local_network.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';
import 'package:gymproconnect_flutter/data/repository/booking_repo.dart';
import 'package:gymproconnect_flutter/models/booking_model.dart';
import 'package:gymproconnect_flutter/models/register_model.dart';
import 'package:info_popup/info_popup.dart';
import '../../globals.dart';
import '../../models/login_model.dart';

class BookingController extends GetxController {
  final BookingRepo bookingRepo;

  BookingController({required this.bookingRepo});

  // final TextEditingController NameController = TextEditingController();
  // final TextEditingController surNameController = TextEditingController();
  //
  // final TextEditingController phoneNumberController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController adressController = TextEditingController();
  // final TextEditingController dateOfBirthController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  get apiClient => null;

  String? getTokenFromCache() {
    String? token = GetStorage().read<String>('token');

    return token;
  }

  Future<void> booking(Booking booking, BuildContext context) async {
    Map<String, dynamic> data = {
      "activity_id": booking.activityId,
      "status": booking.status,
      "updatedAt": booking.updatedAt,
      "createdAt": booking.createdAt,
      "id": booking.id,

    };

    try {
      print('tryyy');

      Response response = await bookingRepo.Booking();
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (_) =>
              AlertDialog(
                content: InfoPopupWidget(
                  contentTitle:
                  "Votre réservation a été effectuée avec succès!",
                  child: Icon(
                    Icons.info,
                    color: Colors.pink,
                  ),
                ),
              ),
        ); // Afficher le popup
        print('okkkk');
        update();
      } else {
        showDialog(
          context: context,
          builder: (_) =>
              AlertDialog(
                content: InfoPopupWidget(
                  contentTitle:
                  "La ressource demandée est introuvable. Veuillez réessayer plus tard.",
                  child: Icon(
                    Icons.info,
                    color: Colors.pink,
                  ),
                ),
              ),
        ); // Afficher le popup
        print("${response.statusCode}");
        print('not okkkk');
        update();
      }
    } catch (e, s) {
      showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(
              content: InfoPopupWidget(
                contentTitle:
                "Une erreur inattendue s'est produite. Veuillez réessayer plus tard.",
                child: Icon(
                  Icons.info,
                  color: Colors.pink,
                ),
              ),
            ),
      ); // Afficher le popup
      print("eeeeeeeeeeee,$e");
      print("stack,$s");
      update();
    }
  }
}

import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/repository/update_user_repo.dart';

class UpDateController extends GetxController{
  final UpdateRepo updateRepo;
  UpDateController({required this.updateRepo});
 // RxList<dynamic> activities= <dynamic>[].obs;
  @override
  void onInit() {
    putUpdate();
    super.onInit();
  }
  void putUpdate() async {
    try {
      // Appel de la méthode de mise à jour de l'utilisateur dans le repository
      final response = await updateRepo.putupdate(); // Assurez-vous d'adapter cette ligne en fonction de votre implémentation du repository

      // Vérification du statut de la réponse
      if (response.statusCode == 200) {
        // Succès : Afficher un message à l'utilisateur par exemple
        print('User updated successfully');
      } else {
        // Échec : Afficher un message d'erreur à l'utilisateur par exemple
        print('Failed to update user: ${response.body}');
      }
    } catch (e) {
      // Gestion des erreurs
      print('Error updating user: $e');
    }
  }
}
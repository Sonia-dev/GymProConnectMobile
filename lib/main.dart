import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymproconnect_flutter/data/api/api_client.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';
import 'package:gymproconnect_flutter/routes/routes_helper.dart';
import 'package:gymproconnect_flutter/screens/home/login.dart';
import 'package:gymproconnect_flutter/screens/home/main_home.dart';
import 'package:gymproconnect_flutter/screens/home/menu_screen.dart';
import 'package:gymproconnect_flutter/screens/home/splash.dart';
import 'package:gymproconnect_flutter/utils/uris.dart';

import 'Shared/local_network.dart';
import 'data/controllers/auth_controller.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.cacheInitialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController(authRepo: AuthRepo(apiClient: ApiClient(appBaseUrl: Uris.baseUrl))));

    // Récupération du token depuis GetStorage
    String? token = GetStorage().read<String>('token');

    return GetMaterialApp(
      getPages: RouteHelper.routes,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //initialRoute: '/splash',

      home:
      token != null && token.isNotEmpty ? MenuScreen() : Login(),
    );
  }
}
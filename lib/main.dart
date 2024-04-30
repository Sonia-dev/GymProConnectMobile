import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymproconnect_flutter/data/api/api_client.dart';
import 'package:gymproconnect_flutter/data/repository/auth_repo.dart';
import 'package:gymproconnect_flutter/home/login.dart';
import 'package:gymproconnect_flutter/home/main_home.dart';
import 'package:gymproconnect_flutter/splash.dart';
import 'package:gymproconnect_flutter/utils/uris.dart';


import 'data/controllers/auth_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await CacheNetwork.cacheInitialization();
  // CacheNetwork.getCacheData(key: 'token');
  // print("token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController(authRepo: AuthRepo(apiClient: ApiClient(appBaseUrl: Uris.baseUrl))));
    return GetMaterialApp(
        routes: {
          '/home': (context) => MainHome(),
          '/login':(context) => login(),

        },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splash()

    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:gymproconnect_flutter/routes/routes_helper.dart';
import 'package:gymproconnect_flutter/screens/home/qr_code.dart';
import 'package:gymproconnect_flutter/screens/home/scanner.dart';
import 'package:gymproconnect_flutter/screens/home/test.dart';

import 'Shared/local_network.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.cacheInitialization();
  await dep.init();
  runApp(const MyApp());
}




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAState();
}

class _MyAState extends State<MyApp> {

  final _initialRoot = RouteHelper.getSplashPage();


  @override
    Widget build(BuildContext context) {

      return ScreenUtilInit(
        designSize: const Size(414,811),
        useInheritedMediaQuery: true,
        child: GetMaterialApp(

          defaultTransition: Transition.fadeIn,
          getPages: RouteHelper.routes,
          debugShowCheckedModeBanner: false,
          title: 'Gym Pro Connect',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
            useMaterial3: true,
          ),
          initialRoute: _initialRoot,
         // home:QrCode(),
        ),
      );
    }

}




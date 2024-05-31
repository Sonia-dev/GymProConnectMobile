import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:gymproconnect_flutter/routes/routes_helper.dart';
import 'package:gymproconnect_flutter/screens/agent/Members.dart';
import 'package:gymproconnect_flutter/screens/agent_layout.dart';
import 'package:gymproconnect_flutter/screens/gym_pro_layout.dart';
import 'package:gymproconnect_flutter/screens/home/login.dart';
import 'package:gymproconnect_flutter/screens/home/qr_code.dart';
import 'package:gymproconnect_flutter/screens/agent/scanner.dart';
import 'package:gymproconnect_flutter/screens/home/test.dart';
import 'package:gymproconnect_flutter/screens/coach_layout.dart';

import 'Shared/local_network.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  final box = GetStorage();


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

         //home://AgentLayout(),
        // CoachLayout(),
        // GymProLayout(),

        ),
      );
    }

}




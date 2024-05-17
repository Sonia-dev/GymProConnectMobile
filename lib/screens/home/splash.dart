import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:gymproconnect_flutter/screens/home/login.dart';
import 'package:gymproconnect_flutter/screens/onboarding_screens/onboarding.dart';

import '../../data/controllers/splash_controller.dart';






class Splash extends GetView<SplashScreenController> {
  const Splash({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image.asset("assets/splash.png",
          height: 218.h,
          width: 167.w,),),
    );
  }
}







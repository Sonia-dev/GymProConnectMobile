


import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'auth_controller.dart';

class SplashScreenController extends GetxController   with GetTickerProviderStateMixin{
  late AnimationController animationController;
  RxString vers = " ".obs;

  @override
  Future<void> onInit() async {
    getScaleAnimation(1);
    Timer(const Duration(seconds: 3), () async {
      await goto();
    });
    super.onInit();
  }

  @override
  void dispose() {
    animationController.stop();
    animationController.dispose();
    super.dispose();
  }



  Animation<double> getScaleAnimation(int duration) {
    animationController =
    AnimationController(vsync: this, duration: Duration(seconds: duration))
      ..forward();
    return CurvedAnimation(parent: animationController, curve: Curves.linear);
  }

  Future goto() async {
    Get.find<AuthController>().goto();
  }
}
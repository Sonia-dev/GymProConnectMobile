import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/qr_code_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends GetView<QrCodeController> {
  const QrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/backgr.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: new Container(
                  decoration:
                      new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              child: Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF7F9FD),
                ),
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Bienvenue ${controller.qrCode.name}",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Stack(
                    children: [

                      Container(
                        width: 200.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Colors.white, // Couleur de fond gris
                          borderRadius: BorderRadius.circular(10.0),
                          // Coins arrondis de rayon 10.0
                        ),
                      ),
                      Obx(() => controller.isLoading.value
                          ? SpinKitDoubleBounce(color: Colors.yellow)
                          : QrImageView(
                              data: controller.qrCode.toStr(),
                              version: QrVersions.auto,
                              size: 200.0,
                            )),
                    ],
                  ),
                  SizedBox(height: 30.h),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

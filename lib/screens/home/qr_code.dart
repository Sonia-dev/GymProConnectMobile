import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/controllers/qr_code_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends GetView<QrCodeController> {
  const QrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Enveloppez votre contenu avec Center
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Alignez les éléments au centre verticalement
          children: [
            QrImageView(
              data: controller.qrCode.qrCodeData.toString(),
              version: QrVersions.auto,
              size: 200.0,
            ),
30.h.verticalSpace,
            Text(
              "Qr Code",
              style: TextStyle(
                color: Color(0xFFf34e3a),
                fontSize: 30.spMin,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0.06,
                letterSpacing: 0.20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

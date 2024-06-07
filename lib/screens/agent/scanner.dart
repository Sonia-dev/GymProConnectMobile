import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../data/controllers/attendance_controller.dart';
import '../../models/Attendance_model.dart';
import '../../models/qr_code_model.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  Barcode? result;
  QrCodeModel? qrCodeModel;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');


  var attendanceContr = Get.find<AttendanceController>();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 6, child: _buildQrView(context)),
          Expanded(
            child: FittedBox(

              fit: BoxFit.contain,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(100.0),
                  child: Text('Enregistrer la présence',  style: TextStyle(fontSize: 50.0, color: Colors.deepOrange,),
                              ),
                ),
              ),
          ))
        ],

      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 200.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(()  {
        result = scanData;
        if (result != null && result!.code != null) {
          try {

            log('QR Code raw data type: ${result!.code.runtimeType}');

            // Tentez de décoder le JSON
            var jsonData = jsonDecode(result!.code!);
            if (jsonData is Map<String, dynamic>) {
              qrCodeModel = QrCodeModel.fromJson(jsonData);
              log('Decoded QR Code: ${qrCodeModel!.toJson()}');


              attendanceContr.scan(ScanRequest(token: qrCodeModel!.tokencode!),context);
              controller.pauseCamera();
              Future.delayed(Duration(seconds: 5), () {
                Get.back();
              });



            } else {
              throw FormatException("The decoded data is not a Map");
            }
          } catch (e) {
            // En cas d'erreur, affichez un message d'erreur
            log('Error decoding QR Code: $e');
            qrCodeModel = null;
          }
        }
      });


    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}



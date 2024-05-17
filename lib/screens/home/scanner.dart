import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class Scanner extends StatefulWidget {
   @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<Scanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isScanning = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(
     //    title: Text('QR Scanner'),
     //    backgroundColor: Colors.blueAccent,
     //    elevation: 0,
     //  ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Color(0xFFF34E3A),
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                ),
              ),
            ),
          ),
      Positioned(

            child: InkWell(
              onTap: () {
                setState(() {
                  isScanning = true;
                });
              },
             child:  Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFf34e3a),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipOval(
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Positioned(
                      left:8,
                      top: 8,
                      child: Image.asset(
                        "assets/scanner.jfif",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 1,

            child: Container(

              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF333333),

              ),
              height: 10,

              // child: Center(
              //   child: (result!= null)
              //      ? Text(
              //           'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}',
              //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //         )
              //       : Text('Scan a code', style: TextStyle(fontSize: 18)),
              // ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      // Handle scanned QR code data
      print(scanData);
      // Arrête le scan après avoir détecté un code QR
      controller.stopCamera();

      // Afficher un SnackBar avec un message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR Code scanné avec succès: $scanData'),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}








































// class Scanner extends StatefulWidget {
//    @override
//    _QRScannerScreenState createState() => _QRScannerScreenState();
//  }
// class _QRScannerScreenState extends State<Scanner> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;
//
//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller!.resumeCamera();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: (result != null)
//                   ? Text(
//                   'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
//                   : Text('Scan a code'),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }



























// class Scanner extends StatefulWidget {
//   @override
//   _QRScannerScreenState createState() => _QRScannerScreenState();
// }
//
//
// class _QRScannerScreenState extends State<Scanner> {
//   GlobalKey qrKey = GlobalKey();
//   QRViewController? controller;
//   bool isScanning = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Aperçu de la caméra (plein écran)
//           Positioned.fill(
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: isScanning ? _onQRViewCreated : (controller) {},
//             ),
//           ),
//
//           // Zone filtrée (centrée et dimensionnée selon vos besoins)
//           Positioned(
//
//             top: (MediaQuery.of(context).size.height -
//                     (MediaQuery.of(context).size.width - 140)) / 2,
//             left: (MediaQuery.of(context).size.width -
//                     (MediaQuery.of(context).size.width - 140)) / 2,
//             child: Container(
//               width: MediaQuery.of(context).size.width - 140,
//               height: MediaQuery.of(context).size.width - 140,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.white, width: 2),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               // Ajoutez votre logique de filtrage ici (par exemple, ClipRRect, BlurFilter)
//               child: null,
//             ),
//           ),
//
//           // Bouton pour activer la numérisation
//           Positioned(
//             bottom: 50,
//             left: MediaQuery.of(context).size.width / 2 - 25,
//             child: InkWell(
//               onTap: () {
//                 setState(() {
//                   isScanning = true;
//                 });
//               },
//              child:  Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Color(0xFFf34e3a),
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.white, width: 2),
//                 ),
//                 child: Stack(
//                   children: [
//                     Positioned.fill(
//                       child: ClipOval(
//                         child: Container(
//                           color: Colors.transparent,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left:8,
//                       top: 8,
//                       child: Image.asset(
//                         "assets/scanner.jfif",
//                         width: 30,
//                         height: 30,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       // Handle scanned QR code data
//       print(scanData);
//       // Arrête le scan après avoir détecté un code QR
//       controller.stopCamera();
//
//       // Afficher un SnackBar avec un message de succès
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('QR Code scanné avec succès: $scanData'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }

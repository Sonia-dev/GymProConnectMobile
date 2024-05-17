import 'package:get/get_connect/http/src/response/response.dart';

import '../../utils/uris.dart';
import '../api/api_client.dart';

class QrCodeRepo {
  final ApiClient apiClient;

  QrCodeRepo({required this.apiClient});


  Future<Response> getQrCode() async {
    return await apiClient.getData(Uris.qrCodeUrl);
  }
}
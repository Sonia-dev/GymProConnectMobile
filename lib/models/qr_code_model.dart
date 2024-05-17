class QrCodeModel {
  String? qrCodeData;

  QrCodeModel({this.qrCodeData});

  QrCodeModel.fromJson(Map<String, dynamic> json) {
    qrCodeData = json['qr_code_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qr_code_data'] = this.qrCodeData;
    return data;
  }
}
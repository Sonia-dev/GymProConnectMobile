class ScanRequest {
  String token;

  ScanRequest({required this.token});

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}
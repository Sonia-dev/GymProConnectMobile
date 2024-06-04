class QrCodeModel {
  int? userId;
  String? name;
  String? tokencode;

  QrCodeModel({this.userId, this.name, this.tokencode});

  QrCodeModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    tokencode = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['code'] = this.tokencode;
    return data;
  }


  String toStr(){

  print('{"user_id": ${this.userId},"name": "${this.name}","code":"${this.tokencode}"}');
    return '{"user_id": ${this.userId},"name": "${this.name}","code":"${this.tokencode}"}';
  }


}
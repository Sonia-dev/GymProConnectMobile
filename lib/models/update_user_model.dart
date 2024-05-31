
class UpdateModel {
  int? id;
  String? name;
  String? surname;
  String? phone;
  String? email;
  String? adress;
  String? birthDate;
  int? status;
  String? createdAt;
  String? updatedAt;

  UpdateModel(
      {this.id,
        this.name,
        this.surname,
        this.phone,
        this.email,
        this.adress,
        this.birthDate,
        this.status,
        this.createdAt,
        this.updatedAt});

  UpdateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    phone = json['phone'];
    email = json['email'];
    adress = json['adress'];
    birthDate = json['birth_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['adress'] = this.adress;
    data['birth_date'] = this.birthDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
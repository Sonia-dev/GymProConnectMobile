class adherentModel {
  bool? success;
  List<Adherents>? adherents;

  adherentModel({this.success, this.adherents});

  adherentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['adherents'] != null) {
      adherents = <Adherents>[];
      json['adherents'].forEach((v) {
        adherents!.add(new Adherents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.adherents != null) {
      data['adherents'] = this.adherents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Adherents {
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
  String? image;
  String? title;
  String? siteId;
  String? token;

  Adherents(
      {this.id,
        this.name,
        this.surname,
        this.phone,
        this.email,
        this.adress,
        this.birthDate,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.title,
        this.siteId,
        this.token});

  Adherents.fromJson(Map<String, dynamic> json) {
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
    image = json['image'];
    title = json['title'];
    siteId = json['site_id'];
    token = json['token'];
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
    data['image'] = this.image;
    data['title'] = this.title;
    data['site_id'] = this.siteId;
    data['token'] = this.token;
    return data;
  }
}
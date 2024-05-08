class packsModel {
  List<PacksData>? packs;

  packsModel({this.packs});

  packsModel.fromJson(Map<String, dynamic> json) {
    if (json['packs'] != null) {
      packs = <PacksData>[];
      json['packs'].forEach((v) {
        packs!.add(new PacksData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.packs != null) {
      data['packs'] = this.packs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PacksData {
  int? id;
  String? name;
  int? activityId;
  int? nbrOfSession;
  int? duration;
  String? price;
  String? image;
  String? createdAt;
  String? updatedAt;

  PacksData(
      {this.id,
        this.name,
        this.activityId,
        this.nbrOfSession,
        this.duration,
        this.price,
        this.image,
        this.createdAt,
        this.updatedAt});

  PacksData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    activityId = json['activity_id'];
    nbrOfSession = json['nbr_of_session'];
    duration = json['duration'];
    price = json['price'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['activity_id'] = this.activityId;
    data['nbr_of_session'] = this.nbrOfSession;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
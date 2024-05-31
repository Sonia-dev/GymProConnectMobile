class CategoryModels {
  bool? success;
  CategoryData? data;

  CategoryModels({this.success, this.data});

  CategoryModels.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new CategoryData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CategoryData {
  int? id;
  String? name;
  String? forWho;
  String? gender;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? image;
  List<Activities>? activities;
  String? imageUrl;

  CategoryData(
      {this.id,
        this.name,
        this.forWho,
        this.gender,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.activities,
        this.imageUrl});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    forWho = json['for_who'];
    gender = json['gender'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    if (json['activities'] != null) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities!.add(new Activities.fromJson(v));
      });
    }
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['for_who'] = this.forWho;
    data['gender'] = this.gender;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    if (this.activities != null) {
      data['activities'] = this.activities!.map((v) => v.toJson()).toList();
    }
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class Activities {
  int? id;
  String? name;
  int? categoryId;
  int? coachId;
  String? muscleGroups;
  String? recommendedOutfit;
  String? recommendations;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? duration;
  String? price;
  Null? promotionId;
  Null? packId;
  Coach? coach;

  Activities(
      {this.id,
        this.name,
        this.categoryId,
        this.coachId,
        this.muscleGroups,
        this.recommendedOutfit,
        this.recommendations,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.duration,
        this.price,
        this.promotionId,
        this.packId,
        this.coach});

  Activities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    coachId = json['coach_id'];
    muscleGroups = json['muscle_groups'];
    recommendedOutfit = json['recommended_outfit'];
    recommendations = json['recommendations'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    duration = json['duration'];
    price = json['price'];
    promotionId = json['promotion_id'];
    packId = json['pack_id'];
    coach = json['coach'] != null ? new Coach.fromJson(json['coach']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['coach_id'] = this.coachId;
    data['muscle_groups'] = this.muscleGroups;
    data['recommended_outfit'] = this.recommendedOutfit;
    data['recommendations'] = this.recommendations;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['promotion_id'] = this.promotionId;
    data['pack_id'] = this.packId;
    if (this.coach != null) {
      data['coach'] = this.coach!.toJson();
    }
    return data;
  }
}

class Coach {
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

  Coach(
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

  Coach.fromJson(Map<String, dynamic> json) {
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
class ActivityData {
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
  int? price;
  int? promotionId;
  int? packId;
  String? imageUrl;
  Category? category;
  Coach? coach;
  List<Packs>? packs;

  ActivityData(
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
        this.imageUrl,
        this.category,
        this.coach,
        this.packs});

  ActivityData.fromJson(Map<String, dynamic> json) {
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
    //price = json['price'];
    promotionId = json['promotion_id'];
    packId = json['pack_id'];
    imageUrl = json['image_url'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    coach = json['coach'] != null ? new Coach.fromJson(json['coach']) : null;
    if (json['packs'] != null) {
      packs = <Packs>[];
      json['packs'].forEach((v) {
        packs!.add(new Packs.fromJson(v));
      });
    }
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
    data['image_url'] = this.imageUrl;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.coach != null) {
      data['coach'] = this.coach!.toJson();
    }
    if (this.packs != null) {
      data['packs'] = this.packs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? forWho;
  String? gender;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.name,
        this.forWho,
        this.gender,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    forWho = json['for_who'];
    gender = json['gender'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['for_who'] = this.forWho;
    data['gender'] = this.gender;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  int? siteId;

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
        this.siteId});

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
    return data;
  }
}

class Packs {
  int? id;
  String? name;
  int? activityId;
  int? nbrOfSession;
  int? duration;
  String? price;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? promoId;

  Packs(
      {this.id,
        this.name,
        this.activityId,
        this.nbrOfSession,
        this.duration,
        this.price,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.promoId});

  Packs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    activityId = json['activity_id'];
    nbrOfSession = json['nbr_of_session'];
    duration = json['duration'];
    price = json['price'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promoId = json['promo_id'];
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
    data['promo_id'] = this.promoId;
    return data;
  }
}
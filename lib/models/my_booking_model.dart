class MyBookingModel {
  int? id;
  int? userId;
  int? packId;
  int? activityId;
  String? createdAt;
  String? updatedAt;
  String? description;
  int? status;
  String? paymentStatus;
  Pack? pack;

  MyBookingModel(
      {this.id,
        this.userId,
        this.packId,
        this.activityId,
        this.createdAt,
        this.updatedAt,
        this.description,
        this.status,
        this.paymentStatus,
        this.pack});

  MyBookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    packId = json['pack_id'];
    activityId = json['activity_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
    status = json['status'];
    paymentStatus = json['payment_status'];
    pack = json['pack'] != null ? new Pack.fromJson(json['pack']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['pack_id'] = this.packId;
    data['activity_id'] = this.activityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['description'] = this.description;
    data['status'] = this.status;
    data['payment_status'] = this.paymentStatus;
    if (this.pack != null) {
      data['pack'] = this.pack!.toJson();
    }
    return data;
  }
}

class Pack {
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
  Activity? activity;

  Pack(
      {this.id,
        this.name,
        this.activityId,
        this.nbrOfSession,
        this.duration,
        this.price,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.promoId,
        this.activity});

  Pack.fromJson(Map<String, dynamic> json) {
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
    activity = json['activity'] != null
        ? new Activity.fromJson(json['activity'])
        : null;
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
    if (this.activity != null) {
      data['activity'] = this.activity!.toJson();
    }
    return data;
  }
}

class Activity {
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
  int? promotionId;
  int? packId;
  Coach? coach;
  List<Sessions>? sessions;

  Activity(
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
        this.coach,
        this.sessions});

  Activity.fromJson(Map<String, dynamic> json) {
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
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(new Sessions.fromJson(v));
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
    if (this.coach != null) {
      data['coach'] = this.coach!.toJson();
    }
    if (this.sessions != null) {
      data['sessions'] = this.sessions!.map((v) => v.toJson()).toList();
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
  int? siteId;
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

class Sessions {
  int? id;
  int? activityId;
  String? coachId;
  int? studioId;
  String? date;
  int? capacity;
  String? hourStart;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? status;
  Coach? coach;

  Sessions(
      {this.id,
        this.activityId,
        this.coachId,
        this.studioId,
        this.date,
        this.capacity,
        this.hourStart,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.coach});

  Sessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activityId = json['activity_id'];
    coachId = json['coach_id'];
    studioId = json['studio_id'];
    date = json['date'];
    capacity = json['capacity'];
    hourStart = json['hourStart'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    coach = json['coach'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activity_id'] = this.activityId;
    data['coach_id'] = this.coachId;
    data['studio_id'] = this.studioId;
    data['date'] = this.date;
    data['capacity'] = this.capacity;
    data['hourStart'] = this.hourStart;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['coach'] = this.coach;
    return data;
  }
}
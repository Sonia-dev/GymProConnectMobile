class MyBookingModel {
  List<Bookings>? bookings;

  MyBookingModel({this.bookings});

  MyBookingModel.fromJson(Map<String, dynamic> json) {
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookings {
  int? id;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? description;
  int? activityId;
  int? packId;
  Activity? activity;
  Pack? pack;

  Bookings(
      {this.id,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.description,
        this.activityId,
        this.packId,
        this.activity,
        this.pack});

  Bookings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
    activityId = json['activity_id'];
    packId = json['pack_id'];
    activity = json['activity'] != null
        ? new Activity.fromJson(json['activity'])
        : null;
    pack = json['pack'] != null ? new Pack.fromJson(json['pack']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['description'] = this.description;
    data['activity_id'] = this.activityId;
    data['pack_id'] = this.packId;
    if (this.activity != null) {
      data['activity'] = this.activity!.toJson();
    }
    if (this.pack != null) {
      data['pack'] = this.pack!.toJson();
    }
    return data;
  }
}

class Activity {
  int? id;
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
  String? name;
  String? price;

  Activity(
      {this.id,
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
        this.name,
        this.price});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['name'] = this.name;
    data['price'] = this.price;
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

  Pack(
      {this.id,
        this.name,
        this.activityId,
        this.nbrOfSession,
        this.duration,
        this.price,
        this.image,
        this.createdAt,
        this.updatedAt});

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
class Reviews {
  int? id;
  int? userId;
  int? activityId;
  int? packId;
  int? coachId;
  String? rating;
  String? comment;
  String? createdAt;
  String? updatedAt;
  User? user;

  Reviews(
      {this.id,
        this.userId,
        this.activityId,
        this.packId,
        this.coachId,
        this.rating,
        this.comment,
        this.createdAt,
        this.updatedAt,
        this.user});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    activityId = json['activity_id'];
    packId = json['pack_id'];
    coachId = json['coach_id'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['activity_id'] = this.activityId;
    data['pack_id'] = this.packId;
    data['coach_id'] = this.coachId;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? surname;
  String? image;

  User({this.id, this.name, this.surname, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['image'] = this.image;
    return data;
  }
}
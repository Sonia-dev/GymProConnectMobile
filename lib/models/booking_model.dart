class BookingModel {
  List<Bookings>? bookings;

  BookingModel({this.bookings});

  BookingModel.fromJson(Map<String, dynamic> json) {
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

  Bookings(
      {this.id,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.description,
        this.activityId,
        this.packId});

  Bookings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
    activityId = json['activity_id'];
    packId = json['pack_id'];
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
    return data;
  }
}
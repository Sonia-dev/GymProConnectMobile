class BookingModel {
  Booking? booking;

  BookingModel({this.booking});

  BookingModel.fromJson(Map<String, dynamic> json) {
    booking =
    json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    return data;
  }
}

class Booking {
  int? userId;
  int? status;
  int? activityId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Booking({this.userId,
    this.status,
    this.activityId,
    this.updatedAt,
    this.createdAt,
    this.id});

  Booking.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    status = json['status'];
    activityId = json['activity_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['activity_id'] = this.activityId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
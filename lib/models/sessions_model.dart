
class Autogenerated {
  List<SessionData>? sessions;

  Autogenerated({this.sessions});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['sessions'] != null) {
      sessions = <SessionData>[];
      json['sessions'].forEach((v) {
        sessions!.add(new SessionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sessions != null) {
      data['sessions'] = this.sessions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SessionData {
  int? id;
  int? activityId;
  String? coachId;
  int? studioId;
  String? date;
  String? hourStart;
  int? capacity;
  String? image;
  String? createdAt;
  String? updatedAt;

  SessionData(
      {this.id,
        this.activityId,
        this.coachId,
        this.studioId,
        this.date,
        this.hourStart,
        this.capacity,
        this.image,
        this.createdAt,
        this.updatedAt});

  SessionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activityId = json['activity_id'];
    coachId = json['coach_id'];
    studioId = json['studio_id'];
    date = json['date'];
    hourStart = json['hourStart'];
    capacity = json['capacity'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activity_id'] = this.activityId;
    data['coach_id'] = this.coachId;
    data['studio_id'] = this.studioId;
    data['date'] = this.date;
    data['hourStart'] = this.hourStart;
    data['capacity'] = this.capacity;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
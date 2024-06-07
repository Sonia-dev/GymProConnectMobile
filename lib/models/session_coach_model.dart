
class Sessionscoach {
  int? id;
  String? activityName;
  String? studioName;
  String? date;
  String? startTime;
  Null? endTime;
  int? capacity;
  int? status;

  Sessionscoach(
      {this.id,
        this.activityName,
        this.studioName,
        this.date,
        this.startTime,
        this.endTime,
        this.capacity,
        this.status});

  Sessionscoach.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activityName = json['activity_name'];
    studioName = json['studio_name'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    capacity = json['capacity'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activity_name'] = this.activityName;
    data['studio_name'] = this.studioName;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['capacity'] = this.capacity;
    data['status'] = this.status;
    return data;
  }
}
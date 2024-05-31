// class BookingModel {
//   List<Bookings>? bookings;
//
//   BookingModel({this.bookings});
//
//   BookingModel.fromJson(Map<String, dynamic> json) {
//     if (json['bookings'] != null) {
//       bookings = <Bookings>[];
//       json['bookings'].forEach((v) {
//         bookings!.add(new Bookings.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.bookings != null) {
//       data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Bookings {
//   int? id;
//   int? status;
//   Pack? pack;
//   Activity? activity;
//
//   Bookings({this.id, this.status, this.pack, this.activity});
//
//   Bookings.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     status = json['status'];
//     pack = json['pack'] != null ? new Pack.fromJson(json['pack']) : null;
//     activity = json['activity'] != null
//         ? new Activity.fromJson(json['activity'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['status'] = this.status;
//     if (this.pack != null) {
//       data['pack'] = this.pack!.toJson();
//     }
//     if (this.activity != null) {
//       data['activity'] = this.activity!.toJson();
//     }
//     return data;
//   }
// }
//
// class Pack {
//   int? id;
//   String? name;
//   List<Activity>? activities;
//
//   Pack({this.id, this.name, this.activities});
//
//   Pack.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     if (json['activities'] != null) {
//       activities = <Activity>[];
//       json['activities'].forEach((v) {
//         activities!.add(new Activity.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.activities != null) {
//       data['activities'] = this.activities!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Activity {
//   int? id;
//   String? name;
//   List<Sessions>? sessions;
//
//   Activity({this.id, this.name, this.sessions});
//
//   Activity.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     if (json['sessions'] != null) {
//       sessions = <Sessions>[];
//       json['sessions'].forEach((v) {
//         sessions!.add(new Sessions.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.sessions != null) {
//       data['sessions'] = this.sessions!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Sessions {
//   int? id;
//   String? date;
//   String? hourStart;
//   String? image;
//   int? capacity;
//   int? status;
//
//   Sessions(
//       {this.id,
//         this.date,
//         this.hourStart,
//         this.image,
//         this.capacity,
//         this.status});
//
//   Sessions.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     date = json['date'];
//     hourStart = json['hourStart'];
//     image = json['image'];
//     capacity = json['capacity'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['date'] = this.date;
//     data['hourStart'] = this.hourStart;
//     data['image'] = this.image;
//     data['capacity'] = this.capacity;
//     data['status'] = this.status;
//     return data;
//   }
// }
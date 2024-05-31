// class PlanningModel {
//   List<Sessions>? sessions;
//
//   PlanningModel({this.sessions});
//
//   PlanningModel.fromJson(Map<String, dynamic> json) {
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
//     if (this.sessions != null) {
//       data['sessions'] = this.sessions!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Sessions {
//   int? id;
//   String? activity;
//   String? coach;
//   String? studio;
//   String? date;
//   String? hourStart;
//
//   Sessions(
//       {this.id,
//         this.activity,
//         this.coach,
//         this.studio,
//         this.date,
//         this.hourStart});
//
//   Sessions.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     activity = json['activity'];
//     coach = json['coach'];
//     studio = json['studio'];
//     date = json['date'];
//     hourStart = json['hourStart'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['activity'] = this.activity;
//     data['coach'] = this.coach;
//     data['studio'] = this.studio;
//     data['date'] = this.date;
//     data['hourStart'] = this.hourStart;
//     return data;
//   }
// }
//
// class Session {
//   final id;
//   final String title;
//   final DateTime? start;
//   final DateTime? end;
//
//   Session({
//     required this.title,
//     this.id,
//     this.start,
//     this.end,
//   }) ;
//
//   @override
//   String toString() => title;
// }
//
//

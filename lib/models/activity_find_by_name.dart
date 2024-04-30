class FindByName {
  bool? success;
  Data? data;

  FindByName({this.success, this.data});

  FindByName.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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

  Data(
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
        this.name});

  Data.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
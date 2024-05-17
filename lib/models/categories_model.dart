class CategoryModels {
  bool? success;
  Data? data;

  CategoryModels({this.success, this.data});

  CategoryModels.fromJson(Map<String, dynamic> json) {
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
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class CategoryData {
  int? id;
  String? name;
  String? forWho;
  String? gender;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? image;
  List<Activities>? activities;

  CategoryData(
      {this.id,
        this.name,
        this.forWho,
        this.gender,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.activities});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    forWho = json['for_who'];
    gender = json['gender'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    if (json['activities'] != null) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities!.add(new Activities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['for_who'] = this.forWho;
    data['gender'] = this.gender;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    if (this.activities != null) {
      data['activities'] = this.activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activities {
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
  Coach? coach;

  Activities(
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
        this.price,
        this.coach});

  Activities.fromJson(Map<String, dynamic> json) {
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
    coach = json['coach'] != null ? new Coach.fromJson(json['coach']) : null;
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
    if (this.coach != null) {
      data['coach'] = this.coach!.toJson();
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
        this.title});

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
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}

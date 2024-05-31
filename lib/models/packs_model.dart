class packsModel {
  PacksData? pack;

  packsModel({this.pack});

  packsModel.fromJson(Map<String, dynamic> json) {
    pack = json['pack'] != null ? new PacksData.fromJson(json['pack']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pack != null) {
      data['pack'] = this.pack!.toJson();
    }
    return data;
  }
}

class PacksData {
  int? id;
  String? name;
  String? price;
  String? sessionCount;
  String? image;
  Activity? activity;

  PacksData(
      {this.id,
        this.name,
        this.price,
        this.sessionCount,
        this.image,
        this.activity});

  PacksData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    sessionCount = json['session_count'];
    image = json['image'];
    activity = json['activity'] != null
        ? new Activity.fromJson(json['activity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['session_count'] = this.sessionCount;
    data['image'] = this.image;
    if (this.activity != null) {
      data['activity'] = this.activity!.toJson();
    }
    return data;
  }
}

class Activity {
  int? id;
  String? name;
  String? description;
  String? image;
  Category? category;
  Coach? coach;

  Activity(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.category,
        this.coach});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    coach = json['coach'] != null ? new Coach.fromJson(json['coach']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.coach != null) {
      data['coach'] = this.coach!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? description;
  String? image;

  Category({this.id, this.name, this.description, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}

class Coach {
  int? id;
  String? name;
  String? description;
  String? image;

  Coach({this.id, this.name, this.description, this.image});

  Coach.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
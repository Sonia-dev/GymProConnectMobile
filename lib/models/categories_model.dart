class category {
  int? id;
  String? name;
  String? forWho;
  String? gender;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? image;

  category(
      {this.id,
        this.name,
        this.forWho,
        this.gender,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.image});

  category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    forWho = json['for_who'];
    gender = json['gender'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
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
    return data;
  }
}
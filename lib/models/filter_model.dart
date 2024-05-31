class filterModel {
  List<String>? category;
  Prices? prices;
  List<String>? target;
  List<String>? gender;

  filterModel({this.category, this.prices, this.target, this.gender});

  filterModel.fromJson(Map<String, dynamic> json) {
    category = json['category'].cast<String>();
    prices =
    json['prices'] != null ? new Prices.fromJson(json['prices']) : null;
    target = json['target'].cast<String>();
    gender = json['gender'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    if (this.prices != null) {
      data['prices'] = this.prices!.toJson();
    }
    data['target'] = this.target;
    data['gender'] = this.gender;
    return data;
  }
}

class Prices {
  String? min;
  String? max;

  Prices({this.min, this.max});

  Prices.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    return data;
  }
}
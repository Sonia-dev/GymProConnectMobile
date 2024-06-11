


class RequestFilter {


  double? minPrice;
  double? maxPrice;
  String? categoryName;
  String? target;
  String? gender;

  RequestFilter({ this.minPrice ,  this.maxPrice, this.categoryName
  , this.gender, this.target});


  Map<String, String> toJson() {
    final Map<String, String> data = {};

    if (minPrice != null) {
      data['min_price'] = minPrice.toString();
    }
    if (maxPrice != null) {
      data['max_price'] = maxPrice.toString();
    }
    if (categoryName != null&& categoryName != "") {
      data['category'] = categoryName.toString();
    }
    if (target != null && target != "") {
      data['target'] = target.toString();
    }
    if (gender != null && gender != "") {
      data['gender'] = gender.toString();
    }

    return data;
  }


  Map<String, String>  clearData() {
    return {
      "":""
  };

}



}
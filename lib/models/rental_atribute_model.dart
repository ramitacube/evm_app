class CategoryAttrData {
  List<CategoryAttrBasedoncategory> categoryAttrBasedoncategory;

  CategoryAttrData({this.categoryAttrBasedoncategory});

  CategoryAttrData.fromJson(Map<String, dynamic> json) {
    if (json['category_attr_basedoncategory'] != null) {
      categoryAttrBasedoncategory = <CategoryAttrBasedoncategory>[];
      json['category_attr_basedoncategory'].forEach((v) {
        categoryAttrBasedoncategory
            .add(new CategoryAttrBasedoncategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryAttrBasedoncategory != null) {
      data['category_attr_basedoncategory'] =
          this.categoryAttrBasedoncategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryAttrBasedoncategory {
  String id;
  String name;
  CategoryId categoryId;
  int status;

  CategoryAttrBasedoncategory(
      {this.id, this.name, this.categoryId, this.status});

  CategoryAttrBasedoncategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'] != null
        ? new CategoryId.fromJson(json['category_id'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.categoryId != null) {
      data['category_id'] = this.categoryId.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class CategoryId {
  String id;
  String name;
  int status;

  CategoryId({this.id, this.name, this.status});

  CategoryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}

class CategoryModel {
  List<GetCompaniesCategories> getCompaniesCategories;

  CategoryModel({this.getCompaniesCategories});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['getCompaniesCategories'] != null) {
      getCompaniesCategories = <GetCompaniesCategories>[];
      json['getCompaniesCategories'].forEach((v) {
        getCompaniesCategories.add(new GetCompaniesCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getCompaniesCategories != null) {
      data['getCompaniesCategories'] =
          this.getCompaniesCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetCompaniesCategories {
  String id;
  String name;
  var companyId;
  String categoryIcon;

  GetCompaniesCategories(
      {this.id, this.name, this.companyId, this.categoryIcon});

  GetCompaniesCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    companyId = json['company_id'];
    categoryIcon = json['category_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['company_id'] = this.companyId;
    data['category_icon'] = this.categoryIcon;
    return data;
  }
}

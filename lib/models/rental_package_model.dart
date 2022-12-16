class RentalPackageModel {
  RentalPackages rentalPackages;

  RentalPackageModel({this.rentalPackages});

  RentalPackageModel.fromJson(Map<String, dynamic> json) {
    rentalPackages = json['rental_packages'] != null
        ? new RentalPackages.fromJson(json['rental_packages'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rentalPackages != null) {
      data['rental_packages'] = this.rentalPackages.toJson();
    }
    return data;
  }
}

class RentalPackages {
  List<RentalPackageData> data;

  RentalPackages({this.data});

  RentalPackages.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RentalPackageData>[];
      json['data'].forEach((v) {
        data.add(new RentalPackageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RentalPackageData {
  String id;
  String packageName;

  RentalPackageData({this.id, this.packageName});

  RentalPackageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageName = json['package_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_name'] = this.packageName;
    return data;
  }
}

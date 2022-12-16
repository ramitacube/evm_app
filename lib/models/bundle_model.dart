class BundleData {
  List<PackagebundlesCategory> packagebundlesCategory;

  BundleData({this.packagebundlesCategory});

  BundleData.fromJson(Map<String, dynamic> json) {
    if (json['packagebundlesCategory'] != null) {
      packagebundlesCategory = <PackagebundlesCategory>[];
      json['packagebundlesCategory'].forEach((v) {
        packagebundlesCategory.add(new PackagebundlesCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.packagebundlesCategory != null) {
      data['packagebundlesCategory'] =
          this.packagebundlesCategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackagebundlesCategory {
  String id;
  String bundleName;
  var baseKmHr;

  PackagebundlesCategory({this.id, this.bundleName, this.baseKmHr});

  PackagebundlesCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bundleName = json['bundle_name'];
    baseKmHr = json['base_km_hr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bundle_name'] = this.bundleName;
    data['base_km_hr'] = this.baseKmHr;
    return data;
  }
}

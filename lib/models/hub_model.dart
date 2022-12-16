class HubData {
  List<Locationoncity> locationoncity;

  HubData({this.locationoncity});

  HubData.fromJson(Map<String, dynamic> json) {
    if (json['locationoncity'] != null) {
      locationoncity = <Locationoncity>[];
      json['locationoncity'].forEach((v) {
        locationoncity.add(new Locationoncity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.locationoncity != null) {
      data['locationoncity'] =
          this.locationoncity.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Locationoncity {
  String id;
  String address;
  String pincode;
  String latitude;
  String longitude;
  String locationName;

  Locationoncity(
      {this.id,
      this.address,
      this.pincode,
      this.latitude,
      this.longitude,
      this.locationName});

  Locationoncity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    pincode = json['pincode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    locationName = json['location_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['location_name'] = this.locationName;
    return data;
  }
}

class RentalData {
  List<Rental> rental;

  RentalData({this.rental});

  RentalData.fromJson(Map<String, dynamic> json) {
    if (json['rental'] != null) {
      rental = <Rental>[];
      json['rental'].forEach((v) {
        rental.add(new Rental.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rental != null) {
      data['rental'] = this.rental.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rental {
  String id;
  RentalDetails rentalDetails;
  String rentalDate;
  User user;
  Products products;

  Rental(
      {this.id, this.rentalDetails, this.rentalDate, this.user, this.products});

  Rental.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rentalDetails = json['rental_details'] != null
        ? new RentalDetails.fromJson(json['rental_details'])
        : null;
    rentalDate = json['rental_date'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.rentalDetails != null) {
      data['rental_details'] = this.rentalDetails.toJson();
    }
    data['rental_date'] = this.rentalDate;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products.toJson();
    }
    return data;
  }
}

class RentalDetails {
  RentalDetailRates rentalDetailRates;
  String dropDate;
  String pickupDate;
  PickupLocationId pickupLocationId;
  PickupLocationId dropLocationId;

  RentalDetails(
      {this.rentalDetailRates,
      this.dropDate,
      this.pickupDate,
      this.pickupLocationId,
      this.dropLocationId});

  RentalDetails.fromJson(Map<String, dynamic> json) {
    rentalDetailRates = json['rental_detail_rates'] != null
        ? new RentalDetailRates.fromJson(json['rental_detail_rates'])
        : null;
    dropDate = json['drop_date'];
    pickupDate = json['pickup_date'];
    pickupLocationId = json['pickup_location_id'] != null
        ? new PickupLocationId.fromJson(json['pickup_location_id'])
        : null;
    dropLocationId = json['drop_location_id'] != null
        ? new PickupLocationId.fromJson(json['drop_location_id'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rentalDetailRates != null) {
      data['rental_detail_rates'] = this.rentalDetailRates.toJson();
    }
    data['drop_date'] = this.dropDate;
    data['pickup_date'] = this.pickupDate;
    if (this.pickupLocationId != null) {
      data['pickup_location_id'] = this.pickupLocationId.toJson();
    }
    if (this.dropLocationId != null) {
      data['drop_location_id'] = this.dropLocationId.toJson();
    }
    return data;
  }
}

class RentalDetailRates {
  int subTotal;

  RentalDetailRates({this.subTotal});

  RentalDetailRates.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_total'] = this.subTotal;
    return data;
  }
}

class PickupLocationId {
  String locationName;
  String address;

  PickupLocationId({this.locationName, this.address});

  PickupLocationId.fromJson(Map<String, dynamic> json) {
    locationName = json['location_name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_name'] = this.locationName;
    data['address'] = this.address;
    return data;
  }
}

class User {
  String name;
  String email;
  String phone;

  User({this.name, this.email, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class Products {
  String name;
  List<ProductAttrs> productAttrs;

  Products({this.name, this.productAttrs});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['product_attrs'] != null) {
      productAttrs = <ProductAttrs>[];
      json['product_attrs'].forEach((v) {
        productAttrs.add(new ProductAttrs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.productAttrs != null) {
      data['product_attrs'] = this.productAttrs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAttrs {
  Head head;
  Head headValue;

  ProductAttrs({this.head, this.headValue});

  ProductAttrs.fromJson(Map<String, dynamic> json) {
    head = json['head'] != null ? new Head.fromJson(json['head']) : null;
    headValue = json['head_value'] != null
        ? new Head.fromJson(json['head_value'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.head != null) {
      data['head'] = this.head.toJson();
    }
    if (this.headValue != null) {
      data['head_value'] = this.headValue.toJson();
    }
    return data;
  }
}

class Head {
  String name;

  Head({this.name});

  Head.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

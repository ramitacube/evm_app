// class BookingRentalList {
//   Data data;

//   BookingRentalList({this.data});

//   BookingRentalList.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }

class BookingRentalList {
  List<Rentals> rental;

  BookingRentalList({this.rental});

  BookingRentalList.fromJson(Map<String, dynamic> json) {
    if (json['rental'] != null) {
      rental = <Rentals>[];
      json['rental'].forEach((v) {
        rental.add(new Rentals.fromJson(v));
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

class Rentals {
  String id;
  Company company;
  Products products;
  String rentalDate;
  RentalStatusId rentalStatusId;
  RentalDetails rentalDetails;
  User user;

  Rentals(
      {this.id,
      this.company,
      this.products,
      this.rentalDate,
      this.rentalStatusId,
      this.rentalDetails,
      this.user});

  Rentals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
    rentalDate = json['rental_date'];
    rentalStatusId = json['rental_status_id'] != null
        ? new RentalStatusId.fromJson(json['rental_status_id'])
        : null;
    rentalDetails = json['rental_details'] != null
        ? new RentalDetails.fromJson(json['rental_details'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products.toJson();
    }
    data['rental_date'] = this.rentalDate;
    if (this.rentalStatusId != null) {
      data['rental_status_id'] = this.rentalStatusId.toJson();
    }
    if (this.rentalDetails != null) {
      data['rental_details'] = this.rentalDetails.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Company {
  String id;
  int status;
  List<Settings> settings;

  Company({this.id, this.status, this.settings});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    if (json['settings'] != null) {
      settings = <Settings>[];
      json['settings'].forEach((v) {
        settings.add(new Settings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    if (this.settings != null) {
      data['settings'] = this.settings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Settings {
  String id;
  String key;
  String value;

  Settings({this.id, this.key, this.value});

  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class Products {
  String id;
  String name;
  ProductImage productImage;
  List<ProductAttrs> productAttrs;

  Products({this.id, this.name, this.productImage, this.productAttrs});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productImage = json['product_image'] != null
        ? new ProductImage.fromJson(json['product_image'])
        : null;
    if (json['product_attrs'] != null) {
      productAttrs = <ProductAttrs>[];
      json['product_attrs'].forEach((v) {
        productAttrs.add(new ProductAttrs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.productImage != null) {
      data['product_image'] = this.productImage.toJson();
    }
    if (this.productAttrs != null) {
      data['product_attrs'] = this.productAttrs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductImage {
  String id;
  String documentUrl;

  ProductImage({this.id, this.documentUrl});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    documentUrl = json['document_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['document_url'] = this.documentUrl;
    return data;
  }
}

class ProductAttrs {
  Head head;
  HeadValue headValue;

  ProductAttrs({this.head, this.headValue});

  ProductAttrs.fromJson(Map<String, dynamic> json) {
    head = json['head'] != null ? new Head.fromJson(json['head']) : null;
    headValue = json['head_value'] != null
        ? new HeadValue.fromJson(json['head_value'])
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
  String id;
  String name;
  int status;

  Head({this.id, this.name, this.status});

  Head.fromJson(Map<String, dynamic> json) {
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

class HeadValue {
  String id;
  String name;

  HeadValue({this.id, this.name});

  HeadValue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class RentalStatusId {
  String id;
  String statusName;

  RentalStatusId({this.id, this.statusName});

  RentalStatusId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status_name'] = this.statusName;
    return data;
  }
}

class RentalDetails {
  String dropDate;
  DropLocationId dropLocationId;
  String pickupDate;
  DropLocationId pickupLocationId;
  RentalDetailRates rentalDetailRates;

  RentalDetails(
      {this.dropDate,
      this.dropLocationId,
      this.pickupDate,
      this.pickupLocationId,
      this.rentalDetailRates});

  RentalDetails.fromJson(Map<String, dynamic> json) {
    dropDate = json['drop_date'];
    dropLocationId = json['drop_location_id'] != null
        ? new DropLocationId.fromJson(json['drop_location_id'])
        : null;
    pickupDate = json['pickup_date'];
    pickupLocationId = json['pickup_location_id'] != null
        ? new DropLocationId.fromJson(json['pickup_location_id'])
        : null;
    rentalDetailRates = json['rental_detail_rates'] != null
        ? new RentalDetailRates.fromJson(json['rental_detail_rates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drop_date'] = this.dropDate;
    if (this.dropLocationId != null) {
      data['drop_location_id'] = this.dropLocationId.toJson();
    }
    data['pickup_date'] = this.pickupDate;
    if (this.pickupLocationId != null) {
      data['pickup_location_id'] = this.pickupLocationId.toJson();
    }
    if (this.rentalDetailRates != null) {
      data['rental_detail_rates'] = this.rentalDetailRates.toJson();
    }
    return data;
  }
}

class DropLocationId {
  String id;
  String locationName;
  String address;

  DropLocationId({this.id, this.locationName, this.address});

  DropLocationId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationName = json['location_name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['location_name'] = this.locationName;
    data['address'] = this.address;
    return data;
  }
}

class RentalDetailRates {
  double subTotal;
  double tax;
  int amount;
  int baseRate;

  RentalDetailRates({this.subTotal, this.tax, this.amount, this.baseRate});

  RentalDetailRates.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total'];
    tax = json['tax'];
    amount = json['amount'];
    baseRate = json['base_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_total'] = this.subTotal;
    data['tax'] = this.tax;
    data['amount'] = this.amount;
    data['base_rate'] = this.baseRate;
    return data;
  }
}

class User {
  String id;
  String name;
  String email;
  String phone;

  User({this.id, this.name, this.email, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

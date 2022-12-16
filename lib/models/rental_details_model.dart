class RentalDetailsData {
  List<CreateRentalDetails> createRentalDetails;

  RentalDetailsData({this.createRentalDetails});

  RentalDetailsData.fromJson(Map<String, dynamic> json) {
    if (json['CreateRentalDetails'] != null) {
      createRentalDetails = <CreateRentalDetails>[];
      json['CreateRentalDetails'].forEach((v) {
        createRentalDetails.add(new CreateRentalDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.createRentalDetails != null) {
      data['CreateRentalDetails'] =
          this.createRentalDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CreateRentalDetails {
  int id;
  String name;
  String address;
  String pickup;
  int rentalId;
  var customerId;
  String pickupDate;
  var pickupLocationId;
  String dropDate;
  var dropLocationId;
  String drop;
  String rentalDate;
  String statusName;
  String baseRate;
  String additinalKmRate;
  var additinalHourRate;
  var rentalDetailsId;
  int amount;
  double tax;
  int subTotal;
  // List<Null> rentalAttributes;
  RentalProduct rentalProduct;

  CreateRentalDetails(
      {this.id,
      this.name,
      this.address,
      this.pickup,
      this.rentalId,
      this.customerId,
      this.pickupDate,
      this.pickupLocationId,
      this.dropDate,
      this.dropLocationId,
      this.drop,
      this.rentalDate,
      this.statusName,
      this.baseRate,
      this.additinalKmRate,
      this.additinalHourRate,
      this.rentalDetailsId,
      this.amount,
      this.tax,
      this.subTotal,
      // this.rentalAttributes,
      this.rentalProduct});

  CreateRentalDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    pickup = json['pickup'];
    rentalId = json['rental_id'];
    customerId = json['customer_id'];
    pickupDate = json['pickup_date'];
    pickupLocationId = json['pickup_location_id'];
    dropDate = json['drop_date'];
    dropLocationId = json['drop_location_id'];
    drop = json['drop'];
    rentalDate = json['rental_date'];
    statusName = json['status_name'];
    baseRate = json['base_rate'];
    additinalKmRate = json['additinal_km_rate'];
    additinalHourRate = json['additinal_hour_rate'];
    rentalDetailsId = json['rental_details_id'];
    amount = json['amount'];
    tax = json['tax'];
    subTotal = json['sub_total'];
    // if (json['rental_attributes'] != null) {
    //   rentalAttributes = new List<Null>();
    //   json['rental_attributes'].forEach((v) {
    //     rentalAttributes.add(new Null.fromJson(v));
    //   });
    // }
    rentalProduct = json['rental_product'] != null
        ? new RentalProduct.fromJson(json['rental_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['pickup'] = this.pickup;
    data['rental_id'] = this.rentalId;
    data['customer_id'] = this.customerId;
    data['pickup_date'] = this.pickupDate;
    data['pickup_location_id'] = this.pickupLocationId;
    data['drop_date'] = this.dropDate;
    data['drop_location_id'] = this.dropLocationId;
    data['drop'] = this.drop;
    data['rental_date'] = this.rentalDate;
    data['status_name'] = this.statusName;
    data['base_rate'] = this.baseRate;
    data['additinal_km_rate'] = this.additinalKmRate;
    data['additinal_hour_rate'] = this.additinalHourRate;
    data['rental_details_id'] = this.rentalDetailsId;
    data['amount'] = this.amount;
    data['tax'] = this.tax;
    data['sub_total'] = this.subTotal;
    // if (this.rentalAttributes != null) {
    //   data['rental_attributes'] =
    //       this.rentalAttributes.map((v) => v.toJson()).toList();
    // }
    if (this.rentalProduct != null) {
      data['rental_product'] = this.rentalProduct.toJson();
    }
    return data;
  }
}

class RentalProduct {
  String name;
  List<ProductAttrs> productAttrs;

  RentalProduct({this.name, this.productAttrs});

  RentalProduct.fromJson(Map<String, dynamic> json) {
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
  String headValue;
  String head;

  ProductAttrs({this.headValue, this.head});

  ProductAttrs.fromJson(Map<String, dynamic> json) {
    headValue = json['head_value'];
    head = json['head'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['head_value'] = this.headValue;
    data['head'] = this.head;
    return data;
  }
}

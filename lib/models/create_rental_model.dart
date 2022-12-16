

class CreateRentalData {
  CreateRental createRental;

  CreateRentalData({this.createRental});

  CreateRentalData.fromJson(Map<String, dynamic> json) {
    createRental = json['CreateRental'] != null
        ? new CreateRental.fromJson(json['CreateRental'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.createRental != null) {
      data['CreateRental'] = this.createRental.toJson();
    }
    return data;
  }
}

class CreateRental {
  String id;
  ProductsData products;
  String rentalDate;
  var rentalDetails;

  CreateRental({this.id, this.products, this.rentalDate, this.rentalDetails});

  CreateRental.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    products = json['products'] != null
        ? new ProductsData.fromJson(json['products'])
        : null;
    rentalDate = json['rental_date'];
    rentalDetails = json['rental_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products.toJson();
    }
    data['rental_date'] = this.rentalDate;
    data['rental_details'] = this.rentalDetails;
    return data;
  }
}

class ProductsData {
  String name;
  var productImage;

  ProductsData ({this.name, this.productImage});

  ProductsData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['product_image'] = this.productImage;
    return data;
  }
}

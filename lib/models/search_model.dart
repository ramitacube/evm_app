class SearchData {
  List<GetFilteredProducts> getFilteredProducts;

  SearchData({this.getFilteredProducts});

  SearchData.fromJson(Map<String, dynamic> json) {
    if (json['GetFilteredProducts'] != null) {
      getFilteredProducts = <GetFilteredProducts>[];
      json['GetFilteredProducts'].forEach((v) {
        getFilteredProducts.add(new GetFilteredProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getFilteredProducts != null) {
      data['GetFilteredProducts'] =
          this.getFilteredProducts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetFilteredProducts {
  String id;
  String name;
  List<Products> products;

  GetFilteredProducts({this.id, this.name, this.products});

  GetFilteredProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String id;
  int baseRate;
  int categoryId;
  int categoryAttrId;
  String name;
  int itemsCount;
  int bookingCount;
  int status;
  int packageId;
  int bundleId;
  String documentUrl;
  int productRentalsCount;
  String stockStatus;
  List<ProductAttrs> productAttrs;

  Products(
      {this.id,
      this.baseRate,
      this.categoryId,
      this.categoryAttrId,
      this.name,
      this.itemsCount,
      this.bookingCount,
      this.status,
      this.packageId,
      this.bundleId,
      this.documentUrl,
      this.productRentalsCount,
      this.stockStatus,
      this.productAttrs});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    baseRate = json['customer_rate'];
    categoryId = json['category_id'];
    categoryAttrId = json['category_attr_id'];
    name = json['name'];
    itemsCount = json['items_count'];
    bookingCount = json['booking_count'];
    status = json['status'];
    packageId = json['package_id'];
    bundleId = json['bundle_id'];
    documentUrl = json['document_url'];
    productRentalsCount = json['product_rentals_count'];
    stockStatus = json['stock_status'];
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
    data['customer_rate'] = this.baseRate;
    data['category_id'] = this.categoryId;
    data['category_attr_id'] = this.categoryAttrId;
    data['name'] = this.name;
    data['items_count'] = this.itemsCount;
    data['booking_count'] = this.bookingCount;
    data['status'] = this.status;
    data['package_id'] = this.packageId;
    data['bundle_id'] = this.bundleId;
    data['document_url'] = this.documentUrl;
    data['product_rentals_count'] = this.productRentalsCount;
    data['stock_status'] = this.stockStatus;
    if (this.productAttrs != null) {
      data['product_attrs'] = this.productAttrs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAttrs {
  var id;
  String headValue;
  String head;

  ProductAttrs({this.id, this.headValue, this.head});

  ProductAttrs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headValue = json['head_value'];
    head = json['head'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['head_value'] = this.headValue;
    data['head'] = this.head;
    return data;
  }
}

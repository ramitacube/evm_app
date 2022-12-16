class HeadData {
  List<ProductAttrHeadWithValue> productAttrHeadWithValue;

  HeadData({this.productAttrHeadWithValue});

  HeadData.fromJson(Map<String, dynamic> json) {
    if (json['productAttrHeadWithValue'] != null) {
      productAttrHeadWithValue = <ProductAttrHeadWithValue>[];
      json['productAttrHeadWithValue'].forEach((v) {
        productAttrHeadWithValue.add(new ProductAttrHeadWithValue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productAttrHeadWithValue != null) {
      data['productAttrHeadWithValue'] =
          this.productAttrHeadWithValue.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAttrHeadWithValue {
  String id;
  String name;
  int status;
  List<HeadValue> headValue;

  ProductAttrHeadWithValue({this.id, this.name, this.status, this.headValue});

  ProductAttrHeadWithValue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    if (json['head_value'] != null) {
      headValue = <HeadValue>[];
      json['head_value'].forEach((v) {
        headValue.add(new HeadValue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    if (this.headValue != null) {
      data['head_value'] = this.headValue.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HeadValue {
  String id;
  String name;
  int status;
  bool check = false;

  HeadValue({this.id, this.name, this.status, this.check});

  HeadValue.fromJson(Map<String, dynamic> json) {
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

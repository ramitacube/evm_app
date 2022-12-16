class OffersData {
  OfferData data;

  OffersData({this.data});

  OffersData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new OfferData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class OfferData {
  Offer offer;

  OfferData({this.offer});

  OfferData.fromJson(Map<String, dynamic> json) {
    offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offer != null) {
      data['offer'] = this.offer.toJson();
    }
    return data;
  }
}

class Offer {
  String name;
  String desc;
  String id;
  List<Media> media;

  Offer({this.name, this.desc, this.id, this.media});

  Offer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['Desc'];
    id = json['id'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['Desc'] = this.desc;
    data['id'] = this.id;
    if (this.media != null) {
      data['media'] = this.media.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  String id;
  String name;
  String caption;
  double size;
  String url;

  Media({this.id, this.name, this.caption, this.size, this.url});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    caption = json['caption'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['caption'] = this.caption;
    data['size'] = this.size;
    data['url'] = this.url;
    return data;
  }
}

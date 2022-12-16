
class PrivacyData {
  PrivacyPolicy privacyPolicy;

  PrivacyData({this.privacyPolicy});

  PrivacyData.fromJson(Map<String, dynamic> json) {
    privacyPolicy = json['privacyPolicy'] != null
        ? new PrivacyPolicy.fromJson(json['privacyPolicy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.privacyPolicy != null) {
      data['privacyPolicy'] = this.privacyPolicy.toJson();
    }
    return data;
  }
}

class PrivacyPolicy {
  String id;
  String title;
  String desc;

  PrivacyPolicy({this.id, this.title, this.desc});

  PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    desc = json['Desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Title'] = this.title;
    data['Desc'] = this.desc;
    return data;
  }
}

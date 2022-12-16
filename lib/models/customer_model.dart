
class CustomerData {
  Login login;

  CustomerData({this.login});

  CustomerData.fromJson(Map<String, dynamic> json) {
    login = json != null ? new Login.fromJson(json) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.login != null) {
      data['login'] = this.login.toJson();
    }
    return data;
  }
}

class Login {
  User user;
  String accessToken;

  Login({this.user, this.accessToken});

  Login.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['access_token'] = this.accessToken;
    return data;
  }
}

class User {
  String id;
  String name;
  String email;
  String phone;
  String gender;
  String dob;
  String address;
  String otp;

  User(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.gender,
        this.dob,
        this.address,
        this.otp});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    dob = json['dob'];
    address = json['address'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['otp'] = this.otp;
    return data;
  }
}

class User {
  String name;
  String gender;
  String email;
  String phone;
  String photoURL;
  DateTime dob;
  String company;
  String address;
  String balance;
  String membership;
  int progress;

  User({
    this.name,
    this.gender,
    this.email,
    this.phone,
    this.photoURL,
    this.dob,
    this.company,
    this.address,
    this.balance,
    this.membership,
    this.progress,
  });

  User copyWith({
    String name,
    String gender,
    String email,
    String phone,
    String photoURL,
    DateTime dob,
    String company,
    String address,
    String balance,
    String membership,
    int progress,
  }) =>
      User(
        name: name ?? this.name,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        photoURL: photoURL ?? this.photoURL,
        dob: dob ?? this.dob,
        company: company ?? this.company,
        address: address ?? this.address,
        balance: balance ?? this.balance,
        membership: membership ?? this.membership,
        progress: progress ?? this.progress,
      );

  User.fromJson(Map<String, dynamic> data) {
    name = data["name"];
    gender = data["gender"];
    email = data["email"];
    phone = data["phone"];
    photoURL = data["photo"];
    dob = data["dob"]?.toDate();
    company = data["company"];
    address = data["address"];
    balance = data["balance"];
    membership = data["membership"];
    progress = data["progress"];
  }

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "gender": gender == null ? null : gender,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "photo": photoURL == null ? null : photoURL,
        "dob": dob == null ? null : dob,
        "company": company == null ? null : company,
        "address": address == null ? null : address,
        "balance": balance == null ? null : balance,
        "membership": membership == null ? null : membership,
        "progress": progress == null ? null : progress,
      };
}

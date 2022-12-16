import '../core.dart';

class UserService {
  User getProfile() {
    return User(
      name: "Faisal Ramdan",
      email: "ratheesh@gmail.com",
      gender: "Male",
      phone: "+91 9897969594",
      photoURL: "assets/images/users/faisal-ramdan.jpg",
      dob: DateTime.parse("1982-03-17"),
      company: "Coding Your Life",
      address: "Permata Street No. 17, Bogor, West Java, Indonesia",
      balance: "17,7jt",
      membership: "Gold",
      progress: 77,
    );
  }
}

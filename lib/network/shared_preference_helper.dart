import 'dart:convert';

import 'package:car_rental/models/customer_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SharedPreferenceHelper {
  FlutterSecureStorage _sharedPreference = FlutterSecureStorage();

  initSharedPreference() async {
    _sharedPreference = FlutterSecureStorage();
  }

  Future<CustomerData> getUser() async {
    var data = await _sharedPreference.read(key: "profile");
    if (data != null) {
      return CustomerData.fromJson(jsonDecode(data));
    } else {
      return null;
    }
  }

  saveUser(String data) {
    _sharedPreference.write(key: "profile", value: data);
  }

  removeAll() async {
    await _sharedPreference.deleteAll();
  }
}

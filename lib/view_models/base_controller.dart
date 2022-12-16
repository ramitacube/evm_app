

import 'package:car_rental/network/network_exceptions.dart';
import 'package:car_rental/network/shared_preference_helper.dart';
import 'package:car_rental/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BaseController extends GetxController with SingleGetTickerProviderMixin{

  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
  String useId;
  Response response = Response.Loading;

  onException(NetworkException e) {
    print("${e.code}");
    setError();
  }

  setLoading() {
    response = Response.Loading;
    update();
  }

  setSuccess() {
    response = Response.Success;
    update();
  }

  setError() {
    response = Response.Success;
    update();
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: kPrimaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

enum Response { Loading, Error, Success }

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
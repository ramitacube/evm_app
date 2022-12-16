import 'package:car_rental/models/user.dart';
import 'package:car_rental/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationController extends GetxController {
  static ConfirmationController to = Get.find();
  final GlobalKey<ScaffoldState> confirmScaffoldKey =
      new GlobalKey<ScaffoldState>();
  User userProfile;
  // List<Car> cars = [];
  // List<Dealer> dealers = [];
  // List<RentTime> rentTime=[];
  bool selectTime;

  @override
  void onInit() {
    super.onInit();
    userProfile = UserService().getProfile();
  }

  void openDrawer() {
    confirmScaffoldKey.currentState.openDrawer();
  }
}

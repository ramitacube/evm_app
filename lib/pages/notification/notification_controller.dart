import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core.dart';

class NotificationController extends GetxController {
  List<NotificationMessage> messages = [];
  List<DateTime> messageDates = [];

  List<String> head = ["Offer", "Offer1"];
  List<String> body = ["bodyText1", "bodyText2"];

  String title = "qwerty";
  final GlobalKey<ScaffoldState> notifScaffoldKey =
      new GlobalKey<ScaffoldState>();
  User userProfile;

  @override
  void onInit() {
    super.onInit();
    loadData();
    userProfile = UserService().getProfile();
  }

  loadData() {
    messages = NotificationService().getMessageList();
  }

  removeMessage(NotificationMessage item) {
    messages.remove(item);
    update();
  }

  void openDrawer() {
    notifScaffoldKey.currentState.openDrawer();
  }

  void closeDrawer() {
    notifScaffoldKey.currentState.openEndDrawer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

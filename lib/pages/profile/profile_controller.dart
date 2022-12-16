import 'dart:io';
import 'package:car_rental/models/customer_model.dart';
import 'package:car_rental/view_models/user_controller.dart';
import 'package:car_rental/view_models/user_view_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  // User userProfile
  final GlobalKey<ScaffoldState> profScaffoldKey =
      new GlobalKey<ScaffoldState>();
  File pickedImage;
  String fileName;
  UserViewModel model;
  CustomerData customerData;

  UserController userController = Get.put(UserController());

  @override
  Future<void> onInit() async {
    super.onInit();

    Get.find<UserController>().getUser();

    update();
  }

  void openDrawer() {
    profScaffoldKey.currentState.openDrawer();
  }

  void closeDrawer() {
    profScaffoldKey.currentState.openEndDrawer();
  }

  Future pickImage({ImageSource source}) async {
    try {
      final image = await ImagePicker.pickImage(
          source: source, imageQuality: 100, maxWidth: 1020, maxHeight: 410);
      if (image == null) return;
      final imageTemp = File(image.path);
      // var result = await _compressAndroidWebpExample(src: image.path);

      this.fileName = image.path.toString();
      this.pickedImage = imageTemp;
    } on PlatformException catch (e) {
      print('Failed to get image: $e');
    }
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

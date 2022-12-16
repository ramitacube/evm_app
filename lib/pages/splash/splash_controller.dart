import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;
  @override
  void onInit() async {
    super.onInit();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (pageIndex < 4) {
        pageIndex++;
      }
      pageController.hasClients
          ? pageController.animateToPage(
              pageIndex,
              duration: Duration(milliseconds: 350),
              curve: Curves.easeIn,
            )
          : null;
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    Get.delete();
    print("[ MainController ] => onClose()");
    super.onClose();
  }
}

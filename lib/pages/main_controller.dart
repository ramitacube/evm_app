import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

class MainController extends GetxController {
  final pageCotroller = PageController();
  final animationDuration = const Duration(milliseconds: 350);
  int currentPage;
  List<BottomNavigationBarItem> navigationItems;

  @override
  void onInit() {
    currentPage=0;
    navigationItems = NavigationService().getNavigationItemList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }



  @override
  void onClose() {
    pageCotroller.dispose();
    Get.delete();
    print("[ MainController ] => onClose()");
    super.onClose();
  }
}

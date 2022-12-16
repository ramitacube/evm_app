import 'package:get/get.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class AvailableCarsController extends GetxController {
  final AppOpenAd appOpenAd = AppOpenAd()..load();

  @override
  void onInit() async {
    super.onInit();
    appOpenAd.onEvent.listen((e) => print("==> appOpenAd.onEvent : $e"));
    if (!appOpenAd.isAvailable) await appOpenAd.load();
    if (appOpenAd.isAvailable) {
      await appOpenAd.show();
      appOpenAd.load();
    }
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }
}

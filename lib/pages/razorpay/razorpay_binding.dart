import 'package:get/get.dart';
import 'razorpay_controller.dart';

class RazorpayBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RazorpayController>(RazorpayController());
  }
}

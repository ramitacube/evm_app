import 'package:car_rental/pages/Confirm/confirm_booking_controller.dart';
import 'package:car_rental/pages/document_page/document_controller.dart';
import 'package:car_rental/pages/document_upload/document_upload_controller.dart';
import 'package:car_rental/pages/privacy_policy/privacy_controller.dart';
import 'package:car_rental/pages/product_view/product_controller.dart';
import 'package:car_rental/pages/razorpay/razorpay_controller.dart';
import 'package:car_rental/pages/rentals/rental_controller.dart';
import 'package:car_rental/pages/splash/splash_controller.dart';
import 'package:car_rental/pages/started/started_controller.dart';
import 'package:car_rental/pages/termsAndCondition/terms_condition_controller.dart';
import 'package:car_rental/view_models/user_controller.dart';
import 'package:get/get.dart';
import '../core.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
    Get.put<HomeController>(HomeController());
    Get.put<SearchController>(SearchController());
    Get.put<NotificationController>(NotificationController());
    Get.put<ConfirmationController>(ConfirmationController());
    Get.put<ProfileController>(ProfileController());
    Get.put<RentalController>(RentalController());
    Get.put<RazorpayController>(RazorpayController());
    Get.put<SplashController>(SplashController());
    Get.put<ProfileController>(ProfileController());
    Get.put<DocumentController>(DocumentController());
    Get.put<UploadController>(UploadController());
    Get.put<PrivacyController>(PrivacyController());
    Get.put<ProductController>(ProductController());
    Get.put<TermsController>(TermsController());
    Get.put<StartedController>(StartedController());
    Get.put<UserController>(UserController());
  }
}

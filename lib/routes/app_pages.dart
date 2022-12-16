import 'package:car_rental/pages/Confirm/confirm_view.dart';
import 'package:car_rental/pages/check_avilability/availability_view.dart';
import 'package:car_rental/pages/check_avilability/avilability_binding.dart';
import 'package:car_rental/pages/document_page/document_view.dart';
import 'package:car_rental/pages/document_upload/document_upload_view.dart';
import 'package:car_rental/pages/filter/filter_binding.dart';
import 'package:car_rental/pages/filter/filter_view.dart';
import 'package:car_rental/pages/privacy_policy/privacy_view.dart';
import 'package:car_rental/pages/product_view/product_view.dart';
import 'package:car_rental/pages/profile/profile_binding.dart';
import 'package:car_rental/pages/razorpay/razorpay_view.dart';
import 'package:car_rental/pages/rental_package/rental_package_binding.dart';
import 'package:car_rental/pages/rental_package/rental_package_view.dart';
import 'package:car_rental/pages/splash/splash_view.dart';
import 'package:car_rental/pages/started/otpLogin_view.dart';
import 'package:car_rental/pages/started/otp_view.dart';
import 'package:car_rental/pages/termsAndCondition/term_condition_view.dart';
import 'package:get/get.dart';
import '../core.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.FORGET_PASSWORD,
      page: () => ForgetPasswordView(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterView(),
    ),
    GetPage(name: Routes.OTP, page: () => OtpView(), binding: MainBinding()),
    GetPage(
        name: Routes.OTPLogin,
        page: () => OtpLoginView(),
        binding: MainBinding()),
    GetPage(
      name: Routes.AVAILABLE_CARS,
      page: () => AvailableCarsView(),
      binding: AvailableCarsBinding(),
    ),
    GetPage(
      name: Routes.BOOK_CAR,
      page: () => BookCarView(),
      binding: BookCarBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => NotificationView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.CONFIRMATION,
      page: () => ConfirmationView(),
      //binding: MainBinding(),
    ),
    GetPage(
      name: Routes.AVAILABILITY,
      binding: AvailabilityBinding(),
      page: () => AvailabilityView(),
      //binding: MainBinding(),
    ),
    GetPage(
      name: Routes.FILTER,
      binding: FilterBinding(),
      page: () => FilterView(),
    ),
    GetPage(
      //binding: MainBinding(),
      name: Routes.RAZORPAY,
      page: () => RazorpayView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      binding: ProfileBinding(),
      page: () => ProfileView(),
    ),
    GetPage(
      name: Routes.DOCUMENT,
      binding: MainBinding(),
      page: () => DocumentView(),
    ),
    GetPage(
      name: Routes.PACKAGE,
      binding: PackageBinding(),
      page: () => PackageView(),
    ),
    GetPage(
      name: Routes.KYCUPLOAD,
      binding: MainBinding(),
      page: () => UploadView(),
    ),
    GetPage(
      name: Routes.PRIVACY,
      binding: MainBinding(),
      page: () => PrivacyView(),
    ),
    GetPage(
      name: Routes.PRODUCTSEARCH,
      binding: MainBinding(),
      page: () => ProductView(),
    ),
    GetPage(
      name: Routes.TERMSCONDITION,
      binding: MainBinding(),
      page: () => TermsView(),
    ),
    GetPage(
      name: Routes.TERMSCONDITION,
      binding: MainBinding(),
      page: () => TermsView(),
    ),
  ];
}

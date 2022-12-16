
import 'package:car_rental/pages/rental_package/rental_package_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class PackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PackageController>(PackageController());
  }
}
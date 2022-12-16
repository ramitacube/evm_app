import 'package:get/get.dart';
import 'package:car_rental/pages/check_avilability/availability_controller.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class AvailabilityBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<AvailabilityController> (AvailabilityController());
  }

}
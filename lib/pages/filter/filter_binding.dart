import 'package:car_rental/pages/filter/filter_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class FilterBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<FilterController> (FilterController());
  }

}
import 'package:car_rental/pages/document_page/document_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class DocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DocumentController>(DocumentController());
  }
}

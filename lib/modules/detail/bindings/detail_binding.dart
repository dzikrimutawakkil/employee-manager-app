import 'package:employee_manager_app/export.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailController());
  }
}

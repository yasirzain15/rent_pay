import 'package:get/get.dart';
import '../../Controller/property_controller.dart';

class PropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyController>(
      () => PropertyController(),
      fenix: true, // ✅ Reloads if disposed
    );
  }
}

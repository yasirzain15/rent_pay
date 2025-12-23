import 'package:get/get.dart';
import '../../Controller/bottom_nav_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(
      () => BottomNavController(),
      fenix: true, // ✅ Keeps controller alive
    );
  }
}

import 'package:get/get.dart';

import '../../Controller/bottom_nav_controller.dart';
import '../../Controller/property_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    /// 🧭 Bottom Navigation Controller
    /// App-wide → survives navigation
    Get.lazyPut<BottomNavController>(
      () => BottomNavController(),
      fenix: true, // ✅ Recreates if disposed (safe for future)
    );

    /// 🏠 Property Controller
    /// API data will be fetched here later
    Get.lazyPut<PropertyController>(
      () => PropertyController(),
      fenix: true, // 🔮 Safe for API refresh & pagination
    );
  }
}

import 'package:get/get.dart';
import 'package:rent_pay/Core/Routes/app_routes.dart';

// Views
import 'package:rent_pay/Views/login_view.dart';
import 'package:rent_pay/Views/home_view.dart';
import 'package:rent_pay/Views/property_list_view.dart';
import 'package:rent_pay/Views/property_detail_view.dart';

// Bindings
import 'package:rent_pay/Core/Bindings/home_binding.dart';
import 'package:rent_pay/Core/Bindings/property_binding.dart';

class AppPages {
  AppPages._();

  static final routes = [
    /// 🔐 LOGIN
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      // ❌ No binding (simple screen)
    ),

    /// 🏠 HOME (Bottom Nav + Dashboard)
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
      // ✅ Manages BottomNavController (global)
    ),

    /// 🏢 PROPERTY LIST
    GetPage(
      name: AppRoutes.propertyList,
      page: () => PropertyListView(),
      binding: PropertyBinding(),
      // ✅ PropertyController (API-ready)
    ),

    /// 🏡 PROPERTY DETAIL
    GetPage(
      name: AppRoutes.propertyDetail,
      page: () => const PropertyDetailView(),
      binding: PropertyBinding(),
      // 🔮 Reuse PropertyController
      // In future: you may create PropertyDetailBinding if needed
    ),
  ];
}

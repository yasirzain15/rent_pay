import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Core/Constants/colors.dart';
import 'Core/Routes/app_pages.dart';
import 'Core/Routes/app_routes.dart';
import 'Core/Bindings/initial_binding.dart'; // ✅ ADD THIS

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent Pay',

      /// 🎨 THEME (Your existing colors — untouched)
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
      ),

      /// 🧭 ROUTING
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,

      /// 🔗 BINDINGS (VERY IMPORTANT)
      initialBinding: InitialBinding(), // ✅ ADD THIS
    );
  }
}

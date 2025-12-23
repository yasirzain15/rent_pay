import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Core/Constants/colors.dart';
import 'Core/Routes/app_pages.dart';
import 'Core/Routes/app_routes.dart';
import 'Core/Bindings/initial_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ IMPORTANT
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent Pay',

      /// 🌍 REQUIRED FOR Directionality SAFETY
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),

      /// 🎨 THEME
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
        appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
      ),

      /// 🧭 ROUTING
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,

      /// 🔗 GLOBAL BINDINGS
      initialBinding: InitialBinding(),

      /// 🚨 SAFETY BUILDER (prevents null Directionality crashes)
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

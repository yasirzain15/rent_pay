import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rent_pay/Core/Constants/colors.dart';
import 'package:rent_pay/Core/Constants/app_assets.dart';
import 'package:rent_pay/Controller/bottom_nav_controller.dart';
import 'package:rent_pay/Widgets/custom_bottom_nav.dart';
import 'package:rent_pay/Widgets/property_card.dart';
import 'package:rent_pay/Widgets/search_bar_widget.dart';
import 'property_list_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  // Controller (will later hold API state as well)
  final BottomNavController navController = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      /// Bottom Navigation
      bottomNavigationBar: Obx(
        () => CustomBottomNav(
          currentIndex: navController.currentIndex.value,
          onTap: navController.changeIndex,
        ),
      ),

      /// Screen switching (API safe)
      body: Obx(() {
        if (navController.currentIndex.value == 0) {
          return _homeContent();
        } else {
          return PropertyListView();
        }
      }),
    );
  }

  /// ================= HOME UI =================
  Widget _homeContent() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const SizedBox(height: 24),
            _exploreCard(),
            const SizedBox(height: 30),
            _searchField(),
            const SizedBox(height: 24),
            _propertyGrid(), // 🔁 THIS WILL BE REPLACED BY API DATA
          ],
        ),
      ),
    );
  }

  /// ---------------- HEADER ----------------
  Widget _header() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(AppAssets.profile),
        ),
        const SizedBox(width: 12),
        const Text(
          "Morning Rushdeen!",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Icon(Icons.notifications_none, color: AppColors.textSecondary),
      ],
    );
  }

  /// ---------------- EXPLORE CARD ----------------
  Widget _exploreCard() {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, Color(0xFF8B5CF6)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Rental\nExplore",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Text("127 near you", style: TextStyle(color: Colors.white)),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  /// ---------------- SEARCH ----------------
  Widget _searchField() {
    return const SearchBarWidget(hint: "Address, city, zip");
  }

  /// ---------------- PROPERTY GRID ----------------
  Widget _propertyGrid() {
    // 🔁 TEMPORARY LOCAL DATA (REPLACE WITH API RESPONSE)
    final List<Map<String, String>> properties = [
      {
        "image": AppAssets.house1,
        "title": "Springdale Heights",
        "price": "\$2,700,000",
      },
      {
        "image": AppAssets.house2,
        "title": "Lakeside View",
        "price": "\$2,890,000",
      },
      {
        "image": AppAssets.house3,
        "title": "Hilltop Terrace",
        "price": "\$2,300,000",
      },
      {
        "image": AppAssets.house4,
        "title": "Riverside Park",
        "price": "\$2,400,000",
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: properties.length, // 🔁 API length
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.68, // 🔧 CONTROL CARD HEIGHT HERE
      ),
      itemBuilder: (context, index) {
        final item = properties[index]; // 🔁 API item

        return PropertyCard(
          image: item["image"]!, // 🔁 API image
          title: item["title"]!, // 🔁 API title
          price: item["price"]!, // 🔁 API price
        );
      },
    );
  }
}

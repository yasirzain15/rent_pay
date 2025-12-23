import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/Constants/colors.dart';
import '../Core/Constants/app_assets.dart';

class PropertyDetailView extends StatelessWidget {
  const PropertyDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final String title = args['title'] ?? 'Property Title';
    final String price = args['price'] ?? '\$0';
    final List<String> images =
        args['images'] ??
        [
          AppAssets.house1,
          AppAssets.house2,
          AppAssets.house3,
          AppAssets.house4,
        ];

    final double imageHeight = 320;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          /// 🔹 MAIN IMAGE
          SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: Image.asset(images.first, fit: BoxFit.cover),
          ),

          /// 🔹 TOP ACTION ICONS
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  _iconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
                  const Spacer(),
                  _iconButton(icon: Icons.share, onTap: () {}),
                  const SizedBox(width: 12),
                  _iconButton(icon: Icons.favorite_border, onTap: () {}),
                ],
              ),
            ),
          ),

          /// 🔹 DETAILS CARD
          Positioned(
            top: imageHeight - 60,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔹 IMAGE THUMBNAILS
                  SizedBox(
                    height: 70,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (_, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          images[index],
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// 🔹 SCROLLABLE DETAILS
                  SizedBox(
                    height: screenHeight - imageHeight - 120, // dynamic height
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 🔹 PRICE ROW
                          Row(
                            children: [
                              Text(
                                price,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "Price cut",
                                  style: TextStyle(
                                    color: AppColors.background,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          /// 🔹 PROPERTY FEATURES
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              _InfoItem(
                                icon: Icons.bathtub_outlined,
                                text: "2 baths",
                              ),
                              _InfoItem(
                                icon: Icons.bed_outlined,
                                text: "2 beds",
                              ),
                              _InfoItem(
                                icon: Icons.square_foot_outlined,
                                text: "1,000 sqft",
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          /// 🔹 TITLE / ADDRESS
                          Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Location from API",
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),

                  /// 🔹 PRIMARY ACTION
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Schedule Tour",
                        style: TextStyle(color: AppColors.background),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      /// 🔹 BOTTOM ACTION BAR
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: const BoxDecoration(color: Colors.black),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "List price",
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {},
              child: const Text("Request Info"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

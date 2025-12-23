import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/Constants/colors.dart';
import '../Core/Routes/app_routes.dart';

class PropertyListCard extends StatelessWidget {
  final String image;
  final String price;
  final String title;

  // 🔮 Future:
  // final String propertyId; // API property id (add later)

  const PropertyListCard({
    super.key,
    required this.image,
    required this.price,
    required this.title,
    // required this.propertyId, // 🔮 API later
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// 👉 Navigate to Property Detail Screen
        /// 🔮 Later you will pass propertyId or full model here
        Get.toNamed(
          AppRoutes.propertyDetail,
          arguments: {
            "image": image,
            "price": price,
            "title": title,
            // "id": propertyId, // 🔮 API later
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            16, // 🎯 Card roundness (adjust if needed)
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            /// 🖼 Property Image
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(
                  16, // 🎯 Image corner radius (sync with card)
                ),
              ),
              child: Image.asset(
                image,
                width: 120, // 🔧 Adjust width if API images vary
                height: 110, // 🔧 Adjust height if overflow occurs
                fit: BoxFit.cover,
              ),
            ),

            /// 📄 Property Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(
                  12, // 🔧 Inner spacing (API text length safe)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 💰 Price
                    Text(
                      price,
                      maxLines: 1, // 🔮 Prevent overflow from API
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// 🏠 Title / Location
                    Text(
                      title,
                      maxLines: 2, // 🔮 API titles can be long
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

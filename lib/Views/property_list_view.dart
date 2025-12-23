import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/property_controller.dart';
import '../Widgets/property_list_card.dart';
import '../Widgets/search_bar_widget.dart';
import '../Core/Routes/app_routes.dart';

class PropertyListView extends StatelessWidget {
  PropertyListView({super.key});

  /// 🔮 Controller (already injected via Bindings)
  final PropertyController controller = Get.find<PropertyController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Screen Title
            const Text(
              "All Properties",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            /// 🔍 SEARCH BAR (API READY)
            SearchBarWidget(
              hint: "Search by location, city, zip",
              onChanged: (value) {
                // 🔮 Future:
                // controller.searchProperties(value);
              },
            ),

            const SizedBox(height: 20),

            /// 🏠 PROPERTY LIST
            Expanded(
              child: Obx(
                () => ListView.separated(
                  itemCount: controller.properties.length, // 🔮 API length
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = controller.properties[index];

                    return GestureDetector(
                      onTap: () {
                        /// 🔮 NAVIGATION TO DETAIL SCREEN
                        Get.toNamed(
                          AppRoutes.propertyDetail,
                          arguments: {
                            'title': item.title, // 🔮 API field
                            'price': item.price, // 🔮 API field
                            'images': item.image, // 🔮 API image list
                          },
                        );
                      },

                      /// 🧩 PROPERTY CARD
                      child: PropertyListCard(
                        image: item.image, // 🔮 API image
                        price: item.price, // 🔮 API price
                        title: item.title, // 🔮 API title
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

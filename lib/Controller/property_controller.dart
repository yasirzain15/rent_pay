import 'package:get/get.dart';
import '../Models/property_model.dart';
import '../Core/Constants/app_assets.dart';

class PropertyController extends GetxController {
  final properties = <PropertyModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyProperties();
  }

  void loadDummyProperties() {
    properties.value = [
      PropertyModel(
        image: AppAssets.house1,
        price: '\$2,700,000',
        title: 'Springdale Heights',
      ),
      PropertyModel(
        image: AppAssets.house2,
        price: '\$2,890,000',
        title: 'Lakeside View',
      ),
      PropertyModel(
        image: AppAssets.house3,
        price: '\$2,300,000',
        title: 'Hilltop Terrace',
      ),
      PropertyModel(
        image: AppAssets.house4,
        price: '\$2,400,000',
        title: 'Riverside Park',
      ),
    ];
  }
}

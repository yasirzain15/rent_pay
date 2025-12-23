import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  // Reactive variables
  var profileImage = ''.obs;
  var gender = ''.obs;

  // Text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cnicController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();

  /// Pick profile image
  void pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage.value = pickedFile.path;
    }
  }

  /// Update profile (future API call)
  void updateProfile() {
    // Example: Validate fields
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all required fields');
      return;
    }

    // Future: Send API request here
    Get.snackbar('Success', 'Profile updated successfully!');
  }

  @override
  void onClose() {
    // Dispose controllers
    nameController.dispose();
    emailController.dispose();
    cnicController.dispose();
    phoneController.dispose();
    dobController.dispose();
    super.onClose();
  }
}

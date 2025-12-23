import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Core/Constants/colors.dart';
import '../Controller/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(color: AppColors.background),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(
          color: Colors.white, // 👈 Back button color
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Obx(
              () => GestureDetector(
                onTap: controller.pickProfileImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: controller.profileImage.value.isNotEmpty
                      ? FileImage(File(controller.profileImage.value))
                            as ImageProvider
                      : const AssetImage('assets/images/profile.png'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField("Name", controller.nameController),
            _buildTextField("Email", controller.emailController),
            _buildTextField("CNIC", controller.cnicController),
            _buildTextField("Phone Number", controller.phoneController),
            const SizedBox(height: 10),
            _buildGenderSelector(),
            _buildDateOfBirthField(context),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: controller.updateProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Update",
                style: TextStyle(color: AppColors.background),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildGenderSelector() {
    return Obx(
      () => Row(
        children: [
          const Text("Gender:"),
          const SizedBox(width: 20),
          ChoiceChip(
            label: const Text("Male"),
            selected: controller.gender.value == "Male",
            onSelected: (val) {
              if (val) controller.gender.value = "Male";
            },
          ),
          const SizedBox(width: 10),
          ChoiceChip(
            label: const Text("Female"),
            selected: controller.gender.value == "Female",
            onSelected: (val) {
              if (val) controller.gender.value = "Female";
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDateOfBirthField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller.dobController,
        readOnly: true,
        decoration: const InputDecoration(
          labelText: "Date of Birth",
          border: OutlineInputBorder(),
        ),
        onTap: () async {
          DateTime? picked = await showDatePicker(
            context: context,
            initialDate: controller.dobController.text.isNotEmpty
                ? DateTime.tryParse(controller.dobController.text)!
                : DateTime(1990, 1, 1),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (picked != null) {
            controller.dobController.text = DateFormat(
              'yyyy-MM-dd',
            ).format(picked);
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void resetPassword() {
    if (passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields", snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (passwordController.text.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters", snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    Get.snackbar("Success", "Password reset successfully!", snackPosition: SnackPosition.BOTTOM);
    Get.offAllNamed('/login');
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

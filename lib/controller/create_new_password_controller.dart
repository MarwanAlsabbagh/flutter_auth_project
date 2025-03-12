// create_new_password_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repository/reset_password_repository.dart';

class CreateNewPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final ResetPasswordRepository repository = Get.find();

  var isLoading = false.obs;

  void resetPassword() async {
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

    try {
      isLoading.value = true;
      bool success = await repository.resetPassword(passwordController.text);
      if (success) {
        Get.snackbar("Success", "Password reset successfully!", snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed('/login'); 
      } else {
        Get.snackbar("Error", "Failed to reset password. Please try again.", snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;

    Get.snackbar("Success", "Login successful", snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

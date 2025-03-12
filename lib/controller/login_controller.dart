import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repository/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository authRepository = Get.find<LoginRepository>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    try {
      bool success = await authRepository.login(emailController.text, passwordController.text);
      if (success) {
        Get.snackbar("Success", "Login successful", snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", "Invalid credentials", snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
    isLoading.value = false;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

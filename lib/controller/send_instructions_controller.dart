import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repository/send_instructions_repository.dart';
import '../viwe/pages/check_emai_page.dart';


class SendInstructionsController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final SendInstructionsRepository repository = Get.find();

  var isLoading = false.obs;

  void sendInstructions() async {
    if (emailController.text.isEmpty || !emailController.text.contains('@')) {
      Get.snackbar("Error", "Please enter a valid email address");
      return;
    }

    try {
      isLoading.value = true;
      bool success = await repository.sendResetInstructions(emailController.text);
      if (success) {
        Get.to(() => CheckEmailView());
      } else {
        Get.snackbar("Error", "Failed to send email. Please try again.");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

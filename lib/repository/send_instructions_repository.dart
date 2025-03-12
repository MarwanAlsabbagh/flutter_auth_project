import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../service/api_service.dart';

class SendInstructionsRepository extends GetxService{
  final ApiService apiService = Get.find<ApiService>();
  Future<bool> sendResetInstructions(String email) async {
    try {
      final response = await apiService.post('/sendResetInstructions', data: {
        'email': email,
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }
}
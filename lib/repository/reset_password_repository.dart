// reset_password_repository.dart
import 'package:get/get.dart';

import '../service/api_service.dart';

class ResetPasswordRepository extends GetxService {
  final ApiService apiService = Get.find<ApiService>();
  Future<bool> resetPassword(String password) async {
    try {
      final response = await apiService.post('/register', data:{'password':password});
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}

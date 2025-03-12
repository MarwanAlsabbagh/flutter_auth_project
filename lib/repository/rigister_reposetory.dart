import 'package:get/get.dart';

import '../model/user_model.dart';
import '../service/api_service.dart';

class RegisterRepository extends GetxService {
  final ApiService apiService = Get.find<ApiService>();

  Future<bool> register(User user) async {
    try {
      final response = await apiService.post('/register', data: user.toJson());

      return response.statusCode == 201;
    } catch (e) {
      throw Exception("Registration failed: ${e.toString()}");
    }
  }
}

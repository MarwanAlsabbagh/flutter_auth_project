import 'package:get/get.dart';

import '../service/api_service.dart';


class LoginRepository extends GetxService {
  final ApiService apiService = Get.find<ApiService>();

  Future<bool> login(String email, String password) async {
    try {
      final response = await apiService.post('/login', data: {
        'email': email,
        'password': password,
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

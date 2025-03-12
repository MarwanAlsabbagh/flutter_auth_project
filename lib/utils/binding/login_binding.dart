import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../../repository/login_repository.dart';
import '../../service/api_service.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => LoginRepository());
    Get.lazyPut(() => LoginController());
  }
}

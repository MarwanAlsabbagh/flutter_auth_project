import 'package:get/get.dart';
import 'package:authapp/repository/login_repository.dart';

import 'package:authapp/controller/login_controller.dart';
import 'package:authapp/controller/register_controller.dart';

import '../../controller/create_new_password_controller.dart';
import '../../controller/send_instructions_controller.dart';
import '../../repository/reset_password_repository.dart';
import '../../repository/rigister_reposetory.dart';
import '../../repository/send_instructions_repository.dart';
import '../../service/api_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService()); // خدمة الشبكة
    Get.lazyPut(() => LoginRepository()); // Repository لتسجيل الدخول
    Get.lazyPut(() => RegisterRepository()); // Repository للتسجيل
    Get.lazyPut(() => LoginController()); // التحكم في تسجيل الدخول
    Get.lazyPut(() => RegisterController()); // التحكم في التسجيل
    Get.lazyPut(() => SendInstructionsRepository());
    Get.lazyPut(() => SendInstructionsController());
    Get.lazyPut<ResetPasswordRepository>(() => ResetPasswordRepository());
    Get.lazyPut<CreateNewPasswordController>(() => CreateNewPasswordController());
  }
}

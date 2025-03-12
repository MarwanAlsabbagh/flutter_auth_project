import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../model/user_model.dart';
import '../repository/rigister_reposetory.dart';

class RegisterController extends GetxController {
  final RegisterRepository registerRepository = Get.find<RegisterRepository>();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var nationalIDController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var locationCityController = TextEditingController();

  var selectedCity = Rxn<String>();
  var selectedGender = Rxn<String>();
  var personImage = Rxn<File>();
  var frontNationalID = Rxn<File>();
  var backNationalID = Rxn<File>();

  final ImagePicker _picker = ImagePicker();

  // 📸 اختيار الصورة الشخصية
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      personImage.value = File(pickedFile.path);
    }
  }

  // 📸 اختيار الهوية الأمامية
  Future<void> pickFrontNationalID({required ImageSource source}) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      frontNationalID.value = File(pickedFile.path);
    }
  }

  // 📸 اختيار الهوية الخلفية
  Future<void> pickBackNationalID({required ImageSource source}) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      backNationalID.value = File(pickedFile.path);
    }
  }

  // 📝 تنفيذ عملية التسجيل
  Future<void> register() async {
    // التأكد من أن جميع الحقول المطلوبة قد تم تعبئتها
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        nationalIDController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        selectedCity.value == null ||
        selectedGender.value == null ||
        personImage.value == null || // التأكد من أن الصورة الشخصية تم اختيارها
        frontNationalID.value == null || // التأكد من أن الهوية الأمامية تم رفعها
        backNationalID.value == null) { // التأكد من أن الهوية الخلفية تم رفعها
      Get.snackbar("Error", "Please fill all required fields and upload all images", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // التأكد من أن كلمة المرور وتأكيد كلمة المرور متطابقتان
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    var user = User(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      nationalID: nationalIDController.text,
      phone: phoneController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      city: selectedCity.value!,
      gender: selectedGender.value!,
      address: locationCityController.text,
      frontNationalID: frontNationalID.value,
      backNationalID: backNationalID.value,
    );

    try {
      bool success = await registerRepository.register(user);
      if (success) {
        Get.snackbar("Success", "Account created successfully!", snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", "Registration failed", snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    // تحرير المتحكمات بعد الاستخدام
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    nationalIDController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    locationCityController.dispose();
    super.onClose();
  }
}

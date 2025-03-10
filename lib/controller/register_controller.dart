import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
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
  var backNationalID = Rxn<File>();  // ✅ تأكيد أنه Rxn<File> وليس Rx<String?>

  final ImagePicker _picker = ImagePicker();

  /// 🔹 اختيار الصورة من الكاميرا
  Future<void> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      personImage.value = File(pickedFile.path);
    }
  }

  /// 🔹 اختيار الصورة من المعرض
  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      personImage.value = File(pickedFile.path);
    }
  }

  /// 🔹 اختيار الهوية الأمامية
  Future<void> pickFrontNationalID({required ImageSource source}) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      frontNationalID.value = File(pickedFile.path);
    }
  }

  /// 🔹 اختيار الهوية الخلفية
  Future<void> pickBackNationalID({required ImageSource source}) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      backNationalID.value = File(pickedFile.path);
    }
  }

  void register() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        nationalIDController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        selectedCity.value == null ||
        selectedGender.value == null) {
      Get.snackbar("Error", "Please fill all required fields", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    Get.snackbar("Success", "Account created successfully!", snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
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

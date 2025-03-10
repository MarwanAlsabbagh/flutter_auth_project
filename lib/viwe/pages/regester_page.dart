import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/register_controller.dart';
import '../../utils/globall_color.dart';
import '../wedgit/dropdown_widget.dart';
import '../wedgit/eleveted_button.dart';
import '../wedgit/image_generic_widget.dart';
import '../wedgit/text_form_wegit.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's create your account",
                style: TextStyle(
                  fontSize: 18,
                  color: GlobalColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              /// ويدجت اختيار الصورة
              Center(child: ImagePickerWidget()),

              SizedBox(height: 20),
              /// الاسم الأول واسم العائلة
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      controller: controller.firstNameController,
                      hintText: 'First Name',
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFieldWidget(
                      controller: controller.lastNameController,
                      hintText: 'Last Name',
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              /// البريد الإلكتروني
              TextFieldWidget(
                controller: controller.emailController,
                hintText: 'E-mail',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15),

              /// رقم الهوية الوطنية
              TextFieldWidget(
                controller: controller.nationalIDController,
                hintText: 'National ID',
                prefixIcon: Icons.perm_identity,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),

              /// رقم الهاتف
              TextFieldWidget(
                controller: controller.phoneController,
                hintText: 'Phone Number',
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 15),

              /// كلمة المرور
              TextFieldWidget(
                controller: controller.passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                obscureText: true,
              ),
              SizedBox(height: 15),

              /// تأكيد كلمة المرور
              TextFieldWidget(
                controller: controller.confirmPasswordController,
                hintText: 'Confirm Password',
                prefixIcon: Icons.lock,
                obscureText: true,
              ),
              SizedBox(height: 15),

              /// اختيار المحافظة
              Obx(() => DropdownWidget(
                hintText: "اختر محافظتك",
                items: ["دمشق", "حلب", "حمص", "حماة", "اللاذقية", "طرطوس", "دير الزور", "الرقة", "الحسكة", "درعا", "السويداء", "القنيطرة"],
                selectedValue: controller.selectedCity.value,
                onChanged: (newValue) {
                  controller.selectedCity.value = newValue;
                },
                prefixIcon: Icons.location_city,
              )),
              SizedBox(height: 15),

              /// العنوان
              TextFieldWidget(
                controller: controller.locationCityController,
                hintText: 'Your Address',
                prefixIcon: Icons.location_city,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 15),

              /// اختيار الجنس
              Obx(() => DropdownWidget(
                hintText: "الجنس",
                items: ["ذكر", "أنثى"],
                selectedValue: controller.selectedGender.value,
                onChanged: (newValue) {
                  controller.selectedGender.value = newValue;
                },
                prefixIcon: Icons.male,
              )),

              SizedBox(height: 20),

              /// رفع صور الهوية الوطنية
              Text(
                "Upload National ID Images",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: GlobalColors.textColor),
              ),

              SizedBox(height: 10),

              Obx(() => TextFieldWidget(
                controller: TextEditingController(
                    text: controller.frontNationalID.value != null
                        ? "Front ID Uploaded"
                        : ""),
                hintText: 'Upload Front National ID',
                prefixIcon: Icons.credit_card,
                readOnly: true,
                onTap: () {
                  controller.pickFrontNationalID(source: ImageSource.gallery);
                },
              )),
              SizedBox(height: 15),

              Obx(() => TextFieldWidget(
                controller: TextEditingController(
                    text: controller.backNationalID.value != null
                        ? "Back ID Uploaded"
                        : ""),
                hintText: 'Upload Back National ID',
                prefixIcon: Icons.credit_card,
                readOnly: true,
                onTap: () {
                  controller.pickBackNationalID(source: ImageSource.gallery);
                },
              )),
              SizedBox(height: 20),
              /// زر التسجيل
              ButtonWidget(
                text: 'Sign Up',
                onPressed: () {
                  controller.register();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

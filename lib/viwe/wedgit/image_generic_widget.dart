import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/register_controller.dart';
import '../../utils/globall_color.dart';
import 'dialog_widget.dart';

class ImagePickerWidget extends StatelessWidget {
  final RegisterController controller = Get.find();

  ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Stack(
        children: [
          /// 🔹 عرض الصورة المختارة أو الأيقونة الافتراضية
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white38,
              image: controller.personImage.value != null
                  ? DecorationImage(
                image: FileImage(File(controller.personImage.value!.path)),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: controller.personImage.value == null
                ? const Center(
              child: Icon(
                Icons.person,
                color: Colors.grey,
                size: 50,
              ),
            )
                : null,
          ),

          /// 🔹 زر الكاميرا لتغيير الصورة
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogWidget(
                      onCameraTap: () {
                        controller.pickImageFromCamera();
                        Get.back();
                      },
                      onGalleryTap: () {
                        controller.pickImageFromGallery();
                        Get.back();
                      },
                      cameraText: "قم بأختيار صورة من الكاميرا",
                      galleryText: "قم بأختيار صورة من المعرض",
                      mainText: 'اختر صورة شخصية',
                    );
                  },
                );
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 18,
                  color: GlobalColors.mainColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

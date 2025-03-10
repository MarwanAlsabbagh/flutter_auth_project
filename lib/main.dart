import 'package:authapp/utils/binding/intial_binding.dart';
import 'package:authapp/viwe/pages/check_emai_page.dart';
import 'package:authapp/viwe/pages/create_new_password_page.dart';
import 'package:authapp/viwe/pages/login_page.dart';
import 'package:authapp/viwe/pages/regester_page.dart';
import 'package:authapp/viwe/pages/send_instructions.dart';
import 'package:authapp/viwe/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  InitialBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:CreateNewPasswordView() ,
    );
  }
}

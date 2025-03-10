import 'package:authapp/utils/globall_color.dart';
import 'package:authapp/viwe/pages/regester_page.dart';
import 'package:authapp/viwe/pages/send_instructions.dart';
import 'package:authapp/viwe/wedgit/eleveted_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/login_controller.dart';
import '../wedgit/text_form_wegit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(height: 25),
                    Text(
                      "Logo",
                      style: TextStyle(
                        color: GlobalColors.mainColor,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Login to your account",
                        style: TextStyle(
                          color: GlobalColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
            
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFieldWidget(
                      controller:controller.emailController,
                      hintText: 'Email',
                      prefixIcon: Icons.email,
                      onTap: () {},
                      readOnly: false,
                    ),
                    SizedBox(height: 20),
                    TextFieldWidget(
                      controller: controller.passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      onTap: () {},
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap:  (){Get.to(SendInstructionsView());},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: GlobalColors.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Obx(() => controller.isLoading.value
                        ? CircularProgressIndicator()
                        : ButtonWidget(
                      text: 'Sign in',
                      onPressed: controller.login,
                    )),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(RegisterPage());
                        },
                        child: Text(
                          "Don't have an account? Sign up",
                          style: TextStyle(
                            color: GlobalColors.mainColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

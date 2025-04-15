import 'package:flutter/cupertino.dart';
import 'package:flutter_ui/sign_in_page.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;
  var selectedCountryCode = '+880'.obs; // Default to Bangladesh
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    // Validate all fields
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields');
      return;
    }

    // Validate phone number (country code + phone number)
    if (!RegExp(r'^\+\d{1,4}\d{8,}$')
        .hasMatch('$selectedCountryCode${phoneController.text}')) {
      Get.snackbar('Error', 'Invalid phone number');
      return;
    }

    // Validate email
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(emailController.text)) {
      Get.snackbar('Error', 'Invalid email address');
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }
    if (passwordController.text.length < 8) {
      Get.snackbar('Error', 'Password must be at least 8 characters');
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.snackbar('Success', 'Account created successfully');
    Get.off(() => const SignInPage());
  }
}
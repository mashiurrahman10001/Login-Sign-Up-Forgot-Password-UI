import 'package:get/get.dart';

class SignInController extends GetxController {
  var rememberMe = false.obs;
  var isLoading = false.obs;
  var obscurePassword = true.obs; // Added for password visibility toggle

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  Future<void> signIn() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulate network call
    isLoading.value = false;
    Get.snackbar('Success', 'Signed in successfully');
    // Add navigation to the next screen (e.g., HomePage) after successful sign-in
  }
}
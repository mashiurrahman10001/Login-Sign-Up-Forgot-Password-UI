import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  var isLoading = false.obs;
  var otp = ''.obs;

  Future<void> verifyOtp() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulate API call
    isLoading.value = false;
    Get.snackbar('Success', 'OTP verified successfully');
    // Add navigation to new password screen here if needed
  }

  Future<void> resendOtp() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call
    isLoading.value = false;
    Get.snackbar('Success', 'New OTP sent to your email');
  }
}
import 'package:get/get.dart';

class OtpController extends GetxController {
  var isLoading = false.obs;

  Future<void> sendOtp() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulate API call
    isLoading.value = false;
    Get.snackbar('Success', 'OTP sent to your email');
  }
}
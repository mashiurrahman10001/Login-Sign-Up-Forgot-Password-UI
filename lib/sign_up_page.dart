import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'Sign-Up Controller.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Let's save environment together",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                // Name Field
                TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'e.g. Ahmed Ariyan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // Phone Number Field with Country Code Picker
                TextField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: '17XXXXXXXX',
                    prefixIcon: CountryCodePicker(
                      onChanged: (country) {
                        controller.selectedCountryCode.value = country.dialCode ?? '+880';
                      },
                      initialSelection: 'BD', // Default to Bangladesh
                      favorite: ['+880', 'BD'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      flagWidth: 24,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // Email Field
                TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'user@example.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // Password Field
                Obx(() => TextField(
                  controller: controller.passwordController,
                  obscureText: controller.obscurePassword.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: '********',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () => controller.obscurePassword.toggle(),
                    ),
                  ),
                )),
                SizedBox(height: screenHeight * 0.02),
                // Confirm Password Field
                Obx(() => TextField(
                  controller: controller.confirmPasswordController,
                  obscureText: controller.obscureConfirmPassword.value,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: '********',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscureConfirmPassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () =>
                          controller.obscureConfirmPassword.toggle(),
                    ),
                  ),
                )),
                SizedBox(height: screenHeight * 0.03),
                // Sign Up Button
                Obx(() => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value ? null : controller.signUp,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
                SizedBox(height: screenHeight * 0.03),
                // Or Sign Up With
                Center(
                  child: Text(
                    'Or sign up with',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // Social Login Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Get.snackbar('Google', 'Google sign up clicked'),
                      icon: Image.asset(
                        'assets/images/google_logo.png',
                        width: screenWidth * 0.1,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.snackbar('Facebook', 'Facebook sign up clicked'),
                      icon: Image.asset(
                        'assets/images/facebook_logo.png',
                        width: screenWidth * 0.1,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.snackbar('Microsoft', 'Microsoft sign up clicked'),
                      icon: Image.asset(
                        'assets/images/microsoft_logo.png',
                        width: screenWidth * 0.1,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.snackbar('Apple', 'Apple sign up clicked'),
                      icon: Image.asset(
                        'assets/images/apple.png',
                        width: screenWidth * 0.1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                // Already Have an Account? Sign In
                Center(
                  child: TextButton(
                    onPressed: () => Get.off(() => const SignInPage()),
                    child: Text(
                      "Already have an account? Sign In",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Center(
                  child: Text(
                    'Powered by M360 ICT',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
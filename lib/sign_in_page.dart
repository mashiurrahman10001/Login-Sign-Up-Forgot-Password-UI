import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';
import 'forgot_password_screen.dart';
import 'sign_up_page.dart'; // Ensure this import is added

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
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
                  'Sign In',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Let's sign in together",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                // Email Field
                TextField(
                  controller: emailController,
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
                // Password Field with Visibility Toggle
                Obx(() => TextField(
                  controller: passwordController,
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
                // Remember Me and Forgot Password Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(() => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: controller.toggleRememberMe,
                        )),
                        Text(
                          'Remember Me',
                          style: TextStyle(fontSize: screenWidth * 0.035),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => Get.to(() => ForgotPasswordScreen()),
                      child: Text(
                        'Forgotten Password?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                // Sign In Button
                Obx(() => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        Get.snackbar('Error', 'Please fill in all fields');
                        return;
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(emailController.text)) {
                        Get.snackbar('Error', 'Invalid email address');
                        return;
                      }
                      if (passwordController.text.length < 8) {
                        Get.snackbar('Error', 'Password must be at least 8 characters');
                        return;
                      }
                      await controller.signIn();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32), // Match Figma design
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
                SizedBox(height: screenHeight * 0.03),
                // Or Sign In With
                Center(
                  child: Text(
                    'Or sign in with',
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
                      onPressed: () => Get.snackbar('Google', 'Google sign in clicked'),
                      icon: Image.asset(
                        'assets/images/google_logo.png',
                        width: screenWidth * 0.1,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.snackbar('Facebook', 'Facebook sign in clicked'),
                      icon: Image.asset(
                        'assets/images/facebook_logo.png',
                        width: screenWidth * 0.1,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.snackbar('Microsoft', 'Microsoft sign in clicked'),
                      icon: Image.asset(
                        'assets/images/microsoft_logo.png',
                        width: screenWidth * 0.1,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.snackbar('Apple', 'Apple sign in clicked'),
                      icon: Image.asset(
                        'assets/images/apple.png',
                        width: screenWidth * 0.1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                // Don't Have an Account? Sign Up
                Center(
                  child: TextButton(
                    onPressed: () => Get.to(() => const SignUpPage()),
                    child: Text(
                      "Don't have an account? Sign Up",
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
                    'Powered by M360 ICT', // Fixed typo to match other screens
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
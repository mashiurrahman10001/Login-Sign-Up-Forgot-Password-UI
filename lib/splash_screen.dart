import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Add the navigation logic here in the build method
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const SignInPage());
    });

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/leaf_logo.png',
              width: screenWidth * 0.5,
              height: screenWidth * 0.5,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Powered by M380 ICT',
              style: TextStyle(
                color: Colors.grey,
                fontSize: screenWidth * 0.035,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
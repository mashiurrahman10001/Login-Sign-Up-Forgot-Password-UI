import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ResetPasswordScreen.dart';
// Make sure this path is correct

class OtpVerificationScreen extends StatelessWidget {
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: isSmallScreen ? 32 : 40),

              // Title Section
              Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: isSmallScreen ? 24 : 28,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Recover your account in easy steps',
                style: TextStyle(
                  fontSize: isSmallScreen ? 13 : 14,
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),
              SizedBox(height: isSmallScreen ? 24 : 32),

              // Email Notification
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: isSmallScreen ? 13 : 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                  children: [
                    const TextSpan(text: 'An email has been sent to '),
                    TextSpan(
                      text: email,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Please enter the sent OTP.',
                style: TextStyle(
                  fontSize: isSmallScreen ? 13 : 14,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
              SizedBox(height: isSmallScreen ? 20 : 32),

              // OTP Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: isSmallScreen ? 48 : 56,
                    height: isSmallScreen ? 56 : 64,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 20 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: isSmallScreen ? 24 : 32),

              // Verify Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: isSmallScreen ? 16 : 18),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  onPressed: () {
                    // ✅ Navigate to ResetPasswordScreen
                    Get.to(() => const ResetPasswordScreen());
                  },
                  child: Text(
                    'Verify OTP',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: isSmallScreen ? 18 : 22),

              // Resend Text
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Add resend logic
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: isSmallScreen ? 13 : 14,
                        color: Colors.grey.shade600,
                      ),
                      children: [
                        const TextSpan(text: "Didn’t Receive a code? "),
                        TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(child: Container()),

              // Footer
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isSmallScreen ? 16 : 24),
                  child: Text(
                    'Powered by M360 ICT',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 11 : 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

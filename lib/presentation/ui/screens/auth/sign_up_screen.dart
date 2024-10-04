import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/presentation/ui/screens/auth/login_screen.dart';
import 'package:stylish/presentation/ui/utils/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create an\naccount",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Username or Email',
                  prefixIcon: Icon(Icons.person_outlined),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'ConfirmPassword',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'By clicking the Register button, you agree to the public offer',
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Create Account',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    const Text('- OR Continue with -'),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      children: [
                        _buildSocialMediaLoginIcon(
                            'assets/icons/img.png', () {}),
                        _buildSocialMediaLoginIcon(
                            'assets/icons/img_2.png', () {}),
                        _buildSocialMediaLoginIcon(
                            'assets/icons/img_1.png', () {}),
                      ],
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.black87),
                        text: "I Already Have an Account ",
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: const TextStyle(
                              color: AppColors.themeColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => const LoginScreen());
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSocialMediaLoginIcon(String image, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFFCF3F6),
        border: Border.all(color: AppColors.themeColor),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Image.asset(
          image,
          height: 40,
          width: 40,
        ),
      ),
    ),
  );
}

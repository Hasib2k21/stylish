import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/presentation/ui/screens/auth/login_screen.dart';
import 'package:stylish/presentation/ui/screens/bottom_nav_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/img_3.png',
            height: MediaQuery.of(context).size.height * 1,
            fit: BoxFit.cover,
          ),

           Center(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30),
               child: Column(
                 children: [
                   const Spacer(),
                   const Text(
                     'You want\nAuthentic,here\nyou go!',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 28,
                       fontWeight: FontWeight.bold,
                       color: Colors.white, // Example color
                     ),
                   ),
                   const SizedBox(height: 8),
                   const Text('Find it here, buy it now!'),
                   const SizedBox(height: 20),
                   ElevatedButton(onPressed: (){Get.offAll(()=>const BottomNavScreen());}, child: const Text('Get Started')),
                   const SizedBox(height: 30)
                 ],
               ),
             ),
           ),
        ],
      ),
    );
  }
}
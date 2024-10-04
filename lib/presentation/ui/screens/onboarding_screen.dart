import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/presentation/ui/screens/auth/login_screen.dart';

import '../utils/onboard_demo_data.dart';
import '../widget/onborading/dot_indicator.dart';
import '../widget/onborading/on_board_content.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  final PageController pageCtrl = PageController();

  void changePage(int page) {
    currentPage.value = page;
    pageCtrl.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  bool get isLastPage => currentPage.value == demoData.length - 1;

  bool get isSecondOrThirdPage => currentPage.value > 0;
}

class OnboardingScreen extends StatelessWidget {
  final OnboardingController ctrl = Get.put(OnboardingController());

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text(
                        "${ctrl.currentPage.value + 1}/${demoData.length}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      )),
                  TextButton(
                    onPressed: () {
                      // Skip logic
                      Get.to(() => const LoginScreen());
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: PageView.builder(
                controller: ctrl.pageCtrl,
                itemCount: demoData.length,
                onPageChanged: (value) {
                  ctrl.changePage(value);
                },
                itemBuilder: (context, index) => OnboardContent(
                  illustration: demoData[index]["illustration"],
                  title: demoData[index]["title"],
                  text: demoData[index]["text"],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Centering the dot indicators
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          demoData.length,
                          (index) => DotIndicator(
                            isActive: index == ctrl.currentPage.value,
                          ),
                        ),
                      )),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Previous button only visible on second and later pages
                      Obx(() {
                        return Visibility(
                          visible: ctrl.isSecondOrThirdPage,
                          child: TextButton(
                            onPressed: () {
                              if (ctrl.isSecondOrThirdPage) {
                                ctrl.changePage(ctrl.currentPage.value - 1);
                              }
                            },
                            child: const Text(
                              "Prev",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      }),

                      // Next Button or Get Started
                      Obx(() {
                        return TextButton(
                          onPressed: () {
                            if (ctrl.isLastPage) {
                              Get.to(() => const LoginScreen());
                            } else {
                              ctrl.changePage(ctrl.currentPage.value + 1);
                            }
                          },
                          child: Text(
                            ctrl.isLastPage ? "Get Started" : "Next",
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}









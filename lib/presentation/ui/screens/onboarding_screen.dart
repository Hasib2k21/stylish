import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      Get.to(() => const NextPage());
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
                              Get.to(() => const NextPage());
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

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.text,
  });

  final String? illustration, title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: 300,
            child: Image.asset(
              illustration ?? '',
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10), // Adjust space between title and text
          Text(
            text ?? '',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.grey,
                  height: 1.5,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 16 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

List<Map<String, dynamic>> demoData = [
  {
    "illustration": "assets/images/img.png",
    "title": "Choose Products",
    "text":
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
  },
  {
    "illustration": "assets/images/img_1.png",
    "title": "Make Payment",
    "text":
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
  },
  {
    "illustration": "assets/images/img_2.png",
    "title": "Get Your Order",
    "text":
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
  },
];

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Page')),
      body: const Center(
        child: Text('You are on the next page now!'),
      ),
    );
  }
}

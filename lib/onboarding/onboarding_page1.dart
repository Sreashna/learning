import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_controller.dart';
import 'onboarding_widget.dart';

class OnboardingPage1 extends StatelessWidget {
  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      image: "assets/images/onboarding1.png",
      title: "Smarter Learning\nStarts Here",
      description: "Personalized lessons that adapt to your pace and goals.",
      activeDot: 0,
      onNext: controller.goToPage2,
      onSkip: controller.finishOnboarding,
    );
  }
}

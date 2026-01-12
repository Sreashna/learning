import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_controller.dart';
import 'onboarding_widget.dart';

class OnboardingPage2 extends StatelessWidget {
  final controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      image: "assets/images/onboarding2.png",
      title: "Learn. Practice.\nSucceed.",
      description:
      "Structured lessons, mock tests, and progress tracking in one place.",
      activeDot: 1,
      onNext: controller.finishOnboarding,
      onSkip: controller.finishOnboarding,

      // Page 2 fine tuning
      imageScale: 1.0,
      imageShiftX: 0.05,   // 5% of screen width to the right
      imageShiftY: -0.02,  // 2% of screen height upwards

    );


  }
}

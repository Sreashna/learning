import 'package:get/get.dart';
import '../app/routes.dart';
import '../app/storage.dart';

class OnboardingController extends GetxController {

  void goToPage2() {
    Get.toNamed(AppRoutes.onboarding2);
  }

  void finishOnboarding() {
    AppStorage.completeOnboarding();
    Get.offAllNamed(AppRoutes.home);
  }
}

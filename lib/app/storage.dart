import 'package:get_storage/get_storage.dart';

class AppStorage {
  static final box = GetStorage();
  static const String onboardingDone = "onboarding_done";

  static bool isOnboardingDone() {
    return box.read(onboardingDone) ?? false;
  }

  static void completeOnboarding() {
    box.write(onboardingDone, true);
  }
}

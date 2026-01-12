import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/streak/streak_screen.dart';
import 'package:untitled/video/video_screen.dart';
import 'app/routes.dart';
import 'app/storage.dart';
import 'onboarding/onboarding_page1.dart';
import 'onboarding/onboarding_page2.dart';
import 'home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final startRoute = AppStorage.isOnboardingDone()
        ? AppRoutes.home
        : AppRoutes.onboarding1;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: startRoute,
      getPages: [
        GetPage(name: AppRoutes.onboarding1, page: () => OnboardingPage1()),
        GetPage(name: AppRoutes.onboarding2, page: () => OnboardingPage2()),
        GetPage(name: AppRoutes.home, page: () => HomePage()),
        GetPage(
          name: AppRoutes.learning,
          page: () => const VideoPage(),
        ),
        GetPage(name: AppRoutes.streak, page: () => StreakPage()),

      ],
    );
  }
}

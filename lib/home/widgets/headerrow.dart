import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/streak_controller.dart';
import '../../app/routes.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final streakController = Get.find<StreakController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Row(
        children: [
          Expanded(
            child: Obx(() => Text(
              homeController.greeting.value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )),
          ),

          /// 🔥 Day button
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.streak);
            },
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Obx(() => Text(
                "Day ${streakController.currentDay.value} 🔥",
                style: const TextStyle(fontWeight: FontWeight.w600),
              )),
            ),
          ),

          const SizedBox(width: 10),

          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

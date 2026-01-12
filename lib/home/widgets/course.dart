import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';

class ActiveCourseCard extends StatelessWidget {
  const ActiveCourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2643C4),
            Color(0xFF2F80ED),
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            final percent = (controller.courseProgress.value * 100).toInt();
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    value: controller.courseProgress.value,
                    strokeWidth: 7,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation(Color(0xFFFFC83D)),
                  ),
                ),
                Text(
                  "$percent%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            );
          }),

          const SizedBox(width: 14),

          /// Right Side Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Course title
                Obx(() => Text(
                  controller.activeCourseTitle.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                )),

                const SizedBox(height: 6),

                /// Tests + Buttons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Tests row
                    Obx(() => Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 14,
                          color: Color(0xFFFFC83D),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${controller.completedTests.value}/${controller.totalTests.value} Tests",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )),

                    const SizedBox(height: 8),

                    /// Buttons BELOW test text
                    Row(
                      children: [
                        _pillButton(
                          "Continue >>>",
                          const Color(0xFF00C2A8),
                        ),
                        const SizedBox(width: 8),
                        _pillButton(
                          "Shift Course",
                          const Color(0xFF18D0E5),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pillButton(String text, Color color) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

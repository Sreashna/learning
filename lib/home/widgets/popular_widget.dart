import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import 'card_widget.dart';

class PopularCoursesWidget extends StatelessWidget {
  const PopularCoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      if (controller.popularCategories.isEmpty) {
        return const SizedBox();
      }

      final categories = controller.popularCategories;
      final selectedIndex = controller.selectedPopularIndex.value;
      final courses = categories[selectedIndex]['courses'] as List;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Popular Courses",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text(
                "View all",
                style: TextStyle(
                  color: Color(0xFF00ABBC),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          /// Chips
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(categories.length, (i) {
              final selected = i == selectedIndex;
              return GestureDetector(
                onTap: () => controller.selectedPopularIndex.value = i,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color(0xFF00ABBC)
                        : const Color(0xFFEAF9FB),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    categories[i]['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: selected
                          ? Colors.white
                          : const Color(0xFF00ABBC),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 8),

          GridView.builder(
            itemCount: courses.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
                childAspectRatio: 0.9
            ),
            itemBuilder: (context, index) {
              return PopularCard(courses[index]);
            },
          ),
        ],
      );
    });
  }
}

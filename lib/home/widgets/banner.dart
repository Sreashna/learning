import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      if (controller.heroBanners.isEmpty) return const SizedBox();

      return Column(
        children: [
          SizedBox(
            height: 150,
            child: PageView.builder(
              controller:
              PageController(initialPage: controller.bannerIndex.value),
              onPageChanged: (i) => controller.bannerIndex.value = i,
              itemCount: controller.heroBanners.length,
              itemBuilder: (_, i) {
                final banner = controller.heroBanners[i];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00ABBC), Color(0xFF2F80ED)],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          banner['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Image.network(banner['image'], width: 120),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.heroBanners.length,
                  (i) => Obx(() => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: controller.bannerIndex.value == i ? 10 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: controller.bannerIndex.value == i
                      ? const Color(0xFF00ABBC)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
            ),
          ),
        ],
      );
    });
  }
}

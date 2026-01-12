import 'package:flutter/material.dart';

class WhatLearnersSaying extends StatelessWidget {
  const WhatLearnersSaying({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What Learners Are Saying",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 14),

        SizedBox(
          height: 140,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            itemCount: 3,
            itemBuilder: (context, index) => const _TestimonialCard(),
          ),
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _Dot(true),
            _Dot(false),
            _Dot(false),
            _Dot(false),
          ],
        )
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final bool active;
  const _Dot(this.active);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF00ABBC) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF3DBBC6),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: const AssetImage("assets/images/ar.jpg"),
                ), SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Arjun Kp",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text("★★★★★ 4.5",
                        style: TextStyle(color: Colors.white)),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: Color(0xFFF4F6FA),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: const Text(
                "This course completely transformed my approach to personal growth. "
                    "The lessons are practical and inspiring.",
              ),
            ),
          )
        ],
      ),
    );
  }
}




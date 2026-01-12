import 'package:flutter/material.dart';

class CommunityCard extends StatelessWidget {
  const CommunityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Header row
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  color: Color(0xFF00ABBC),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.group,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "General Community",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "2,847 active members",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),

          const SizedBox(height: 14),

          /// Description
          const Text(
            "Connect with learners across all courses. "
                "Share experiences, ask questions, and grow together "
                "in your learning journey.",
            style: TextStyle(
              fontSize: 13,
              color: Colors.black87,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 14),

          /// Join button
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF9FB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                "Join Discussion",
                style: TextStyle(
                  color: Color(0xFF00ABBC),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          /// Footer row
          Row(
            children: [
              SizedBox(
                width: 60,
                height: 22,
                child: Stack(
                  children: const [
                    Positioned(left: 0, child: _MixedAvatar.asset("assets/images/p1.jpg")),
                    Positioned(left: 14, child: _MixedAvatar.asset("assets/images/p2.jpg")),
                    Positioned(left: 28, child: _MixedAvatar.asset("assets/images/p3.jpg")),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "12 recent posts",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
class _MixedAvatar extends StatelessWidget {
  final String path;
  final bool isNetwork;

  const _MixedAvatar.asset(this.path, {super.key}) : isNetwork = false;
  const _MixedAvatar.network(this.path, {super.key}) : isNetwork = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        image: DecorationImage(
          image: isNetwork
              ? NetworkImage(path)
              : AssetImage(path) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}




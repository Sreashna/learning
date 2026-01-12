import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/streak_controller.dart';
import '../data/streak.dart';

class StreakPage extends StatelessWidget {
  const StreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(StreakController());

    return Scaffold(
      body: Obx(() {
        if (c.isLoading.value) return const Center(child: CircularProgressIndicator());

        final days = c.days;
        final today = days.firstWhere((d) => d.isCurrent);

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF8FEFFF), Color(0xFFB9F8FF)],
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(child: CustomPaint(painter: _DottedPathPainter())),

              /// Stars
              Positioned(top: 40, left: 30, child: _star()),
              Positioned(top: 140, right: 40, child: _star()),
              Positioned(bottom: 200, left: 30, child: _star()),
              Positioned(bottom: 90, right: 40, child: _star()),

              ListView.builder(
                padding: const EdgeInsets.only(top: 100, bottom: 120),
                itemCount: days.length,
                itemBuilder: (context, i) {
                  final d = days[i];
                  final left = i % 2 == 1;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 45),
                    child: Align(
                      alignment: left ? Alignment.centerLeft : Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: left ? 50 : 0,
                          right: left ? 0 : 50,
                        ),
                        child: _DayBubble(d),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                top: 290,
                left: 80,
                right: 80,
                child: _TodayCard(today),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _star() => Icon(Icons.star_rounded, color: Colors.white.withOpacity(.6), size: 18);
}

class _TodayCard extends StatelessWidget {
  final StreakDay day;
  const _TodayCard(this.day);

  @override
  Widget build(BuildContext context) {
    final module = day.topic.modules.first;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF00ABBC),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
          ),
          child: Column(
            children: [
              const Text("Today's Topic", style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 6),
              Text(module.name,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(module.description,
                  style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        ClipPath(
          clipper: _TriangleClipper(),
          child: Container(
            width: 20,
            height: 12,
            color: const Color(0xFF00ABBC),
          ),
        )
      ],
    );
  }
}
class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(_) => false;
}
class _DayBubble extends StatelessWidget {
  final StreakDay day;

  const _DayBubble(this.day);

  @override
  Widget build(BuildContext context) {
    final color = day.isCompleted
        ? Colors.green
        : day.isCurrent
        ? const Color(0xFF00ABBC)
        : const Color(0xFF4FD1E0);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: color.withOpacity(.6), blurRadius: 20),
              const BoxShadow(
                  color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
                "Day", style: TextStyle(color: Colors.white70, fontSize: 11)),
            Text("${day.dayNumber}",
                style: const TextStyle(color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        if (day.isCurrent)
          const Positioned(
            bottom: -10,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
              child: Icon(Icons.play_arrow, color: Color(0xFF00ABBC)),
            ),
          ),
      ],
    );
  }
}
class _DottedPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width * .55, 0)
      ..quadraticBezierTo(size.width * .15, size.height * .3, size.width * .55, size.height * .55)
      ..quadraticBezierTo(size.width * .9, size.height * .8, size.width * .5, size.height);

    for (final m in path.computeMetrics()) {
      double d = 0;
      while (d < m.length) {
        canvas.drawPath(m.extractPath(d, d + 8), paint);
        d += 16;
      }
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

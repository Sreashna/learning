import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color primary = Color(0xFF00ABBC);

class OnboardingLayout extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int activeDot;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final double? imageScale;
  final double? imageShiftX;
  final double? imageShiftY;


  const OnboardingLayout({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.activeDot,
    required this.onNext,
    required this.onSkip, this.imageScale, this.imageShiftX, this.imageShiftY,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingTop = MediaQuery.of(context).padding.top;

    final double curveHeight = size.height * 0.46;
    final double logoRadius = 28;
    final double logoRing = 3;
    final double imageUpOffset = size.height * 0.13;

    final double logoCenterY = size.height - curveHeight;

    final double desiredImageHeight = size.height * 0.72;
    final double maxAvailableTop = max(0.0, logoCenterY - (paddingTop + 8));
    final double maxAllowedHeight = maxAvailableTop * 2;
    final double imageHeight = min(desiredImageHeight, maxAllowedHeight);

    final double rawTop = logoCenterY - (imageHeight / 2) - imageUpOffset;
    final double top = max(paddingTop + 8, rawTop);

    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children: [

          /// Model Image
          Positioned(
            top: top,
            left: 0,
            right: 0,
            child: Center(
              child: Transform.translate(
                offset: Offset(
                  (-size.width * 0.12) + (imageShiftX ?? 0),
                  imageShiftY ?? 0,
                ),
                child: SizedBox(
                  height: imageHeight * (imageScale ?? 1),
                  width: size.width * 1.3 * (imageScale ?? 1),
                  child: Image.asset(image, fit: BoxFit.contain),
                ),
              ),
            ),
          ),

          /// White Curve
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: curveHeight,
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(height: 52),
                    Text(title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 34),
                      child: Text(description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black54)),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                            (i) => dot(i == activeDot),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: onNext,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          child: const Text("Next"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: onSkip,
                      child:
                      const Text("Skip", style: TextStyle(color: primary)),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Logo
          Positioned(
            top: logoCenterY - logoRadius,
            left: 0,
            right: 0,
            child: Container(
              width: logoRadius * 2,
              height: logoRadius * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: logoRing),
              ),
              child: Center(
                child: CircleAvatar(
                  radius: logoRadius - logoRing,
                  backgroundColor: primary,
                  child:
                  const Icon(Icons.ac_unit, color: Colors.white, size: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? primary : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}

/// Curve
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 60);
    path.quadraticBezierTo(size.width / 2, -40, size.width, 60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}

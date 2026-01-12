import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  final dynamic item;
  const PopularCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // Background image
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.network(
            item['image'],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        // Bottom white card
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 90,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00ABBC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      item['action'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class QuestionsSection extends StatelessWidget {
  const QuestionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Have any Questions?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "our experts can answer all your\nquestions",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "“How batches work?”",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFFFFE6E6),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset("assets/images/qa.png"),
                  ),
                ),
              ),
            )


          ],
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            // Chat
            Expanded(
              child: _helpButton(
                icon: Icons.chat_bubble_outline,
                text: "Chat with us",
              ),
            ),
            const SizedBox(width: 12),

            // Call
            Expanded(
              child: _helpButton(
                icon: Icons.call_outlined,
                text: "Call us",
              ),
            ),
          ],
        )
      ],
    );
  }

  static Widget _helpButton({
    required IconData icon,
    required String text,
  }) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: Colors.black87),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

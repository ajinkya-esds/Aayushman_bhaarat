import 'package:flutter/material.dart';

class ChatBubbleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Chat Bubble
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50], // Light blue color
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "How active are you in daily life?",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            // Triangle Arrow (Using Positioned)
            Positioned(
              left: -8, // Adjust position
              top: 10,
              child: CustomPaint(
                painter: ChatBubbleTriangle(Colors.blue[50]!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Triangle for Bubble
class ChatBubbleTriangle extends CustomPainter {
  final Color color;
  ChatBubbleTriangle(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    var path = Path();

    path.moveTo(-5, 10);
    path.lineTo(10, 0);
    path.lineTo(10, 20);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

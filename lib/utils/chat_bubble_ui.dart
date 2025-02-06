import 'package:flutter/material.dart';

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
